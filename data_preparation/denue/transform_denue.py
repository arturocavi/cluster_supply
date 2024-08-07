# DENUE Data Transformation for Comparative Tables 2019-2024

import pandas as pd

# Original DENUE data
denue_o19 = pd.read_csv('denue_14_0419_csv.csv',index_col=False,encoding='latin-1')
denue_o24 = pd.read_csv('denue_14_csv.csv',index_col=False,encoding='latin-1')

# Cluster activities selection
actividades = pd.read_csv('actividades_clusters.csv', index_col=False, encoding='latin-1')

# 2019 and 2024 tables with id and activity code data.
# Filtering cluster activity data
denue2019 = denue_o19[['id','codigo_act']]
denue2019['anio'] = 2019
denue2019 = denue2019[denue2019.codigo_act.isin(actividades.codigo_act)]

denue2024 = denue_o24[['id','codigo_act']]
denue2024['anio'] = 2024
denue2024 = denue2024[denue2024.codigo_act.isin(actividades.codigo_act)]

# Append data from DENUE 2019 and 2024
datos_denue = pd.concat([denue2019,denue2024])

# Rearrange DENUE columns
datos_denue = datos_denue.reindex(columns='anio id codigo_act'.split())

# Rename activity code
datos_denue.rename(columns={'id':'id_denue','codigo_act':'id_act'}, inplace=True)

# Export to CSV
datos_denue.to_csv('datos_denue.csv', index=False, encoding='cp1252')