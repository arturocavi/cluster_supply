# Import libraries
import pandas as pd
import os
import glob
import zipfile

# Directory
dir = r'C:\Users\arturo.carrillo\Documents\cluster_supply\data_preparation'
os.chdir(dir)



# "Indicadores Económicos" table
# Zip Files that contains the CSV files to concatenate
zip_files = glob.glob('Datos Abiertos CE/*.zip')

# EF Abbreviation
abr = list(map(lambda x:x.split('_')[2].upper(), zip_files))

# Year
anio = list(map(lambda x:x.split('_')[1][2:],zip_files))

# Read Excel file for "Actividades" table to filter activities in clusters
actividades = pd.read_excel('clusters_actividades.xlsx', sheet_name='actividades')

# Concatenate CSV files into a DataFrame
cifras = pd.DataFrame()
i=0

for file in zip_files:
    # Extract file of interest
    zf  = zipfile.ZipFile(file, mode = 'r')
    folder = [name for name in zf.namelist() if name.startswith('conjunto_de_datos/ce')][0]
    zf.extract(folder)

    # Read CSV file
    csv_path = glob.glob('conjunto_de_datos/*.csv')[0]
    ef = pd.read_csv(csv_path,index_col=False)

    # Delete extracted file and folder no longer needed
    os.remove(os.path.join(dir, csv_path))
    os.rmdir(os.path.join(dir, 'conjunto_de_datos'))

    # Select columns to filter
    ef = ef['ENTIDAD MUNICIPIO CODIGO ID_ESTRATO UE A111A H001A Q000A'.split()]

    # Filter rows
    # (Total por Clase de Actividad a nivel EF y Total EF)
    ef = ef[
        ((ef['MUNICIPIO'] == '\t') & (ef['CODIGO'].isna()) & (ef['ID_ESTRATO'].isna()))
        |
        ((ef['MUNICIPIO'] == '\t') & (ef['CODIGO'].str.len() == 6) & (ef['ID_ESTRATO'].isna()))
        |
        ((ef['MUNICIPIO'] == ' ') & (ef['CODIGO'] == ' ') & (ef['ID_ESTRATO'].isna()))
        |
        ((ef['MUNICIPIO'] == ' ') & (ef['CODIGO'].str.len() == 6) & (ef['ID_ESTRATO'].isna()))
        ]

    # Delete columns no longer needed
    ef = ef.drop(columns = ['MUNICIPIO','ID_ESTRATO'])

    # Change CODIGO of totals from ' ' to '999999' and change type to integer
    try:
        ef['CODIGO'] = ef['CODIGO'].str.replace(' ','999999').astype(int)
    except ValueError:
        ef['CODIGO'] = ef['CODIGO'].fillna(999999).astype(int)

    # Set Nacional ENTIDAD id to 33
    if abr[i] == 'NAC':
        ef['ENTIDAD'] = 33

    # Add short EF column
    ef['ENT'] = abr[i]

    #Add year column
    ef['ANIO'] = anio[i]

    i += 1

    # Filter activities of interest
    ef = ef[ef.CODIGO.isin(actividades.id_act)]

    # Rearrange Columns
    ef = ef.reindex(columns='ANIO ENTIDAD ENT CODIGO UE A111A H001A Q000A'.split())

    # Append EF to cifras table
    cifras = pd.concat([cifras,ef], ignore_index=True)


# Get ENTIDAD & ENT Values for entidades table
entidades = cifras[['ENTIDAD','ENT']].drop_duplicates().sort_values(by='ENTIDAD')

# Transform cifras table into "indicadores económicos" table
ind_eco = cifras.drop(columns='ENT')
ind_eco.rename(columns= {'ENTIDAD':'id_ent','CODIGO':'id_act','ANIO':'anio','UE':'unidades_eco','A111A':'produccion','H001A':'personal','Q000A':'activos'}, inplace=True)

#Change data types
ind_eco['anio'] = ind_eco['anio'].astype(int)
ind_eco['produccion'] = pd.to_numeric(ind_eco['produccion'], errors='coerce')
ind_eco['personal'] = pd.to_numeric(ind_eco['personal'], errors='coerce')
ind_eco['activos'] = pd.to_numeric(ind_eco['activos'], errors='coerce')

#Sort by Columns
ind_eco.sort_values(['anio','id_ent','id_act'], inplace=True)



# "Entidades Nombres" table
# Import EF Names table an join to entidades table
entidad_nombre = pd.read_csv('entidad_nombre.csv', index_col=False,  encoding="cp1252")

# Join entidades & entidad_nombre tables
ent_nombre = pd.merge(entidades,entidad_nombre, on='ENTIDAD')

# Change column names of "entidades nombres" table
ent_nombre.rename(columns = {'ENTIDAD':'id_ent', 'ENT':'ent','NOMBRE_OFICIAL':'nom_ofi','NOM_ENT':'nom_ent'}, inplace=True)



# Read Excel files for "Clusters" and "Clusters-Actividades Relations" Tables
clusters = pd.read_excel('clusters_actividades.xlsx', sheet_name='clusters')
clusters_actividades = pd.read_excel('clusters_actividades.xlsx', sheet_name='clusters_actividades')


# Export Data to a single Excel file
with pd.ExcelWriter("base.xlsx") as ew:
    ind_eco.to_excel(ew, sheet_name="indicadores", index=False)
    ent_nombre.to_excel(ew, sheet_name="entidades", index=False)
    clusters.to_excel(ew, sheet_name="clusters", index=False)
    actividades.to_excel(ew, sheet_name="actividades", index=False)
    clusters_actividades.to_excel(ew, sheet_name="clusters_actividades", index=False)
