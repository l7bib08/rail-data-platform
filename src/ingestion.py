import requests
import pandas as pd
import sys
from datetime import datetime



url = sys.argv[1] if len(sys.argv) > 1 else "https://ressources.data.sncf.com/api/explore/v2.1/catalog/datasets/frequentation-gares/records?limit=20"

try:
    response = requests.get(url)
    if response.status_code == 200:
        data = response.json()
        df = pd.DataFrame(data["results"])
        date_du_jour = datetime.now().strftime("%Y-%m-%d")
        df.to_parquet(f"raw/frequentation_{date_du_jour}.parquet", index=False)

        print(df.head())
        print(df.columns)
        print(df.shape)
    else:
        print(f"Erreur API: {response.status_code}")

except requests.exceptions.RequestException as e:
    print(f"Erreur réseau: {e}")