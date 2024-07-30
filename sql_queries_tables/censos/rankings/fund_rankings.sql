/*
Rankings por Cluster 
    Porcentajes del total estatal
    Participación del total nacional
*/




------------------------- CLUSTER DE FUNDICIÓN (3) -------------------------


---------- Producción Bruta ----------

-- Porcentaje del total estatal
-- Guardar como fund_prod_pct_ef.csv
WITH
    total_ef AS(
        SELECT id_ent, produccion AS ind_total
        FROM ind_eco
        WHERE
            id_act = 999999
            AND anio = 2019
        ORDER BY 1
    ),

    ef AS(
        SELECT e.id_ent, nom_ent, SUM(produccion) AS ind_ef
        FROM ind_eco i
        JOIN ent_nombre e
        ON e.id_ent = i.id_ent
        JOIN actividades a
        ON i.id_act = a.id_act
        JOIN clusters_actividades ca
        ON ca.id_act = a.id_act
        JOIN clusters c
        ON c.id_clu = ca.id_clu
        WHERE
            a.id_act != 999999
            AND anio = 2019
            AND c.id_clu = 3
        GROUP BY 1,2
        ORDER BY 1
    )

SELECT nom_ent "Entidad Federativa", ind_ef/ind_total "Porcentaje del Total Estatal"
FROM ef
JOIN total_ef t
ON ef.id_ent = t.id_ent
ORDER BY 2;



-- Participación del total nacional
-- Guardar como fund_prod_par_nac.csv
WITH 
    nac AS(
        SELECT SUM(produccion) AS total_nac
        FROM ind_eco i
        JOIN ent_nombre e
        ON i.id_ent = e.id_ent
        JOIN actividades a
        ON i.id_act = a.id_act
        JOIN clusters_actividades ca
        ON a.id_act = ca.id_act
        JOIN clusters c
        ON ca.id_clu = c.id_clu
        WHERE
            e.id_ent = 33
            AND anio = 2019
            AND c.id_clu = 3
        GROUP BY e.id_ent
    ),

    ef AS(
        SELECT e.id_ent, nom_ent, SUM(produccion) AS ind_ef
        FROM ind_eco i
        JOIN ent_nombre e
        ON e.id_ent = i.id_ent
        JOIN actividades a
        ON i.id_act = a.id_act
        JOIN clusters_actividades ca
        ON ca.id_act = a.id_act
        JOIN clusters c
        ON c.id_clu = ca.id_clu
        WHERE
            a.id_act != 999999
            AND e.id_ent != 33
            AND anio = 2019
            AND c.id_clu = 3
        GROUP BY 1,2
        ORDER BY 1
    )

SELECT 
    nom_ent "Entidad Federativa",
    ind_ef/(SELECT total_nac FROM nac) AS "Participación del Total Nacional"
FROM ef
ORDER BY 2;



---------- Personal Ocupado ----------

-- Porcentaje del total estatal
-- Guardar como fund_pers_pct_ef.csv
WITH
    total_ef AS(
        SELECT id_ent, personal AS ind_total
        FROM ind_eco
        WHERE
            id_act = 999999
            AND anio = 2019
        ORDER BY 1
    ),

    ef AS(
        SELECT e.id_ent, nom_ent, SUM(personal) AS ind_ef
        FROM ind_eco i
        JOIN ent_nombre e
        ON e.id_ent = i.id_ent
        JOIN actividades a
        ON i.id_act = a.id_act
        JOIN clusters_actividades ca
        ON ca.id_act = a.id_act
        JOIN clusters c
        ON c.id_clu = ca.id_clu
        WHERE
            a.id_act != 999999
            AND anio = 2019
            AND c.id_clu = 3
        GROUP BY 1,2
        ORDER BY 1
    )

SELECT nom_ent "Entidad Federativa", ind_ef/ind_total "Porcentaje del Total Estatal"
FROM ef
JOIN total_ef t
ON ef.id_ent = t.id_ent
ORDER BY 2;



-- Participación del total nacional
-- Guardar como fund_pers_par_nac.csv
WITH 
    nac AS(
        SELECT SUM(personal) AS total_nac
        FROM ind_eco i
        JOIN ent_nombre e
        ON i.id_ent = e.id_ent
        JOIN actividades a
        ON i.id_act = a.id_act
        JOIN clusters_actividades ca
        ON a.id_act = ca.id_act
        JOIN clusters c
        ON ca.id_clu = c.id_clu
        WHERE
            e.id_ent = 33
            AND anio = 2019
            AND c.id_clu = 3
        GROUP BY e.id_ent
    ),

    ef AS(
        SELECT e.id_ent, nom_ent, SUM(personal) AS ind_ef
        FROM ind_eco i
        JOIN ent_nombre e
        ON e.id_ent = i.id_ent
        JOIN actividades a
        ON i.id_act = a.id_act
        JOIN clusters_actividades ca
        ON ca.id_act = a.id_act
        JOIN clusters c
        ON c.id_clu = ca.id_clu
        WHERE
            a.id_act != 999999
            AND e.id_ent != 33
            AND anio = 2019
            AND c.id_clu = 3
        GROUP BY 1,2
        ORDER BY 1
    )

