CREATE TABLE clients (
dni_client VARCHAR(9) PRIMARY KEY,
nom VARCHAR(15),
cognoms VARCHAR(15),
direccio VARCHAR(25),
zona VARCHAR(20),
telefon NUMERIC(9),
email VARCHAR(15), 
password VARCHAR(20),
numero_compte NUMERIC(15)
);

CREATE TABLE comandes (
codi_comanda INTEGER PRIMARY KEY,
data_realitzacio TIMESTAMP,
data_entrega TIMESTAMP,
estat ENUM ('pendent','enviada','entregada','cancel·lada','retornada','processada'),
direccio_entrega VARCHAR(25),
dni_client VARCHAR(9),
nom_mussol VARCHAR(10),
zona_mussol VARCHAR(15),
numero_llicencia NUMERIC(10),
data_entrega_real TIMESTAMP,
FOREIGN KEY (dni_client) REFERENCES clients(dni_client) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE productes (
nom_producte VARCHAR(20),
marca_producte VARCHAR(20),
origen ENUM ('Mon magic','Mon muggle'),
dimensions NUMERIC(15),
caracteristiques VARCHAR(20),
magic ENUM ('Magic','No magic'),
fotografia BLOB,
unitats_disponibles NUMERIC(30),
nom_categoria VARCHAR(30),
PRIMARY KEY (nom_producte,marca_producte)
);

CREATE TABLE categories (
nom_categoria VARCHAR(20) PRIMARY KEY,
descripcio VARCHAR(50),
nom_botiga VARCHAR(15),
direccio_botiga VARCHAR(20),
objectiu VARCHAR(30)
);

CREATE TABLE albarans (
codi_albara INTEGER,
codi_comanda INTEGER,
import_total NUMERIC(38),
PRIMARY KEY (codi_albara,codi_comanda),
FOREIGN KEY (codi_comanda) REFERENCES comandes(codi_comanda) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE mussols (
nom_mussol VARCHAR(10),
zona_mussol VARCHAR(15),
numero_llicencia INTEGER,
PRIMARY KEY (nom_mussol,zona_mussol,numero_llicencia)
);

CREATE TABLE compres (
codi_comanda INTEGER,
nom_producte VARCHAR(15),
marca_producte VARCHAR(20),
codi_albara INTEGER,
quantitat_productes NUMERIC(38),
PRIMARY KEY (codi_comanda,nom_producte,marca_producte,codi_albara),
FOREIGN KEY (nom_producte,marca_producte) REFERENCES productes(nom_producte,marca_producte) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (codi_albara,codi_comanda) REFERENCES albarans(codi_albara,codi_comanda) ON DELETE CASCADE ON UPDATE CASCADE
);

