----------------------------------------------------------------------------------------
-- Creado: Flavio Abdon Condori Vel                                 Fecha: 17-05-2023 --
-- Entrada Universitaria 	                                     Materia : INF-161--
-- Creación de las tablas del proyecto entrada universitaria oracle		      --
----------------------------------------------------------------------------------------

CREATE TABLE PERSONA (
  CI INTEGER PRIMARY KEY,
  nombre VARCHAR(50) NOT NULL,
  ap_paterno VARCHAR(50) NOT NULL,
  ap_materno VARCHAR(50) NOT NULL,
  edad INTEGER NOT NULL
);

-- Tabla BLOQUE
CREATE TABLE BLOQUE (
    cod_bloque INTEGER PRIMARY KEY,
    nombre VARCHAR(50),
    nro_fraternos INTEGER
);

CREATE TABLE MIEMBRO_UNIV (
  CI INTEGER PRIMARY KEY,
  tipo_miembro VARCHAR(50) NOT NULL,
  FOREIGN KEY (CI) REFERENCES PERSONA(CI)
);

CREATE TABLE FRATERNO (
  CI INTEGER PRIMARY KEY,
  cod_fraterno INTEGER NOT NULL,
  tipo_fraterno VARCHAR(50) NOT NULL,
  antigüedad INTEGER NOT NULL,
  guía INTEGER NOT NULL,
  cod_bloque INTEGER NOT NULL,
  FOREIGN KEY (CI) REFERENCES PERSONA(CI),
  FOREIGN KEY (cod_bloque) REFERENCES BLOQUE(cod_bloque)
);

CREATE TABLE COM_CULTURAS (
  cod_com INTEGER PRIMARY KEY,
  año INTEGER NOT NULL
);

CREATE TABLE COMPONE (
  cod_com INTEGER NOT NULL,
  CI INTEGER NOT NULL,
  cargo VARCHAR(50) NOT NULL,
  fecha_desig DATE NOT NULL,
  PRIMARY KEY (cod_com, CI),
  FOREIGN KEY (cod_com) REFERENCES COM_CULTURAS(cod_com),
  FOREIGN KEY (CI) REFERENCES PERSONA(CI)
);

CREATE TABLE JURADO (
  cod_jurado INTEGER PRIMARY KEY,
  año INTEGER NOT NULL,
  cod_com INTEGER NOT NULL,
  FOREIGN KEY (cod_com) REFERENCES COM_CULTURAS(cod_com)
);

CREATE TABLE CONFORMA (
  cod_jurado INTEGER NOT NULL,
  CI INTEGER NOT NULL,
  PRIMARY KEY (cod_jurado, CI),
  FOREIGN KEY (cod_jurado) REFERENCES JURADO(cod_jurado),
  FOREIGN KEY (CI) REFERENCES PERSONA(CI)
);

CREATE TABLE G_INVITADO (
  cod_inv INTEGER PRIMARY KEY,
  nombre VARCHAR(50) NOT NULL,
  tipo VARCHAR(50) NOT NULL,
  decripcion VARCHAR(254) NOT NULL
);

CREATE TABLE DEFINE (
  cod_com INTEGER NOT NULL,
  cod_inv INTEGER NOT NULL,
  PRIMARY KEY (cod_com, cod_inv),
  FOREIGN KEY (cod_com) REFERENCES COM_CULTURAS(cod_com),
  FOREIGN KEY (cod_inv) REFERENCES G_INVITADO(cod_inv)
);

CREATE TABLE CONVOCATORIA (
  cod_conv INTEGER PRIMARY KEY,
  año INTEGER NOT NULL,
  fecha_pub DATE NOT NULL,
  cod_com INTEGER NOT NULL,
  FOREIGN KEY (cod_com) REFERENCES COM_CULTURAS(cod_com)
);


