-- Query for cifras table

-- Download from "Save Results/Save results as CSV" in VS C
SELECT *
FROM ind_eco
WHERE
    id_ent != 33
    AND id_act != 999999
ORDER BY anio, id_ent, id_act;




COPY (
    SELECT *
    FROM ind_eco
    WHERE
        id_ent != 33
        AND id_act != 999999
    ORDER BY anio, id_ent, id_act
)
TO 'C:\Users\Public\Downloads\cifras.csv'
WITH DELIMITER ','
CSV HEADER;