SELECT 
    nom_ent "Entidad Federativa",
    ind_ef/(SELECT total_nac FROM nac) AS "Participación del Total Nacional"
FROM ef
ORDER BY 2;


---------- Activos Fijos ----------

-- Porcentaje del total estatal
-- Guardar como fund_acti_pct_ef.csv
WITH
    total_ef AS(
        SELECT id_ent, activos AS ind_total
        FROM ind_eco
        WHERE
            id_act = 999999
            AND anio = 2019
        ORDER BY 1
    ),

    ef AS(
        SELECT e.id_ent, nom_ent, SUM(activos) AS ind_ef
        FROM ind_eco i
        JOIN ent_nombre e
        ON e.id_ent = i.id_ent
        JOIN actividades a
        ON i.id_act = a.id_act
        JOIN clusters_actividades ca
        ON ca.id_act = a.id_act
        JOIN clusters c
        ON c.id_clu = ca.id_clu
        WHERE
            a.id_act != 999999
            AND anio = 2019
            AND c.id_clu = 3
        GROUP BY 1,2
        ORDER BY 1
    )

SELECT nom_ent "Entidad Federativa", ind_ef/ind_total "Porcentaje del Total Estatal"
FROM ef
JOIN total_ef t
ON ef.id_ent = t.id_ent
ORDER BY 2;



-- Participación del total nacional
-- Guardar como fund_acti_par_nac.csv
WITH 
    nac AS(
        SELECT SUM(activos) AS total_nac
        FROM ind_eco i
        JOIN ent_nombre e
        ON i.id_ent = e.id_ent
        JOIN actividades a
        ON i.id_act = a.id_act
        JOIN clusters_actividades ca
        ON a.id_act = ca.id_act
        JOIN clusters c
        ON ca.id_clu = c.id_clu
        WHERE
            e.id_ent = 33
            AND anio = 2019
            AND c.id_clu = 3
        GROUP BY e.id_ent
    ),

    ef AS(
        SELECT e.id_ent, nom_ent, SUM(activos) AS ind_ef
        FROM ind_eco i
        JOIN ent_nombre e
        ON e.id_ent = i.id_ent
        JOIN actividades a
        ON i.id_act = a.id_act
        JOIN clusters_actividades ca
        ON ca.id_act = a.id_act
        JOIN clusters c
        ON c.id_clu = ca.id_clu
        WHERE
            a.id_act != 999999
            AND e.id_ent != 33
            AND anio = 2019
            AND c.id_clu = 3
        GROUP BY 1,2
        ORDER BY 1
    )

SELECT 
    nom_ent "Entidad Federativa",
    ind_ef/(SELECT total_nac FROM nac) AS "Participación del Total Nacional"
FROM ef
ORDER BY 2;



---------- Unidades Económicas ----------

-- Porcentaje del total estatal
-- Guardar como fund_unec_pct_ef.csv
WITH
    total_ef AS(
        SELECT id_ent, unidades_eco AS ind_total
        FROM ind_eco
        WHERE
            id_act = 999999
            AND anio = 2019
        ORDER BY 1
    ),

    ef AS(
        SELECT e.id_ent, nom_ent, SUM(unidades_eco) AS ind_ef
        FROM ind_eco i
        JOIN ent_nombre e
        ON e.id_ent = i.id_ent
        JOIN actividades a
        ON i.id_act = a.id_act
        JOIN clusters_actividades ca
        ON ca.id_act = a.id_act
        JOIN clusters c
        ON c.id_clu = ca.id_clu
        WHERE
            a.id_act != 999999
            AND anio = 2019
            AND c.id_clu = 3
        GROUP BY 1,2
        ORDER BY 1
    )

SELECT nom_ent "Entidad Federativa", ind_ef/ind_total "Porcentaje del Total Estatal"
FROM ef
JOIN total_ef t
ON ef.id_ent = t.id_ent
ORDER BY 2;



-- Participación del total nacional
-- Guardar como fund_unec_par_nac.csv
WITH 
    nac AS(
        SELECT SUM(unidades_eco) AS total_nac
        FROM ind_eco i
        JOIN ent_nombre e
        ON i.id_ent = e.id_ent
        JOIN actividades a
        ON i.id_act = a.id_act
        JOIN clusters_actividades ca
        ON a.id_act = ca.id_act
        JOIN clusters c
        ON ca.id_clu = c.id_clu
        WHERE
            e.id_ent = 33
            AND anio = 2019
            AND c.id_clu = 3
        GROUP BY e.id_ent
    ),

    ef AS(
        SELECT e.id_ent, nom_ent, SUM(unidades_eco) AS ind_ef
        FROM ind_eco i
        JOIN ent_nombre e
        ON e.id_ent = i.id_ent
        JOIN actividades a
        ON i.id_act = a.id_act
        JOIN clusters_actividades ca
        ON ca.id_act = a.id_act
        JOIN clusters c
        ON c.id_clu = ca.id_clu
        WHERE
            a.id_act != 999999
            AND e.id_ent != 33
            AND anio = 2019
            AND c.id_clu = 3
        GROUP BY 1,2
        ORDER BY 1
    )

SELECT 
    nom_ent "Entidad Federativa",
    ind_ef/(SELECT total_nac FROM nac) AS "Participación del Total Nacional"
FROM ef
ORDER BY 2;