CREATE TABLE CONCURSO (
  cod_concur INTEGER PRIMARY KEY,
  fecha DATE NOT NULL,
  nom_alcalde VARCHAR(50) NOT NULL,
  FOREIGN KEY (nom_alcalde) REFERENCES ALCALDIA(nom_alcalde)
);

CREATE TABLE EVALUA (
  cod_jurado INTEGER NOT NULL,
  cod_concur INTEGER NOT NULL,
  calificación INTEGER NOT NULL,
  PRIMARY KEY (cod_jurado, cod_concur),
  FOREIGN KEY (cod_jurado) REFERENCES JURADO(cod_jurado),
  FOREIGN KEY (cod_concur) REFERENCES CONCURSO(cod_concur)
);


CREATE TABLE CON_CULTURA (
  cod_concur INTEGER NOT NULL,
  lugar VARCHAR(50) NOT NULL,
  PRIMARY KEY (cod_concur, lugar),
  FOREIGN KEY (cod_concur) REFERENCES CONCURSO(cod_concur)
);

CREATE TABLE PERSONA (
  CI INT PRIMARY KEY,
  nombre VARCHAR(50) NOT NULL,
  ap_paterno VARCHAR(50) NOT NULL,
  ap_materno VARCHAR(50) NOT NULL,
  edad INT NOT NULL
);

CREATE TABLE MIEMBRO_UNIV (
  CI INT PRIMARY KEY,
  tipo_miembro VARCHAR(50) NOT NULL,
  FOREIGN KEY (CI) REFERENCES PERSONA(CI)
);


  CREATE TABLE ÑUSTA (
  cod_concur INT PRIMARY KEY,
  carisma FLOAT NOT NULL,
  belleza FLOAT NOT NULL,
  baile FLOAT NOT NULL,
  vestimenta FLOAT NOT NULL,
  FOREIGN KEY (cod_concur) REFERENCES CONCURSO(cod_concur)
);

CREATE TABLE MONOGRAFIA (
  cod_concur INT PRIMARY KEY,
  presentacion FLOAT NOT NULL,
  sintesis FLOAT NOT NULL,
  objetivos FLOAT NOT NULL,
  triptico FLOAT NOT NULL,
  expresion_oral FLOAT NOT NULL,
  dominio FLOAT NOT NULL,
  esquemas FLOAT NOT NULL,
  graficas FLOAT NOT NULL,
  FOREIGN KEY (cod_concur) REFERENCES CONCURSO(cod_concur)
);

CREATE TABLE CON_BAILE (
  cod_concur INT PRIMARY KEY,
  recorrido VARCHAR(50) NOT NULL,
  lugar_inicio VARCHAR(50) NOT NULL,
  lugar_fin VARCHAR(50) NOT NULL,
  FOREIGN KEY (cod_concur) REFERENCES CONCURSO(cod_concur)
);

CREATE TABLE PRE_ENTRADA (
  cod_concur INT PRIMARY KEY,
  patrocinio FLOAT NOT NULL,
  FOREIGN KEY (cod_concur) REFERENCES CONCURSO(cod_concur)
);

CREATE TABLE ENTRADA (
  cod_concur INT PRIMARY KEY,
  premio VARCHAR(50) NOT NULL,
  FOREIGN KEY (cod_concur) REFERENCES CONCURSO(cod_concur)
);

CREATE TABLE PUNTO_CONT (
  cod_pc INT PRIMARY KEY,
  ubicacion VARCHAR(50) NOT NULL
);

CREATE TABLE SUPERVISA (
  cod_pc INT,
  cod_concur INT,
  num_b_roja INT NOT NULL,
  num_b_amari INT NOT NULL,
  PRIMARY KEY (cod_pc, cod_concur),
  FOREIGN KEY (cod_pc) REFERENCES PUNTO_CONT(cod_pc),
  FOREIGN KEY (cod_concur) REFERENCES CONCURSO(cod_concur)
);

