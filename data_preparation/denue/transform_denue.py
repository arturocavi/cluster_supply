#Transformación de Datos de DENUE para tablas comparativas 2019-2024

import pandas as pd

# Datos originales de DENUE
denue_o19 = pd.read_csv('denue_14_0419_csv.csv',index_col=False,encoding='latin-1')
denue_o24 = pd.read_csv('denue_14_csv.csv',index_col=False,encoding='latin-1')

# Selección de actividades de clusters
actividades = pd.read_csv('actividades_clusters.csv', index_col=False, encoding='latin-1')

# Tablas de 2019 y 2024 con datos de id y código de actividad
# Filtrando datos de actividades de clusters
denue2019 = denue_o19[['id','codigo_act']]
denue2019['anio'] = 2019
denue2019 = denue2019[denue2019.codigo_act.isin(actividades.codigo_act)]

denue2024 = denue_o24[['id','codigo_act']]
denue2024['anio'] = 2024
denue2024 = denue2024[denue2024.codigo_act.isin(actividades.codigo_act)]

# Unir datos de DENUE 2019 y 2024
datos_denue = pd.concat([denue2019,denue2024])

# Reordenar columnas de DENUE
datos_denue = datos_denue.reindex(columns='anio id codigo_act'.split())

# Renombrar código de actividad
datos_denue.rename(columns={'id':'id_denue','codigo_act':'id_act'}, inplace=True)

# Exportar a CSV
datos_denue.to_csv('datos_denue.csv', index=False, encoding='cp1252')