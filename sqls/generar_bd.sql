/*
Created: 08/04/2020
Modified: 12/04/2023 11:50 PM
Project: Videorental Project
Model: Videorental
Company: Quest Software, Inc.
Author: Radim Mario Tkacik
Database: Oracle 19c
*/


-- Create user data types section -------------------------------------------------

CREATE TYPE "SCOTT"."Price_Type"
AS OBJECT (price NUMBER(10,2),  
    MEMBER FUNCTION total_price_VAT (vat number) RETURN NUMBER)
/
CREATE TYPE BODY "SCOTT"."Price_Type"
IS
    MEMBER FUNCTION total_price_VAT (vat NUMBER)
    RETURN NUMBER IS
    BEGIN
        RETURN (price*((vat+100)/100));
    END;
END;
/

CREATE TYPE "SCOTT"."Cust_Address_Type"
AS OBJECT
    ( street_address     VARCHAR2(40)
    , postal_code        VARCHAR2(10)
    , city               VARCHAR2(30)
    , state_province     VARCHAR2(10)
    , country_id         CHAR(2)
    , phone              Phone_List_Type
    )
/

CREATE TYPE "SCOTT"."Phone_List_Type"
AS VARRAY(5) OF VARCHAR2(25)
/

-- Create sequences section -------------------------------------------------

CREATE SEQUENCE "SCOTT"."SeqExemplar"
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 NOMINVALUE
 NOCACHE
/

-- Create tables section -------------------------------------------------

-- Table Corredor

CREATE TABLE "Corredor"(
  "codigoCorredor" Integer DEFAULT Codigo NOT NULL,
  "nombre" Char(50 ) DEFAULT nombre NOT NULL,
  "estatura" Float DEFAULT Altura NOT NULL,
  "Peso" Float NOT NULL,
  "fechaNac" Date NOT NULL
)
/

-- Add keys for table Corredor

ALTER TABLE "Corredor" ADD CONSTRAINT "PK_Corredor" PRIMARY KEY ("codigoCorredor")
/

-- Table Liga

CREATE TABLE "Liga"(
  "codigoLiga" Integer DEFAULT codigo NOT NULL,
  "nombre" Char(50 ) NOT NULL
)
/

-- Add keys for table Liga

ALTER TABLE "Liga" ADD CONSTRAINT "PK_Liga" PRIMARY KEY ("codigoLiga")
/

-- Table Entrenamiento

CREATE TABLE "Entrenamiento"(
  "codigo" Integer DEFAULT codigo NOT NULL
)
/

-- Add keys for table Entrenamiento

ALTER TABLE "Entrenamiento" ADD CONSTRAINT "PK_Entrenamiento" PRIMARY KEY ("codigo")
/

ALTER TABLE "Entrenamiento" ADD CONSTRAINT "codigo" UNIQUE ("codigo")
/

-- Table Club

CREATE TABLE "Club"(
  "codigoClub" Integer NOT NULL
)
/

-- Add keys for table Club

ALTER TABLE "Club" ADD CONSTRAINT "PK_Club" PRIMARY KEY ("codigoClub")
/

-- Table Tipo

CREATE TABLE "Tipo"(
  "Nombre" Char(50 ) NOT NULL
)
/

-- Add keys for table Tipo

ALTER TABLE "Tipo" ADD CONSTRAINT "PK_Tipo" PRIMARY KEY ("Nombre")
/

-- Table Evento

CREATE TABLE "Evento"(
  "codigoEvento" Integer NOT NULL,
  "nombre" Char(50 ) NOT NULL,
  "fecha" Date NOT NULL
)
/

-- Add keys for table Evento

ALTER TABLE "Evento" ADD CONSTRAINT "PK_Evento" PRIMARY KEY ("codigoEvento")
/

-- Table Categoria

CREATE TABLE "Categoria"(
  "nombreCategoria" Char(50 ) NOT NULL
)
/

-- Add keys for table Categoria

ALTER TABLE "Categoria" ADD CONSTRAINT "PK_Categoria" PRIMARY KEY ("nombreCategoria")
/

-- Table Tiene historial

CREATE TABLE "Tiene historial"(
  "codigo" Integer DEFAULT Codigo NOT NULL,
  "Attribute1" Integer DEFAULT codigo NOT NULL
)
/

-- Add keys for table Tiene historial

ALTER TABLE "Tiene historial" ADD CONSTRAINT "PK_Tiene historial" PRIMARY KEY ("codigo")
/

-- Table Tiene tipo

CREATE TABLE "Tiene tipo"(
  "codigo" Integer DEFAULT codigo NOT NULL,
  "Nombre" Char(50 ) NOT NULL
)
/

-- Add keys for table Tiene tipo

ALTER TABLE "Tiene tipo" ADD CONSTRAINT "PK_Tiene tipo" PRIMARY KEY ("codigo")
/

-- Table Representa

CREATE TABLE "Representa"(
  "codigo" Integer DEFAULT Codigo NOT NULL,
  "codigoLiga" Integer DEFAULT codigo NOT NULL,
  "codigo" Integer NOT NULL
)
/

