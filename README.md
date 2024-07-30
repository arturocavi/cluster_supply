# Cluster Supply Analysis
Dashboards and and studies for the Automotive, Electronics, Foundry and Tooling clusters of Jalisco, Mexico.


## Overview
In order to comprehend the evolution of certain industrial clusters in Jalisco, Mexico regarding certain economic indicators and to identify their position at national level, I created some interactive dashboards and an individual study for each cluster.

Clusters:
- Automotive
- Electronics
- Foundry
- Tooling

Economic indicators:
- Gross production
- Employed personnel
- Fixed assets
- Economic units (establishments)


## Technologies Used
- Python
- SQL
- Tableau
- QGIS


## Functionalities of the Dashboards
- Visualize in a heat map the concentration of establishments.
- The heat map is designed to take into account both the number of establishments and the size (measured by employed personnel).
- Identify suppliers, customers and competition on another map where each selected activity takes a different color.
- Directory with information on the establishments of interest, with data on Company Name, Size, Telephone, Mail, Website and Address.
- Analyze the evolution of economic indicators by State.
- Identify the relative position of Jalisco in these indicators.
- Compare States in these indicators.
- You can customize a table with the values of these indicators to compare States of interest.
- You can customize a graph to see the progress of these indicators for States of interest.
- Filtering by economic activity is allowed for customized queries.
- The heat map and the location and directory map allow filtering by Cluster, Jalisco Region and Municipality for customized queries.


## Interactive Dashboards (Tableau)
Maps prepared with QGIS.

**Heat Map and Directory**\
https://public.tableau.com/views/ProveeduradeClusters2/Mapadecalor?:language=es-ES&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link
[<img src="https://github.com/user-attachments/assets/d93dbdc3-2823-4df5-b44e-3109e2a26cce">](https://public.tableau.com/views/ProveeduradeClusters2/Mapadecalor?:language=es-ES&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)

**Comparisons by State**\
https://public.tableau.com/views/ProveeduradeClusters1/Automotriz?:language=es-ES&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link
[<img src="https://github.com/user-attachments/assets/099c65c1-3bb6-4051-8a8b-cbc02c7b3aad">](https://public.tableau.com/views/ProveeduradeClusters1/Automotriz?:language=es-ES&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)


## Studies
Tables of studies elaborated with SQL queries.
The studies were written in Spanish for the Institute of Statistical and Geographic Information of Jalisco (IIEG).

**Automotive Cluster Study**\
https://iieg.gob.mx/ns/wp-content/uploads/2024/06/Proveeduria-Cluster-Automotriz.pdf

**Electronics Cluster Study**\
https://iieg.gob.mx/ns/wp-content/uploads/2024/06/Proveeduria-Cluster-de-Electronica.pdf

**Foundry Cluster Study**\
https://iieg.gob.mx/ns/wp-content/uploads/2024/06/Proveeduria-Cluster-de-Fundicion.pdf

**Tooling Cluster Study**\
https://iieg.gob.mx/ns/wp-content/uploads/2024/06/Proveeduria-Tooling-Cluster.pdf


## Data Preparation
Data extraction, cleaning, transformation and loading into PostgreSQL was done with Python.
The source of information is from INEGI:
Censos Económicos 2004-2019.
DENUE 2024.
