CREATE TABLE callejondiagon.clients (
dni_client VARCHAR(9) PRIMARY KEY,
nom VARCHAR(15),
cognoms VARCHAR(15),
direccio VARCHAR(25),
zona VARCHAR(20),
telefon NUMBER(9),
email VARCHAR(15), 
password VARCHAR(20),
numero_compte NUMBER(15)
)
TABLESPACE callejondiagon;

CREATE TABLE callejondiagon.comandes (
codi_comanda INTEGER PRIMARY KEY,
data_realitzacio TIMESTAMP,
data_entrega TIMESTAMP,
estat VARCHAR(30) CONSTRAINT c_estat CHECK (estat IN ('pendent','enviada','entregada','cancel·lada','retornada','processada')),
direccio_entrega VARCHAR(25),
dni_client VARCHAR(9),
nom_mussol VARCHAR(10),
zona_mussol VARCHAR(15),
numero_llicencia INTEGER,
data_entrega_real TIMESTAMP,
FOREIGN KEY (dni_client) REFERENCES callejondiagon.clients(dni_client) ON DELETE CASCADE
)
TABLESPACE callejondiagon;

CREATE TABLE callejondiagon.productes (
nom_producte VARCHAR(20),
marca_producte VARCHAR(20),
origen VARCHAR(30) CONSTRAINT c_origen CHECK (origen IN ('Mon magic','Mon muggle')),
dimensions NUMBER(15),
caracteristiques VARCHAR(20),
magic VARCHAR(10) CONSTRAINT c_magic CHECK (magic IN ('magic','no magic')),
fotografia BLOB,
unitats_disponibles NUMBER(30),
nom_categoria VARCHAR(30),
PRIMARY KEY (nom_producte,marca_producte)
)
TABLESPACE callejondiagon;

CREATE TABLE callejondiagon.categories (
nom_categoria VARCHAR(20) PRIMARY KEY,
descripcio VARCHAR(50),
nom_botiga VARCHAR(15),
direccio_botiga VARCHAR(20),
objectiu VARCHAR(30)
)
TABLESPACE callejondiagon;

CREATE TABLE callejondiagon.albarans (
codi_albara INTEGER,
codi_comanda INTEGER,
import_total NUMBER(38),
PRIMARY KEY (codi_albara,codi_comanda),
FOREIGN KEY (codi_comanda) REFERENCES callejondiagon.comandes(codi_comanda) ON DELETE CASCADE
)
TABLESPACE callejondiagon;

CREATE TABLE callejondiagon.mussols (
nom_mussol VARCHAR(10),
zona_mussol VARCHAR(15),
numero_llicencia INTEGER,
PRIMARY KEY (nom_mussol,zona_mussol,numero_llicencia)
)
TABLESPACE callejondiagon;

CREATE TABLE callejondiagon.compres (
codi_comanda INTEGER,
nom_producte VARCHAR(15),
marca_producte VARCHAR(20),
codi_albara INTEGER,
quantitat_productes NUMBER(38),
PRIMARY KEY (codi_comanda,nom_producte,marca_producte,codi_albara),
FOREIGN KEY (nom_producte,marca_producte) REFERENCES callejondiagon.productes(nom_producte,marca_producte) ON DELETE CASCADE,
FOREIGN KEY (codi_albara,codi_comanda) REFERENCES callejondiagon.albarans(codi_albara,codi_comanda) ON DELETE CASCADE	
)
TABLESPACE callejondiagon;
