# Load DENUE to PostgreSQL

# Import libraries
import pandas as pd
from sqlalchemy import create_engine
from sqlalchemy_utils import create_database

# Import CSV & Excel files
denue = pd.read_csv('datos_denue.csv', index_col=False, encoding='cp1252')
actividades = pd.read_excel('dim_tab.xlsx', sheet_name='actividades')
clusters_actividades = pd.read_excel('dim_tab.xlsx', sheet_name='clusters_actividades')
clusters = pd.read_excel('dim_tab.xlsx', sheet_name='clusters')
subsector = pd.read_excel('dim_tab.xlsx', sheet_name='subsector')
clasificacion = pd.read_excel('dim_tab.xlsx', sheet_name='clasificacion')

# PostgreSQL Engine
engine = 'postgresql://postgres:postgresql@localhost/clusters_denue'
db = create_engine(engine)

# Create Database
create_database(db.url)

# Connection
conn = db.connect()


# Load DataFrames to Database
denue.to_sql('denue', con=conn, if_exists='replace', index=False)
actividades.to_sql('actividades', con=conn, if_exists='replace', index=False)
clusters_actividades.to_sql('clusters_actividades', con=conn, if_exists='replace', index=False)
clusters.to_sql('clusters', con=conn, if_exists='replace', index=False)
subsector.to_sql('subsector', con=conn, if_exists='replace', index=False)
clasificacion.to_sql('clasificacion', con=conn, if_exists='replace', index=False)






