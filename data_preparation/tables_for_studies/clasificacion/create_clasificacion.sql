-- Add sub_id column in actividades table 
ALTER TABLE actividades
ADD COLUMN id_sub INT;

UPDATE actividades
SET id_sub = CAST(LEFT(CAST(id_act AS VARCHAR), 3) AS INT);




-- Create classification and subsector tables
CREATE TABLE clasificacion
(
    id_cla INT PRIMARY KEY UNIQUE,
	cla_nom TEXT
);


CREATE TABLE subsector
(
	id_sub INT PRIMARY KEY UNIQUE,
	subsector TEXT,
	id_cla INT,
	FOREIGN KEY (id_cla) REFERENCES clasificacion (id_cla)
);




-- Copy contents of classification and sub-sector tables
COPY clasificacion
FROM 'C:\Users\Public\Downloads\clasificacion.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'WINDOWS-1252');

COPY subsector
FROM 'C:\Users\Public\Downloads\subsector.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'WINDOWS-1252');




-- Add list of tables, activities and sub-sector
ALTER TABLE actividades
ADD CONSTRAINT fkas FOREIGN KEY (id_sub) REFERENCES subsector (id_sub);


