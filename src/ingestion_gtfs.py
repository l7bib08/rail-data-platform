import requests
import sys
import os
from datetime import datetime
import pandas as pd
import zipfile
from sqlalchemy import create_engine
from dotenv import load_dotenv


load_dotenv()
connection_string = f"postgresql+psycopg2://{os.environ.get('WAREHOUSE_DB_USER')}:{os.environ.get('WAREHOUSE_DB_PASSWORD')}@postgres_warehouse/{os.environ.get('WAREHOUSE_DB_NAME')}"
engine = create_engine(connection_string)

url = sys.argv[1] if len(sys.argv) > 1 else "https://eu.ftp.opendatasoft.com/sncf/plandata/Export_OpenData_SNCF_GTFS_NewTripId.zip"

response = requests.get(url)
data = response.content
date_du_jour = datetime.now().strftime("%Y-%m-%d")

with open(f"raw/gtfs_{date_du_jour}.zip", "wb") as file:
    file.write(data)

fichiers = ["stops.txt", "routes.txt", "trips.txt", "stop_times.txt"]

with zipfile.ZipFile(f"raw/gtfs_{date_du_jour}.zip", "r") as archive:
    dfs = {}
    for fichier in fichiers:
        with archive.open(fichier) as f:
            dfs[fichier] = pd.read_csv(f)

    for fichier in fichiers:
        nom = fichier.replace(".txt", "")
        dfs[fichier].to_parquet(f"raw/gtfs_{nom}_{date_du_jour}.parquet", index=False)