-- Add keys for table Representa

ALTER TABLE "Representa" ADD CONSTRAINT "PK_Representa" PRIMARY KEY ("codigo","codigoLiga","codigo")
/

-- Table Participa

CREATE TABLE "Participa"(
  "codigoCorredor" Integer DEFAULT Codigo NOT NULL,
  "codigo" Integer NOT NULL,
  "nombre" Char(50 ) NOT NULL
)
/

-- Add keys for table Participa

ALTER TABLE "Participa" ADD CONSTRAINT "PK_Participa" PRIMARY KEY ("codigoCorredor","codigo","nombre")
/

-- Table Se divide

CREATE TABLE "Se divide"(
  "codigoEvento" Integer NOT NULL,
  "nombreCategoria" Char(50 ) NOT NULL
)
/

-- Add keys for table Se divide

ALTER TABLE "Se divide" ADD CONSTRAINT "PK_Se divide" PRIMARY KEY ("codigoEvento","nombreCategoria")
/

-- Table Agrupa

CREATE TABLE "Agrupa"(
  "codigoEvento" Integer NOT NULL,
  "codigoLiga" Integer DEFAULT codigo NOT NULL
)
/

-- Add keys for table Agrupa

ALTER TABLE "Agrupa" ADD CONSTRAINT "PK_Agrupa" PRIMARY KEY ("codigoEvento","codigoLiga")
/

-- Create procedures section -------------------------------------------------

CREATE PROCEDURE "SCOTT"."p_Customer_Has_Num_Film"(cid IN integer, num OUT integer)
AS
BEGIN
    SELECT count(*)
    INTO num
    FROM T_CUSTOMER c, T_BORROWING b, T_EXEMPLAR e, T_FILM f
    WHERE c.customer_id=cid
        and c.customer_id=b.customer_id
        and b.exemplar_id=e.exemplar_id
        and e.film_id=f.film_id;
END;
/

-- Create functions section -------------------------------------------------

CREATE FUNCTION "SCOTT"."f_Customer_Has_Num_Film"(cid IN integer)
RETURN integer
IS
sol integer;
BEGIN
    p_Customer_Has_Num_Film(cid,sol);
    RETURN (sol);
END;
/

-- Trigger for sequence SCOTT.SeqExemplar for column nombre in table Liga ---------
CREATE OR REPLACE TRIGGER "ts_Liga_SeqExemplar" BEFORE INSERT
ON "Liga" FOR EACH ROW
BEGIN
  :new."nombre" := "SCOTT"."SeqExemplar".nextval;
END;
/
CREATE OR REPLACE TRIGGER "tsu_Liga_SeqExemplar" AFTER UPDATE OF "nombre"
ON "Liga" FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column "nombre" in table "Liga" as it uses sequence.');
END;
/


-- Create foreign keys (relationships) section ------------------------------------------------- 

ALTER TABLE "Tiene historial" ADD CONSTRAINT "Relationship1" FOREIGN KEY ("codigo") REFERENCES "Corredor" ("codigoCorredor")
/



ALTER TABLE "Tiene historial" ADD CONSTRAINT "Relationship2" FOREIGN KEY ("Attribute1") REFERENCES "Entrenamiento" ("codigo")
/



ALTER TABLE "Tiene tipo" ADD CONSTRAINT "Relationship8" FOREIGN KEY ("codigo") REFERENCES "Entrenamiento" ("codigo")
/



ALTER TABLE "Tiene tipo" ADD CONSTRAINT "Relationship9" FOREIGN KEY ("Nombre") REFERENCES "Tipo" ("Nombre")
/



ALTER TABLE "Representa" ADD CONSTRAINT "Relationship17" FOREIGN KEY ("codigo") REFERENCES "Club" ("codigoClub")
/



ALTER TABLE "Participa" ADD CONSTRAINT "Relationship23" FOREIGN KEY ("nombre") REFERENCES "Categoria" ("nombreCategoria")
/



ALTER TABLE "Participa" ADD CONSTRAINT "Relationship25" FOREIGN KEY ("codigoCorredor") REFERENCES "Corredor" ("codigoCorredor")
/



ALTER TABLE "Se divide" ADD CONSTRAINT "Relationship28" FOREIGN KEY ("codigoEvento") REFERENCES "Evento" ("codigoEvento")
/



ALTER TABLE "Se divide" ADD CONSTRAINT "Relationship29" FOREIGN KEY ("nombreCategoria") REFERENCES "Categoria" ("nombreCategoria")
/



ALTER TABLE "Agrupa" ADD CONSTRAINT "Relationship30" FOREIGN KEY ("codigoEvento") REFERENCES "Evento" ("codigoEvento")
/



ALTER TABLE "Agrupa" ADD CONSTRAINT "Relationship31" FOREIGN KEY ("codigoLiga") REFERENCES "Liga" ("codigoLiga")
/




-- Grant permissions section -------------------------------------------------


