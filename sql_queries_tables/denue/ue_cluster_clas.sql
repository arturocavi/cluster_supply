/*
Tablas comparativas de Unidades Económicas de Clusters por Clasifiación
Con variaciones de 2019 a 2024

Clasificaciones:
    id_cla      clasificacion
    1           Manufactura de productos no metálicos
    2           Manufactura de productos metálicos e industrias metálicas básicas
    3           Manufactura de maquinaria y electrónicos
    4           Manufactura de equipo de transporte
    5           Comercio y servicios de reparación y mantenimiento
*/


------------------------- CLUSTER AUTOMOTRIZ (id_clu = 1) -------------------------
-- auto_tab_com_ue_x_cla.csv

WITH 
    n2019 AS(
        SELECT 
        cla.id_cla,
        COUNT(id_denue) AS n
    FROM denue
    JOIN actividades act
    ON denue.id_act = act.id_act
    JOIN subsector sub
    ON act.id_sub = sub.id_sub
    JOIN clasificacion cla
    ON sub.id_cla = cla.id_cla
    JOIN clusters_actividades ca
    ON ca.id_act = act.id_act
    JOIN clusters clu
    ON clu.id_clu = ca.id_clu
    WHERE
        clu.id_clu = 1
        AND anio = 2019
    GROUP BY 1
    ),

    t19 AS(
        SELECT 
        *,
        n/(SELECT SUM(N) FROM n2019) AS dist
    FROM n2019
    ),

    n2024 AS(
        SELECT 
            cla.id_cla,
            COUNT(id_denue) AS n
        FROM denue
        JOIN actividades act
        ON denue.id_act = act.id_act
        JOIN subsector sub
        ON act.id_sub = sub.id_sub
        JOIN clasificacion cla
        ON sub.id_cla = cla.id_cla
        JOIN clusters_actividades ca
        ON ca.id_act = act.id_act
        JOIN clusters clu
        ON clu.id_clu = ca.id_clu
        WHERE
            clu.id_clu = 1
            AND anio = 2024
        GROUP BY 1
    ),

    t24 AS(
        SELECT 
            *,
            n/(SELECT SUM(N) FROM n2024) AS dist
        FROM n2024
    )

SELECT
    cla.clasificacion AS "Clasificación",
    t19.n AS "N 2019",
    t19.dist AS "Dist% 2019",
    t24.n AS "N 2024",
    t24.dist AS "Dist% 2024",
    t24.n - t19.n AS "Var Absoluta",
    CAST(t24.n AS FLOAT)/CAST(t19.n AS FLOAT) - 1 AS "Var %"
FROM t19
FULL OUTER JOIN t24
ON t19.id_cla = t24.id_cla
JOIN clasificacion cla
ON cla.id_cla = t19.id_cla;






------------------------- CLUSTER DE ELECTRÓNICA (id_clu = 2) -------------------------
-- elec_tab_com_ue_x_cla.csv

WITH 
    n2019 AS(
        SELECT 
        cla.id_cla,
        COUNT(id_denue) AS n
    FROM denue
    JOIN actividades act
    ON denue.id_act = act.id_act
    JOIN subsector sub
    ON act.id_sub = sub.id_sub
    JOIN clasificacion cla
    ON sub.id_cla = cla.id_cla
    JOIN clusters_actividades ca
    ON ca.id_act = act.id_act
    JOIN clusters clu
    ON clu.id_clu = ca.id_clu
    WHERE
        clu.id_clu = 2
        AND anio = 2019
    GROUP BY 1
    ),

    t19 AS(
        SELECT 
        *,
        n/(SELECT SUM(N) FROM n2019) AS dist
    FROM n2019
    ),

    n2024 AS(
        SELECT 
            cla.id_cla,
            COUNT(id_denue) AS n
        FROM denue
        JOIN actividades act
        ON denue.id_act = act.id_act
        JOIN subsector sub
        ON act.id_sub = sub.id_sub
        JOIN clasificacion cla
        ON sub.id_cla = cla.id_cla
        JOIN clusters_actividades ca
        ON ca.id_act = act.id_act
        JOIN clusters clu
        ON clu.id_clu = ca.id_clu
        WHERE
            clu.id_clu = 2
            AND anio = 2024
        GROUP BY 1
    ),

    t24 AS(
        SELECT 
            *,
            n/(SELECT SUM(N) FROM n2024) AS dist
        FROM n2024
    )

SELECT
    cla.clasificacion AS "Clasificación",
    t19.n AS "N 2019",
    t19.dist AS "Dist% 2019",
    t24.n AS "N 2024",
    t24.dist AS "Dist% 2024",
    t24.n - t19.n AS "Var Absoluta",
    CAST(t24.n AS FLOAT)/CAST(t19.n AS FLOAT) - 1 AS "Var %"
