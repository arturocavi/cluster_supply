-- Modifiy tables change column types and to set keys


ALTER TABLE ind_eco
ALTER COLUMN anio TYPE INT,
ALTER COLUMN id_ent TYPE INT,
ALTER COLUMN id_act TYPE INT,
ALTER COLUMN unidades_eco TYPE INT,
ALTER COLUMN produccion TYPE FLOAT,
ALTER COLUMN personal TYPE INT,
ALTER COLUMN activos TYPE FLOAT,
ADD CONSTRAINT pki PRIMARY KEY (anio,id_ent,id_act),
ADD CONSTRAINT uni UNIQUE (anio,id_ent,id_act);

ALTER TABLE ent_nombre
ALTER COLUMN id_ent TYPE INT,
ADD CONSTRAINT pke PRIMARY KEY (id_ent),
ADD CONSTRAINT une UNIQUE (id_ent);

ALTER TABLE actividades
ALTER COLUMN id_act TYPE INT,
ADD CONSTRAINT pka PRIMARY KEY (id_act),
ADD CONSTRAINT una UNIQUE (id_act);

ALTER TABLE clusters
ALTER COLUMN id_clu TYPE INT,
ADD CONSTRAINT pkc PRIMARY KEY (id_clu),
ADD CONSTRAINT unc UNIQUE (id_clu);

ALTER TABLE clusters_actividades
ALTER COLUMN id_clu TYPE INT,
ALTER COLUMN id_act TYPE INT,
ADD CONSTRAINT pkca PRIMARY KEY (id_clu,id_act),
ADD CONSTRAINT unca UNIQUE (id_clu,id_act);

-- Relations
ALTER TABLE ind_eco
ADD CONSTRAINT fkie FOREIGN KEY (id_ent) REFERENCES ent_nombre (id_ent),
ADD CONSTRAINT fkia FOREIGN KEY (id_act) REFERENCES actividades (id_act);

ALTER TABLE clusters_actividades
ADD CONSTRAINT fkcac FOREIGN KEY (id_clu) REFERENCES clusters (id_clu),
ADD CONSTRAINT fkcaa FOREIGN KEY (id_act) REFERENCES actividades (id_act);

