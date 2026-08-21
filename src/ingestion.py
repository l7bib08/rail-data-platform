import requests
import pandas as pd
import sys
import os 
from datetime import datetime
from sqlalchemy import create_engine
from dotenv import load_dotenv



url = sys.argv[1] if len(sys.argv) > 1 else "https://ressources.data.sncf.com/api/explore/v2.1/catalog/datasets/frequentation-gares/records?limit=20"



load_dotenv()
connection_string = f"postgresql+psycopg2://{os.environ.get('WAREHOUSE_DB_USER')}:{os.environ.get('WAREHOUSE_DB_PASSWORD')}@postgres_warehouse/{os.environ.get('WAREHOUSE_DB_NAME')}"
engine = create_engine(connection_string)


try:
    response = requests.get(url)
    if response.status_code == 200:
        data = response.json()
        df = pd.DataFrame(data["results"])
        date_du_jour = datetime.now().strftime("%Y-%m-%d")
        df["date_ingestion"] = date_du_jour
        df.to_parquet(f"raw/frequentation_{date_du_jour}.parquet", index=False)
        df.to_sql("raw_frequentation", engine, if_exists="append", index=False)

        print(df.head())
        print(df.columns)
        print(df.shape)
    else:
        print(f"Erreur API: {response.status_code}")

except requests.exceptions.RequestException as e:
    print(f"Erreur réseau: {e}")