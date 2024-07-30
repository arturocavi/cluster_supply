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


------------------------- CLUSTER DE ELECTRÓNICA (id_clu = 2) -------------------------


---------- Producción Bruta (produccion) ----------


-- Clasificación 1
-- elec_prod_tabl_cla1.csv
WITH
    t1 AS(
        SELECT 
            a.id_act,
            actividad
        FROM actividades a
        JOIN clusters_actividades ca
        ON a.id_act = ca.id_act
        JOIN subsector s
        ON s.id_sub = a.id_sub
        WHERE
            id_clu = 2
            AND id_cla = 1
    ),

    t2 AS(
        SELECT
            i.id_act,
            produccion/0.80734756960351 AS "2013"
        FROM ind_eco i
        JOIN t1
        ON i.id_act = t1.id_act
        WHERE
            id_ent = 14
            AND anio = 2014
    ),

    t3 AS(
        SELECT
            i.id_act,
            produccion AS "2018"
        FROM ind_eco i
        JOIN t1
        ON i.id_act = t1.id_act
        WHERE
            id_ent = 14
            AND anio = 2019
    )

SELECT
    t1.id_act "Código SCIAN",
    t1.actividad "Actividad económica",
    t2."2013",
    t3."2018", 
    t3."2018"- t2."2013" "Var real",
    t3."2018"/t2."2013" - 1 "Var %"
FROM t1
LEFT JOIN t2
ON t1.id_act = t2.id_act
LEFT JOIN t3
ON t1.id_act = t3.id_act
ORDER BY 1;




-- Clasificación 2
-- elec_prod_tabl_cla2.csv
WITH
    t1 AS(
        SELECT 
            a.id_act,
            actividad
        FROM actividades a
        JOIN clusters_actividades ca
        ON a.id_act = ca.id_act
        JOIN subsector s
        ON s.id_sub = a.id_sub
        WHERE
            id_clu = 2
            AND id_cla = 2
    ),

    t2 AS(
        SELECT
            i.id_act,
            produccion/0.80734756960351 AS "2013"
        FROM ind_eco i
        JOIN t1
        ON i.id_act = t1.id_act
        WHERE
            id_ent = 14
            AND anio = 2014
    ),

    t3 AS(
        SELECT
            i.id_act,
            produccion AS "2018"
        FROM ind_eco i
        JOIN t1
        ON i.id_act = t1.id_act
        WHERE
            id_ent = 14
            AND anio = 2019
    )

SELECT
    t1.id_act "Código SCIAN",
    t1.actividad "Actividad económica",
    t2."2013",
    t3."2018", 
    t3."2018"- t2."2013" "Var real",
    t3."2018"/t2."2013" - 1 "Var %"
FROM t1
LEFT JOIN t2
ON t1.id_act = t2.id_act
LEFT JOIN t3
ON t1.id_act = t3.id_act
ORDER BY 1;



-- Clasificación 3
-- elec_prod_tabl_cla3.csv
WITH
    t1 AS(
        SELECT 
            a.id_act,
            actividad
        FROM actividades a
        JOIN clusters_actividades ca
        ON a.id_act = ca.id_act
        JOIN subsector s
        ON s.id_sub = a.id_sub
        WHERE
            id_clu = 2
            AND id_cla = 3
    ),

    t2 AS(
        SELECT
            i.id_act,
            produccion/0.80734756960351 AS "2013"
        FROM ind_eco i
        JOIN t1
        ON i.id_act = t1.id_act
        WHERE
            id_ent = 14
            AND anio = 2014
    ),

    t3 AS(
        SELECT
            i.id_act,
            produccion AS "2018"
        FROM ind_eco i
        JOIN t1
        ON i.id_act = t1.id_act
        WHERE
            id_ent = 14
            AND anio = 2019
    )

SELECT
    t1.id_act "Código SCIAN",
    t1.actividad "Actividad económica",
    t2."2013",
    t3."2018", 
    t3."2018"- t2."2013" "Var real",
    t3."2018"/t2."2013" - 1 "Var %"
FROM t1
LEFT JOIN t2
ON t1.id_act = t2.id_act
LEFT JOIN t3
ON t1.id_act = t3.id_act
ORDER BY 1;