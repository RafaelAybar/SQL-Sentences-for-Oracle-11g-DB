CREATE TABLE jabba.serveis (
codi INTEGER PRIMARY KEY,
nom VARCHAR(20),
material_necesari VARCHAR(30),
preu NUMBER(15),
descripcio VARCHAR(50)
)
TABLESPACE jabba;

CREATE TABLE jabba.clients (
dni VARCHAR(20) PRIMARY KEY,
nom VARCHAR(50),
cognom VARCHAR(50),
professio VARCHAR(50),
galaxia VARCHAR(10),
planeta VARCHAR(10),
ciutat VARCHAR(20),
telefon NUMBER(38)
)
TABLESPACE jabba;

CREATE TABLE jabba.materials (
codi INTEGER PRIMARY KEY,
nom VARCHAR(40),
quantitat NUMBER(20),
material_necesari VARCHAR(50),
preu NUMBER(15)
)
TABLESPACE jabba;

CREATE TABLE jabba.mercenaris (
dni VARCHAR(20) PRIMARY KEY,
nom VARCHAR(30),
cognom VARCHAR(30),
especialitat VARCHAR(10),
galaxia VARCHAR(10),
planeta VARCHAR(10),
telefon NUMBER(38)
)
TABLESPACE jabba;

CREATE TABLE jabba.victimes (
dni VARCHAR(20) PRIMARY KEY,
nom VARCHAR(50),
cognoms VARCHAR(50),
ciutat VARCHAR(20),
professio VARCHAR(50),
telefon NUMBER(38),
dni_mercenari VARCHAR(20),
data_hora TIMESTAMP,
FOREIGN KEY (dni_mercenari) REFERENCES mercenaris(dni) ON DELETE CASCADE
)
TABLESPACE jabba;

CREATE TABLE jabba.ventes (
dni_client VARCHAR(50),
dni_mercenari VARCHAR(50),
codi_material INTEGER,
comissio NUMBER(15),
data DATE,
PRIMARY KEY (dni_client,dni_mercenari,codi_material),
FOREIGN KEY (dni_client) REFERENCES clients(dni) ON DELETE CASCADE,
FOREIGN KEY (dni_mercenari) REFERENCES mercenaris(dni) ON DELETE CASCADE,
FOREIGN KEY (codi_material) REFERENCES materials(codi) ON DELETE CASCADE
)
TABLESPACE jabba;

CREATE TABLE jabba.contractes (
dni_client VARCHAR(50),
dni_mercenari VARCHAR(50),
codi_servei INTEGER,
favor VARCHAR(35),
data DATE,
PRIMARY KEY (dni_client,dni_mercenari,codi_servei),
FOREIGN KEY (dni_client) REFERENCES clients(dni) ON DELETE CASCADE,
FOREIGN KEY (dni_mercenari) REFERENCES mercenaris(dni) ON DELETE CASCADE,
FOREIGN KEY (codi_servei) REFERENCES serveis(codi) ON DELETE CASCADE
)
TABLESPACE jabba;