CREATE TABLE ORGANIZA (
  cod_com INT,
  cod_concur INT,
  PRIMARY KEY (cod_com, cod_concur),
  FOREIGN KEY (cod_com) REFERENCES COM_CULTURAS(cod_com),
  FOREIGN KEY (cod_concur) REFERENCES CONCURSO(cod_concur)
);

CREATE TABLE FRATERNIDAD (
  cod_frater INT PRIMARY KEY,
  nombre VARCHAR(50) NOT NULL,
  categoria VARCHAR(50) NOT NULL,
  carrera_facultad VARCHAR(50) NOT NULL,
  precio_traje FLOAT NOT NULL,
  danza VARCHAR(50) NOT NULL,
  monto_cuotas FLOAT NOT NULL,
  representante INT NOT NULL,
  FOREIGN KEY (representante) REFERENCES FRATERNO(cod_fraterno)
);

CREATE TABLE BAILA (
  cod_frater INT,
  cod_concur INT,
  orden_posic INT NOT NULL,
  PRIMARY KEY (cod_frater, cod_concur),
  FOREIGN KEY (cod_frater) REFERENCES FRATERNO(cod_fraterno),
  FOREIGN KEY (cod_concur) REFERENCES CONCURSO(cod_concur)
);

CREATE TABLE INSCRIBE (
  cod_conv INT,
  cod_frater INT,
  vest_varon VARCHAR(50) NOT NULL,
  vest_mujer VARCHAR(50) NOT NULL,
  PRIMARY KEY (cod_conv, cod_frater),
  FOREIGN KEY (cod_conv) REFERENCES CONVOCATORIA(cod_conv),
  FOREIGN KEY (cod_frater) REFERENCES FRATERNO(cod_fraterno)
);