FROM t19
FULL OUTER JOIN t24
ON t19.id_cla = t24.id_cla
JOIN clasificacion cla
ON cla.id_cla = t19.id_cla;






------------------------- CLUSTER DE FUNDICIÓN (id_clu = 3) -------------------------
-- fund_tab_com_ue_x_cla.csv

WITH 
    n2019 AS(
        SELECT 
        cla.id_cla,
        COUNT(id_denue) AS n
    FROM denue
    JOIN actividades act
    ON denue.id_act = act.id_act
    JOIN subsector sub
    ON act.id_sub = sub.id_sub
    JOIN clasificacion cla
    ON sub.id_cla = cla.id_cla
    JOIN clusters_actividades ca
    ON ca.id_act = act.id_act
    JOIN clusters clu
    ON clu.id_clu = ca.id_clu
    WHERE
        clu.id_clu = 3
        AND anio = 2019
    GROUP BY 1
    ),

    t19 AS(
        SELECT 
        *,
        n/(SELECT SUM(N) FROM n2019) AS dist
    FROM n2019
    ),

    n2024 AS(
        SELECT 
            cla.id_cla,
            COUNT(id_denue) AS n
        FROM denue
        JOIN actividades act
        ON denue.id_act = act.id_act
        JOIN subsector sub
        ON act.id_sub = sub.id_sub
        JOIN clasificacion cla
        ON sub.id_cla = cla.id_cla
        JOIN clusters_actividades ca
        ON ca.id_act = act.id_act
        JOIN clusters clu
        ON clu.id_clu = ca.id_clu
        WHERE
            clu.id_clu = 3
            AND anio = 2024
        GROUP BY 1
    ),

    t24 AS(
        SELECT 
            *,
            n/(SELECT SUM(N) FROM n2024) AS dist
        FROM n2024
    )

SELECT
    cla.clasificacion AS "Clasificación",
    t19.n AS "N 2019",
    t19.dist AS "Dist% 2019",
    t24.n AS "N 2024",
    t24.dist AS "Dist% 2024",
    t24.n - t19.n AS "Var Absoluta",
    CAST(t24.n AS FLOAT)/CAST(t19.n AS FLOAT) - 1 AS "Var %"
FROM t19
FULL OUTER JOIN t24
ON t19.id_cla = t24.id_cla
JOIN clasificacion cla
ON cla.id_cla = t19.id_cla;






------------------------- TOOLING CLUSTER (id_clu = 4) -------------------------
-- tool_tab_com_ue_x_cla.csv

WITH 
    n2019 AS(
        SELECT 
        cla.id_cla,
        COUNT(id_denue) AS n
    FROM denue
    JOIN actividades act
    ON denue.id_act = act.id_act
    JOIN subsector sub
    ON act.id_sub = sub.id_sub
    JOIN clasificacion cla
    ON sub.id_cla = cla.id_cla
    JOIN clusters_actividades ca
    ON ca.id_act = act.id_act
    JOIN clusters clu
    ON clu.id_clu = ca.id_clu
    WHERE
        clu.id_clu = 4
        AND anio = 2019
    GROUP BY 1
    ),

    t19 AS(
        SELECT 
        *,
        n/(SELECT SUM(N) FROM n2019) AS dist
    FROM n2019
    ),

    n2024 AS(
        SELECT 
            cla.id_cla,
            COUNT(id_denue) AS n
        FROM denue
        JOIN actividades act
        ON denue.id_act = act.id_act
        JOIN subsector sub
        ON act.id_sub = sub.id_sub
        JOIN clasificacion cla
        ON sub.id_cla = cla.id_cla
        JOIN clusters_actividades ca
        ON ca.id_act = act.id_act
        JOIN clusters clu
        ON clu.id_clu = ca.id_clu
        WHERE
            clu.id_clu = 4
            AND anio = 2024
        GROUP BY 1
    ),

    t24 AS(
        SELECT 
            *,
            n/(SELECT SUM(N) FROM n2024) AS dist
        FROM n2024
    )

SELECT
    cla.clasificacion AS "Clasificación",
    t19.n AS "N 2019",
    t19.dist AS "Dist% 2019",
    t24.n AS "N 2024",
    t24.dist AS "Dist% 2024",
    t24.n - t19.n AS "Var Absoluta",
    CAST(t24.n AS FLOAT)/CAST(t19.n AS FLOAT) - 1 AS "Var %"
FROM t19
FULL OUTER JOIN t24
ON t19.id_cla = t24.id_cla
JOIN clasificacion cla
ON cla.id_cla = t19.id_cla;
