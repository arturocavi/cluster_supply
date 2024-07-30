-- Modify Tables, Change types and Set Keys

ALTER TABLE clusters
ALTER COLUMN id_clu TYPE INT,
ALTER COLUMN cluster TYPE TEXT,
ADD CONSTRAINT pk_clu PRIMARY KEY (id_clu),
ADD CONSTRAINT uni_clu UNIQUE (id_clu);

ALTER TABLE clasificacion
ALTER COLUMN id_cla TYPE INT,
ALTER COLUMN clasificacion TYPE TEXT,
ADD CONSTRAINT pk_cla PRIMARY KEY (id_cla),
ADD CONSTRAINT uni_cla UNIQUE (id_cla);

ALTER TABLE subsector
ALTER COLUMN id_sub TYPE INT,
ALTER COLUMN subsector TYPE TEXT,
ALTER COLUMN id_cla TYPE INT,
ADD CONSTRAINT pk_subse PRIMARY KEY (id_sub),
ADD CONSTRAINT uni_subse UNIQUE (id_sub),
ADD CONSTRAINT fk_sub_cla FOREIGN KEY (id_cla) REFERENCES clasificacion (id_cla);

ALTER TABLE actividades
ALTER COLUMN id_act TYPE INT,
ALTER COLUMN actividad TYPE TEXT,
ALTER COLUMN id_sub TYPE INT,
ADD CONSTRAINT pk_activ PRIMARY KEY (id_act),
ADD CONSTRAINT uni_activ UNIQUE (id_act),
ADD CONSTRAINT fk_act_sub FOREIGN KEY (id_sub) REFERENCES subsector (id_sub);

ALTER TABLE clusters_actividades
ALTER COLUMN id_clu TYPE INT,
ALTER COLUMN id_act TYPE INT,
ADD CONSTRAINT pk_clu_act PRIMARY KEY (id_clu, id_act),
ADD CONSTRAINT uni_clu_act UNIQUE (id_clu, id_act),
ADD CONSTRAINT fk_clu_act_clu FOREIGN KEY (id_clu) REFERENCES clusters (id_clu),
ADD CONSTRAINT fk_clu_act_act FOREIGN KEY (id_act) REFERENCES actividades (id_act);

ALTER TABLE denue
ALTER COLUMN anio TYPE INT,
ALTER COLUMN id_denue TYPE INT,
ALTER COLUMN id_act TYPE INT,
ADD CONSTRAINT pk_anio_denue PRIMARY KEY (anio, id_denue),
ADD CONSTRAINT uni_anio_denue UNIQUE (anio, id_denue),
ADD CONSTRAINT fk_denue_act FOREIGN KEY (id_act) REFERENCES actividades (id_act);