CREATE TABLE PARTICIPA (
  cod_frater INT,
  cod_concur

  -- Tabla ALCALDIA
CREATE TABLE ALCALDIA (
    nom_alcalde VARCHAR(50) PRIMARY KEY,
    gestion INTEGER
);
  
  -- Crear tabla CONCURSO
CREATE TABLE CONCURSO (
  cod_concur INT PRIMARY KEY,
  fecha DATE,
  nom_alcalde VARCHAR(50),
  FOREIGN KEY (nom_alcalde) REFERENCES ALCALDIA(nom_alcalde)
);

-- Crear tabla CON_CULTURA
CREATE TABLE CON_CULTURA (
  cod_concur INT PRIMARY KEY,
  lugar VARCHAR(50),
  FOREIGN KEY (cod_concur) REFERENCES CONCURSO(cod_concur)
);

-- Crear tabla ÑUSTA
CREATE TABLE ÑUSTA (
  cod_concur INT PRIMARY KEY,
  carisma INT,
  belleza INT,
  baile INT,
  vestimenta INT,
  FOREIGN KEY (cod_concur) REFERENCES CONCURSO(cod_concur)
);

-- Crear tabla MONOGRAFIA
CREATE TABLE MONOGRAFIA (
  cod_concur INT PRIMARY KEY,
  presentación INT,
  síntesis INT,
  objetivos INT,
  tríptico INT,
  expresion_oral INT,
  dominio INT,
  esquemas INT,
  graficas INT,
  FOREIGN KEY (cod_concur) REFERENCES CONCURSO(cod_concur)
);

-- Crear tabla CON_BAILE
CREATE TABLE CON_BAILE (
  cod_concur INT PRIMARY KEY,
  recorrido VARCHAR(50),
  lugar_inicio VARCHAR(50),
  lugar_fin VARCHAR(50),
  FOREIGN KEY (cod_concur) REFERENCES CONCURSO(cod_concur)
);

-- Crear tabla PRE_ENTRADA
CREATE TABLE PRE_ENTRADA (
  cod_concur INT PRIMARY KEY,
  patrocinio VARCHAR(50),
  FOREIGN KEY (cod_concur) REFERENCES CONCURSO(cod_concur)
);

-- Crear tabla ENTRADA
CREATE TABLE ENTRADA (
  cod_concur INT PRIMARY KEY,
  premio VARCHAR(50),
  FOREIGN KEY (cod_concur) REFERENCES CONCURSO(cod_concur)
);

-- Crear tabla PUNTO_CONT
CREATE TABLE PUNTO_CONT (
  cod_pc INT PRIMARY KEY,
  ubicación VARCHAR(50)
);

-- Crear tabla SUPERVISA
CREATE TABLE SUPERVISA (
  cod_pc INT,
  cod_concur INT,
  num_b_roja INT,
  num_b_amari INT,
  PRIMARY KEY (cod_pc, cod_concur),
  FOREIGN KEY (cod_pc) REFERENCES PUNTO_CONT(cod_pc),
  FOREIGN KEY (cod_concur) REFERENCES CONCURSO(cod_concur)
);

-- Crear tabla ORGANIZA
CREATE TABLE ORGANIZA (
  cod_com INT,
  cod_concur INT,
  PRIMARY KEY (cod_com, cod_concur),
  FOREIGN KEY (cod_com) REFERENCES COM_CULTURAS(cod_com),
  FOREIGN KEY (cod_concur) REFERENCES CONCURSO(cod_concur)
);

-- Crear tabla FRATERNIDAD
CREATE TABLE FRATERNIDAD (
  cod_frater INT PRIMARY KEY,
  nombre VARCHAR(50),
  categoría VARCHAR(50),
  carrera_facultad VARCHAR(50),
  precio_traje DECIMAL(10, 2),
  danza VARCHAR(50),
  monto_cuotas DECIMAL(10, 2),
  representante VARCHAR(50),
  cod_bloque INT,
  FOREIGN KEY (cod_bloque) REFERENCES BLOQUE(cod_bloque)
);


-- Tabla PARTICIPA
CREATE TABLE PARTICIPA (
    cod_frater INTEGER,
    cod_concur INTEGER,
    puesto INTEGER,
    puntaje NUMERIC(5,2),
    PRIMARY KEY (cod_frater, cod_concur),
    FOREIGN KEY (cod_frater) REFERENCES FRATERNIDAD (cod_frater),
    FOREIGN KEY (cod_concur) REFERENCES CONCURSO (cod_concur)
);

-- Tabla TIENE
CREATE TABLE TIENE (
    cod_fraterno_ci INTEGER,
    cod_frater INTEGER,
    rol_fraterno VARCHAR(50),
    PRIMARY KEY (cod_fraterno_ci, cod_frater),
    FOREIGN KEY (cod_fraterno_ci) REFERENCES FRATERNO (ci),
    FOREIGN KEY (cod_frater) REFERENCES FRATERNIDAD (cod_frater)
);

-- Tabla ESP_ENSAYO
CREATE TABLE ESP_ENSAYO (
    cod_esp_ens INTEGER PRIMARY KEY,
    nombre VARCHAR(50),
    zona VARCHAR(50),
    direccion VARCHAR(100)
);


-- Tabla ENSAYO
CREATE TABLE ENSAYO (
    nro_ensayo INTEGER PRIMARY KEY,
    fecha DATE,
    nro_participantes INTEGER,
    cod_frater INTEGER,
    cod_esp_ens INTEGER,
    FOREIGN KEY (cod_frater) REFERENCES FRATERNIDAD (cod_frater),
    FOREIGN KEY (cod_esp_ens) REFERENCES ESP_ENSAYO (cod_esp_ens)
);


-- Tabla ASIGNA
CREATE TABLE ASIGNA (
    nom_alcalde VARCHAR(50),
    cod_esp_ens INTEGER,
    subalcaldia VARCHAR(50),
    PRIMARY KEY (nom_alcalde, cod_esp_ens),
    FOREIGN KEY (nom_alcalde) REFERENCES ALCALDIA (nom_alcalde),
    FOREIGN KEY (cod_esp_ens) REFERENCES ESP_ENSAYO (cod_esp_ens)
);
