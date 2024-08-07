# Filter Jalisco DENUE 2024 for Dashboard

import pandas as pd

denue = pd.read_csv('denue_inegi_14_.csv',index_col=False, encoding='latin-1')

actividades = pd.read_excel('clusters_actividades.xlsx', sheet_name='actividades')

# Selection of DENUE Variables
datos = denue['id nom_estab raz_social codigo_act per_ocu telefono correoelec www nom_vial numero_ext cve_mun municipio latitud longitud'.split()]

# Format of Capital Letters
datos['nom_estab raz_social nom_vial municipio'.split()] = datos['nom_estab raz_social nom_vial municipio'.split()].apply(lambda x: x.str.title())
datos['correoelec www'.split()] = datos['correoelec www'.split()].apply(lambda x: x.str.lower())

# Filter cluster activities
datos = datos[datos['codigo_act'].isin(actividades['id_act'])]

# Export to CSV
datos.to_csv('denue_csv.csv', index=False, encoding="cp1252")