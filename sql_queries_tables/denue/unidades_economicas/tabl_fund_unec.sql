/*
Tablas por Cluster y Variable
Clasificaciones:
    id_cla      clasificacion
    1           Manufactura de productos no metálicos
    2           Manufactura de productos metálicos e industrias metálicas básicas
    3           Manufactura de maquinaria y electrónicos
    4           Manufactura de equipo de transporte
    5           Comercio y servicios de reparación y mantenimiento
*/


------------------------- CLUSTER DE FUNDICIÓN (id_clu = 3) -------------------------


---------- Unidades Económicas (COUNT) ----------


-- Clasificación 1
-- fund_unec_tabl_cla1.csv
WITH
    t1 AS(
        SELECT
            a.id_act,
            a.actividad
        FROM actividades a
        JOIN subsector s
        ON a.id_sub = s.id_sub
        JOIN clasificacion cla
        ON s.id_cla = cla.id_cla
        JOIN clusters_actividades ca
        ON a.id_act = ca.id_act
        JOIN clusters c
        ON ca.id_clu = c.id_clu
        WHERE
            c.id_clu = 3
            AND cla.id_cla = 1
    ),

    t2 AS(
        SELECT 
            d.id_act,
            COUNT(*) AS "2019"
        FROM t1
        JOIN denue d
        ON d.id_act = t1.id_act
        WHERE anio = 2019
        GROUP by 1
    ),

    t3 AS(
        SELECT 
            d.id_act,
            COUNT(*) AS "2024"
        FROM denue d
        JOIN t1
        ON d.id_act = t1.id_act
        WHERE anio = 2024
        GROUP by 1
    )
    
SELECT
    t1.id_act AS "Código SCIAN",
    t1.actividad AS "Actividad económica",
    t2."2019",
    t3."2024",
    t3."2024" -  t2."2019" AS "Var absoluta",
    CAST(t3."2024" AS FLOAT)/CAST(t2."2019" AS FLOAT) - 1 AS "Var %"
FROM t1
LEFT JOIN t2
ON t1.id_act = t2.id_act
LEFT JOIN t3
ON t1.id_act = t3.id_act
ORDER BY 1;



-- Clasificación 2
-- fund_unec_tabl_cla2.csv
WITH
    t1 AS(
        SELECT
            a.id_act,
            a.actividad
        FROM actividades a
        JOIN subsector s
        ON a.id_sub = s.id_sub
        JOIN clasificacion cla
        ON s.id_cla = cla.id_cla
        JOIN clusters_actividades ca
        ON a.id_act = ca.id_act
        JOIN clusters c
        ON ca.id_clu = c.id_clu
        WHERE
            c.id_clu = 3
            AND cla.id_cla = 2
    ),

    t2 AS(
        SELECT 
            d.id_act,
            COUNT(*) AS "2019"
        FROM t1
        JOIN denue d
        ON d.id_act = t1.id_act
        WHERE anio = 2019
        GROUP by 1
    ),

    t3 AS(
        SELECT 
            d.id_act,
            COUNT(*) AS "2024"
        FROM denue d
        JOIN t1
        ON d.id_act = t1.id_act
        WHERE anio = 2024
        GROUP by 1
    )
    
SELECT
    t1.id_act AS "Código SCIAN",
    t1.actividad AS "Actividad económica",
    t2."2019",
    t3."2024",
    t3."2024" -  t2."2019" AS "Var absoluta",
    CAST(t3."2024" AS FLOAT)/CAST(t2."2019" AS FLOAT) - 1 AS "Var %"
FROM t1
LEFT JOIN t2
ON t1.id_act = t2.id_act
LEFT JOIN t3
ON t1.id_act = t3.id_act
ORDER BY 1;