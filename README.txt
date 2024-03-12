
DROP DATABASE IF EXISTS db_extremo;

CREATE USER jcarrillo WITH PASSWORD '#jerrylee13*';

CREATE DATABASE db_extremo WITH OWNER jcarrillo;

ALTER USER jcarrillo WITH SUPERUSER;
ALTER USER jcarrillo WITH CREATEDB;
ALTER USER jcarrillo WITH CREATEROLE;

    DROP TABLE IF EXISTS abono;
    DROP TABLE IF EXISTS detalle_reserva;
    DROP TABLE IF EXISTS reserva;
    DROP TABLE IF EXISTS alerta;
    DROP TABLE IF EXISTS proveedor_servicio;
    DROP TABLE IF EXISTS pago;
    DROP TABLE IF EXISTS proveedor_banco;
    DROP TABLE IF EXISTS proveedor;
    DROP TABLE IF EXISTS banco;
    DROP TABLE IF EXISTS municipio;
    DROP TABLE IF EXISTS servicio;
    DROP TABLE IF EXISTS tipo_servicio;
    DROP TABLE IF EXISTS cliente;
    DROP TABLE IF EXISTS contacto;
    DROP TABLE IF EXISTS excepciones;
    DROP TABLE IF EXISTS parametros;


CREATE TABLE parametros
(
    empresa_nit      DECIMAL(9,0)    NOT NULL,                 --NIT DE EMPRESA *-*
    empresa_nom      VARCHAR         NOT NULL,                 --NOMBRE DE LA EMPRESA SANTANDERXTREMO
    empresa_ciu      VARCHAR         NOT NULL,                 --CIUDAD DE LA EMPRESA *-*
    porc_iva         DECIMAL(2,0)    NOT NULL     DEFAULT (0), -- PORCENTAJE DEL IVA EN %*-*
    num_fact         DECIMAL(12,0)   NOT NULL,                 -- NÚMERO DE LA FACTURA
    primer_pago      DECIMAL(2,0)    NOT NULL,                 --VALOR DEL PRIMER DEL PRIMER PAGO
    admin_mail       VARCHAR         NOT NULL,                 --IDENTIFICADOR DE ADMINISTRADOR *-*
    admin_pass       VARCHAR         NOT NULL,                 --CLAVE DE ACCESO DE ADMINISTRADOR*-*
    PRIMARY KEY(empresa_nit)
);

-- TABLA DE EXCEPCIONES
CREATE TABLE excepciones
(
    excep_cod        VARCHAR(5) NOT NULL,                                -- CÓDIGO IDENTIFICADOR DE LA EXCEPCIÓN
    excep_nom        VARCHAR(100) NOT NULL,                               -- NOMBRE DE LA EXCEPCIÓN
    PRIMARY KEY (excep_cod)
);

CREATE TABLE contacto
(
   contacto_id       DECIMAL (1,0) NOT NULL,     --IDENTIFICADOR DE CONTACTO 
   contacto_nom      VARCHAR       NOT NULL,     --NOMBRE DEL CONTACTO 
   contacto_tel      DECIMAL(10,0) NOT NULL,     --TELEFONO DEL CONTACTO 
   contacto_mail     VARCHAR       NOT NULL,     --EMAIL DEL CONTACTO 
   contacto_msg      VARCHAR       NOT NULL,     --MENSAJE DEL CONTACTO     
   PRIMARY KEY(contacto_id)
);

 

CREATE TABLE cliente
(
    cliente_id        DECIMAL(15,0) NOT NULL,    --IDENTIFICACION DE CLIENTE.
    cliente_tpdoc     VARCHAR       NOT NULL,    --TIPO DE DOCUMENTO DE CLIENTE (1->CC/2->CE/ 3->PASAPORTE) 
    cliente_nom       VARCHAR(30)   NOT NULL,    --NOMBRE CLIENTE.
    cliente_ape       VARCHAR(30)   NOT NULL,    --APELLIDOS CLIENTE.
    cliente_nac       DATE          NOT NULL,    --FECHA DE NACIMIENTO DEL CLIENTE.
    cliente_mail      VARCHAR(80)   NOT NULL,    --EMAIL CLIENTE.
    cliente_pass      VARCHAR(200)  NOT NULL,    --CLAVE.  
    cliente_tel       DECIMAL(10,0) NOT NULL,    --TELEFONO CLIENTE.  
    cliente_cto       DECIMAL(10,0) NOT NULL,    --CONTACTO DE EMERGENCIA
    ind_borrado       BOOLEAN       NOT NULL,
    usr_insert        VARCHAR,
    fec_insert        TIMESTAMP     WITHOUT TIME ZONE,
    usr_update        VARCHAR,
    fec_update        TIMESTAMP     WITHOUT TIME ZONE,
    PRIMARY KEY (cliente_id) 
);

CREATE TABLE tipo_servicio --CRUD
(
    tpo_servicio_id     DECIMAL(1,0)  NOT NULL,    --IDENTIFICADOR DE TIPO DE SERVICIO
    tpo_servicio_nom    VARCHAR       NOT NULL,    --NOMBRE DEL TIPO DE SERVICIO
    ind_borrado         BOOLEAN       NOT NULL,  
    usr_insert          VARCHAR,  
    fec_insert          TIMESTAMP     WITHOUT TIME ZONE,        
    usr_update          VARCHAR, 
    fec_update          TIMESTAMP     WITHOUT TIME ZONE,
    PRIMARY KEY(tpo_servicio_id)
);

CREATE TABLE servicio --CRUD 
(
    servicio_id       DECIMAL(2,0)  NOT NULL,    --CODIGO IDENTIFICADOR DE SERVICIO
    id_tpo_servicio   DECIMAL(1,0)  NOT NULL,    --FORÁNEA TIPO DE SERVICIO
    servicio_nom      VARCHAR       NOT NULL,    --NOMBRE DEL SERVICIO
    servicio_det      VARCHAR       NOT NULL,    --DETALLE DEL SERVICIO
    ind_borrado       BOOLEAN       NOT NULL,  
    usr_insert        VARCHAR,        
    fec_insert        TIMESTAMP     WITHOUT TIME ZONE,  
    usr_update        VARCHAR,                       
    fec_update        TIMESTAMP     WITHOUT TIME ZONE,   
    PRIMARY KEY (servicio_id),
    FOREIGN KEY (id_tpo_servicio)  REFERENCES tipo_servicio (tpo_servicio_id)     
);

CREATE TABLE municipio --CRUD
(
    municipio_id           DECIMAL(2,0)  NOT NULL,          --CODIGO IDENTIFICADOR DE MUNICIPIO
    municipio_nom          VARCHAR       NOT NULL,          --NOMBRE DEL MUNICIPIO
    cod_postal             DECIMAL(6,0)  NOT NULL,          --CODIGO POSTAL DEL MUNICIPIO
    ind_borrado            BOOLEAN       NOT NULL,
    usr_insert             VARCHAR,
    fec_insert             TIMESTAMP     WITHOUT TIME ZONE,
    usr_update             VARCHAR,
    fec_update             TIMESTAMP     WITHOUT TIME ZONE,
    PRIMARY KEY(municipio_id)    
);

CREATE TABLE banco    --CRUD
(  
    banco_id            DECIMAL(2,0)  NOT NULL,         --CODIGO IDENTIFICADOR DE BANCO
    banco_nom           VARCHAR       NOT NULL,         --NOMBRE DEL BANCO
    ind_borrado         BOOLEAN       NOT NULL,
    usr_insert          VARCHAR,
    fec_insert          TIMESTAMP     WITHOUT TIME ZONE,
    usr_update          VARCHAR,
    fec_update          TIMESTAMP     WITHOUT TIME ZONE, 
    PRIMARY KEY(banco_id) 
    
);

CREATE TABLE proveedor --CRUD
(
    proveedor_nit       DECIMAL(9,0)  NOT NULL,     --CODIGO IDENTIFICADOR DEL PROVEEDOR
    proveedor_rnt       DECIMAL(5,0)  NOT NULL,     --REGISTRO NACIONAL DE TURISMO
    id_municipio        DECIMAL(2,0)  NOT NULL,     --FORANEA DEL MUNICIPIO 
    proveedor_nom       VARCHAR(30)   NOT NULL,     --NOMBRE DEL PROVEEDOR
    proveedor_dir       VARCHAR(55)   NOT NULL,     --DIRECCION DEL PROVEEDOR
    proveedor_mail      VARCHAR(100)  NOT NULL,     --CORREO DE PROVEEDOR
    proveedor_tel       DECIMAL(10,0) NOT NULL,     --TELEFONO DE PROVEDOR
    ind_borrado         BOOLEAN       NOT NULL,     --INDICADOR DE BORRADO TRUE--ACTIVO FALSE-INACTIVO
    usr_insert          VARCHAR,
    fec_insert          TIMESTAMP     WITHOUT TIME ZONE,
    usr_update          VARCHAR,
    fec_update          TIMESTAMP     WITHOUT TIME ZONE,
    PRIMARY KEY (proveedor_nit),
    FOREIGN KEY (id_municipio )   REFERENCES municipio(municipio_id) 
);

CREATE TABLE  proveedor_banco         --CRUD                             
( 
    nit_proveedor      DECIMAL(9,0)  NOT NULL,                      --FORANEA DEL PROVEEDOR    
    id_banco           DECIMAL(2,0)  NOT NULL,                      --FORANEA DEL SERVICIO 
    num_cuenta         DECIMAL(12,0)  NOT NULL,                     --NUMERO DE CUENTA 
    ind_cta_aho        BOOLEAN       NOT NULL,                      --INDICADOR DE CUENTA  TRUE->AHORRO / FALSE->CORRIENTE  
    usr_insert         VARCHAR,
    fec_insert         TIMESTAMP     WITHOUT TIME ZONE,
    usr_update         VARCHAR,
    fec_update         TIMESTAMP     WITHOUT TIME ZONE,
    PRIMARY KEY(nit_proveedor,id_banco,num_cuenta),
    FOREIGN KEY(nit_proveedor)  REFERENCES proveedor(proveedor_nit),
    FOREIGN KEY(id_banco)       REFERENCES banco(banco_id)
);


CREATE TABLE pago--DEBO SABER POR QUE SERVICIOS ESTOY REALIZANDO EL PAGO --CRUD
(   
    pago_id                     DECIMAL(10,0) NOT NULL,              --Identificador de pago
    nit_proveedor               DECIMAL(9,0)  NOT NULL,              --FORANEA DEL PROVEEDOR    
    id_banco                    DECIMAL(2,0)  NOT NULL,              --FORANEA DEL BANCO
    pago_fec_hor                TIMESTAMP     NOT NULL,             --FECHA Y HORA DEL PAGO
    val_iva                     DECIMAL(2,0)  NOT NULL    DEFAULT 0, --VALOR DEL IVA
    val_neto                    DECIMAL(10,0) NOT NULL,              --VALOR NETO DEL PAGO*-*
    val_total                   DECIMAL(10,0) NOT NULL,              --VALOR TOTAL INCLUYE IVA-*-
    cta_pgo                     VARCHAR(20)   NOT NULL,              --CUENTA DONDE SE REALIZA EL PAGO
    usr_insert                  VARCHAR,        
    fec_insert                  TIMESTAMP     WITHOUT TIME ZONE,  
    usr_update                  VARCHAR,                       
    fec_update                  TIMESTAMP     WITHOUT TIME ZONE,  
    PRIMARY KEY (pago_id),
    FOREIGN KEY (nit_proveedor)      REFERENCES proveedor(proveedor_nit),
    FOREIGN KEY (id_banco)           REFERENCES banco(banco_id)
);

CREATE TABLE  proveedor_servicio                      --CRUD                
(
    nit_proveedor    DECIMAL(9,0)  NOT NULL,                      --FORANEA DEL PROVEEDOR    
    id_servicio      DECIMAL(2,0)  NOT NULL,                      --FORANEA DEL SERVICIO
    estado_dispo     BOOLEAN       NOT NULL,
    valor_iva        DECIMAL(2,0)  NOT NULL,
    precio_proveedor DECIMAL(10,0) NOT NULL,
    precio_reserva   DECIMAL(10,0) NOT NULL,
    usr_insert       VARCHAR,
    fec_insert       TIMESTAMP     WITHOUT TIME ZONE,
    usr_update       VARCHAR,
    fec_update       TIMESTAMP     WITHOUT TIME ZONE,
    PRIMARY KEY(nit_proveedor,id_servicio),
    FOREIGN KEY(nit_proveedor)  REFERENCES proveedor(proveedor_nit),
    FOREIGN KEY(id_servicio)    REFERENCES servicio(servicio_id)
);

CREATE TABLE alerta
(
    nit_proveedor    DECIMAL(9,0)  NOT NULL,--FORANEA DEL PROVEEDOR    
    id_servicio      DECIMAL(2,0)  NOT NULL,--FORANEA DEL SERVICIO
    alerta_msg       VARCHAR       NOT NULL,--MENSAJE DE ALERTA 
    PRIMARY KEY(nit_proveedor,id_servicio),
    FOREIGN KEY(nit_proveedor)  REFERENCES proveedor(proveedor_nit),
    FOREIGN KEY(id_servicio)    REFERENCES servicio(servicio_id)
);
 

CREATE TABLE reserva --CRUD
(
    reserva_id      DECIMAL(2,0)  NOT NULL,    --NÚMERO IDENTIFICADOR DE RESERVA
    id_cliente      DECIMAL(15,0) NOT NULL,   --FORANEA DE CLIENTE
    fec_fact        TIMESTAMP     NOT NULL     DEFAULT NOW(),
    fec_inicio      TIMESTAMP     NOT NULL,    --FECHA Y HORA  DE RESERVA
    fec_fin         TIMESTAMP     NOT NULL,     --DURACION DE RESERVA (DIAS-HORAS-MINUTOS)
    val_total       DECIMAL(10,0) NOT NULL DEFAULT 0, --VALOT TOTAL DE RESERVA 
    est_reserva     VARCHAR       NOT NULL,    -- 1->CONFIRMADA  / 2->CANCELADA  / 3->VENCIDA (ESTADO DE RESERVA)
    usr_insert      VARCHAR,
    fec_insert      TIMESTAMP     WITHOUT TIME ZONE,
    usr_update      VARCHAR,
    fec_update      TIMESTAMP     WITHOUT TIME ZONE,
    PRIMARY KEY (reserva_id),                      
    FOREIGN KEY (id_cliente)   REFERENCES  cliente(cliente_id)   
);

CREATE TABLE detalle_reserva --CRUD
(
    id_reserva     DECIMAL(2,0)    NOT NULL,       --FORÁNEA NÚMERO DE RESERVA
    nit_proveedor  DECIMAL(9,0)    NOT NULL,       --FORANEA DEL PROVEEDOR    
    id_servicio    DECIMAL(2,0)    NOT NULL,       --FORANEA DEL SERVICIO
    cant_persona   DECIMAL(2,0)    NOT NULL,        --CANTIDAD DE SERVICIOS
    val_bruto      DECIMAL(10,0)   NOT NULL,        --VALOR BRUTO
    val_iva        DECIMAL(2,0)    NOT NULL,        --VALOR IVA
    val_total      DECIMAL(10,0)   NOT NULL,        --VALOR TOTAL DE SERVICIOS 
    usr_insert     VARCHAR         NOT NULL,
    fec_insert     TIMESTAMP       WITHOUT TIME ZONE NOT NULL,
    PRIMARY KEY (id_reserva,nit_proveedor,id_servicio),
    FOREIGN KEY (id_reserva)  REFERENCES reserva(reserva_id),
    FOREIGN KEY (nit_proveedor,id_servicio) REFERENCES proveedor_servicio(nit_proveedor,id_servicio)    
);

CREATE TABLE abono   --CRUD
(
    abono_id          DECIMAL(2,0)    NOT NULL,          --IDENTIFICADOR DE RECAUDO
    id_reserva        DECIMAL(2,0)    NOT NULL,        --FORÁNEA NÚMERO DE RESERVA
    id_cliente        DECIMAL(15,0)   NOT NULL,          --FORANEA DE CLIENTE
    id_banco          DECIMAL(2,0)    NOT NULL,           --FORANEA DE BANCO
    abono_monto       DECIMAL(10,0)   NOT NULL,          --VALOR TOTAL DEL RECAUDO
    abono_fecha       TIMESTAMP       NOT NULL,          --REGISTRO DE FECHA Y HORA DEL RECAUDO 
    usr_insert        VARCHAR,
    fec_insert        TIMESTAMP       WITHOUT TIME ZONE,
    usr_update        VARCHAR,
    fec_update        TIMESTAMP     WITHOUT TIME ZONE,
    PRIMARY KEY (abono_id),
    FOREIGN KEY (id_reserva)  REFERENCES reserva(reserva_id),
    FOREIGN KEY (id_cliente)  REFERENCES cliente(cliente_id),
    FOREIGN KEY (id_banco)    REFERENCES banco(banco_id)
);

 
CREATE OR REPLACE FUNCTION fun_insert_parametros(wempresa_nit parametros.empresa_nit%TYPE,
                                               wempresa_nom   parametros.empresa_nom%TYPE,
                                               wempresa_ciu   parametros.empresa_ciu%TYPE,
                                               wporc_iva      parametros.porc_iva%TYPE,
                                               wnum_fact      parametros.num_fact%TYPE,
                                               wprimer_pago   parametros.primer_pago%TYPE,
                                               wadmin_mail    parametros.admin_mail%TYPE,
                                               wadmin_pass    parametros.admin_pass %TYPE
                                               )RETURNS BOOLEAN AS
$BODY$
    BEGIN
 
        INSERT INTO parametros VALUES(wempresa_nit,wempresa_nom,wempresa_ciu,wporc_iva,wnum_fact,wprimer_pago,wadmin_mail,MD5(wadmin_pass)); 
        IF FOUND THEN
            RETURN TRUE;
        ELSE
            RETURN FALSE;
        END IF;
    END;
$BODY$
LANGUAGE PLPGSQL;  
 
CREATE OR REPLACE FUNCTION fun_insert_contactos(wcontacto_nom  contacto.contacto_nom%TYPE,
                                                wcontacto_tel  contacto.contacto_tel%TYPE,
                                                wcontacto_mail contacto.contacto_mail%TYPE,
                                                wcontacto_msg  contacto.contacto_msg%TYPE) RETURNS BOOLEAN AS
$BODY$
    DECLARE wcontacto_id contacto.contacto_id%TYPE;
    BEGIN
        SELECT MAX(contacto_id) INTO wcontacto_id FROM contacto;
        IF wcontacto_id IS NULL OR  wcontacto_id =0 THEN
           wcontacto_id = 1;
        ELSE
           wcontacto_id = wcontacto_id + 1;
        END IF;
        INSERT INTO contacto VALUES(wcontacto_id,wcontacto_nom,wcontacto_tel,wcontacto_mail,wcontacto_msg);
    IF FOUND THEN
            RETURN TRUE;
        ELSE
            RETURN FALSE;
        END IF;
    END;
$BODY$
LANGUAGE PLPGSQL;

CREATE OR REPLACE FUNCTION fun_insert_clientes(wcliente_id      cliente.cliente_id%TYPE,
                                               wcliente_tip_doc cliente.cliente_tpdoc%TYPE,
                                               wcliente_nom     cliente.cliente_nom%TYPE,
                                               wcliente_ape     cliente.cliente_ape%TYPE,
                                               wcliente_nac     cliente.cliente_nac%TYPE,
                                               wcliente_mail    cliente.cliente_mail%TYPE,
                                               wcliente_pass    cliente.cliente_pass%TYPE,
                                               wcliente_tel     cliente.cliente_tel%TYPE,
                                               wcliente_cto     cliente.cliente_cto%TYPE)
                                               RETURNS BOOLEAN AS
$BODY$
    BEGIN
        
        INSERT INTO cliente VALUES(wcliente_id,wcliente_tip_doc,wcliente_nom,wcliente_ape,wcliente_nac,wcliente_mail,MD5(wcliente_pass),wcliente_tel,wcliente_cto,TRUE); 
        IF FOUND THEN
            RETURN TRUE;
        ELSE
            RETURN FALSE;
        END IF;
    END;
$BODY$
LANGUAGE PLPGSQL;  

CREATE OR REPLACE FUNCTION fun_insert_tipo_servicios(wtpo_servicio_nom tipo_servicio.tpo_servicio_nom%TYPE) RETURNS BOOLEAN AS
                                               
$BODY$
    DECLARE wtpo_servicio_id tipo_servicio.tpo_servicio_id%TYPE; 
    BEGIN
        SELECT MAX(tpo_servicio_id) INTO wtpo_servicio_id FROM tipo_servicio ;
        IF wtpo_servicio_id IS NULL OR wtpo_servicio_id=0 THEN
          wtpo_servicio_id = 1;
        ELSE
           wtpo_servicio_id =wtpo_servicio_id + 1;
        END IF;
        INSERT INTO tipo_servicio  VALUES(wtpo_servicio_id,wtpo_servicio_nom,TRUE);
        IF FOUND THEN
            RETURN TRUE;
        ELSE
            RETURN FALSE;
        END IF;
    END;
$BODY$
LANGUAGE PLPGSQL; 

 
CREATE OR REPLACE FUNCTION fun_insert_servicios(wid_tpo_servicio servicio.id_tpo_servicio%TYPE,
                                                wservicio_nom    servicio.servicio_nom%TYPE,
                                                wservicio_det    servicio.servicio_det%TYPE,
                                                ) RETURNS BOOLEAN AS
                                               
$BODY$
    DECLARE wservicio_id servicio.servicio_id%TYPE; 
    BEGIN
        SELECT MAX(servicio_id) INTO  wservicio_id FROM servicio;
        IF   wservicio_id IS NULL OR   wservicio_id=0 THEN
            wservicio_id = 1;
        ELSE
             wservicio_id =   wservicio_id + 1;
        END IF;
        INSERT INTO servicio VALUES(wservicio_id,wid_tpo_servicio,wservicio_nom,wservicio_det,TRUE);
        IF FOUND THEN
            RETURN TRUE;
        ELSE
            RETURN FALSE;
        END IF;
    END;
$BODY$
LANGUAGE PLPGSQL; 

CREATE OR REPLACE FUNCTION fun_insert_municipios(wmunicipio_nom municipio.municipio_nom%TYPE,
                                                 wcod_postal municipio.cod_postal%TYPE) RETURNS BOOLEAN AS
$BODY$
    DECLARE wmunicipio_id municipio.municipio_id%TYPE;
    BEGIN
        SELECT MAX(municipio_id) INTO wmunicipio_id FROM municipio;
        IF wmunicipio_id IS NULL OR  wmunicipio_id =0 THEN
           wmunicipio_id = 1;
        ELSE
           wmunicipio_id = wmunicipio_id + 1;
        END IF;
        INSERT INTO municipio VALUES(wmunicipio_id,wmunicipio_nom,wcod_postal,TRUE);
        IF FOUND THEN
            RETURN TRUE;
        ELSE
            RETURN FALSE;
        END IF;
    END;
$BODY$
LANGUAGE PLPGSQL; 
 
CREATE OR REPLACE FUNCTION fun_insert_bancos(wbanco_nom banco.banco_nom%TYPE 
                                            ) RETURNS BOOLEAN AS
$BODY$
    DECLARE wbanco_id banco.banco_id%TYPE;
    BEGIN
        SELECT MAX(banco_id) INTO wbanco_id FROM banco;
        IF wbanco_id IS NULL OR  wbanco_id =0 THEN
           wbanco_id = 1;
        ELSE
           wbanco_id = wbanco_id + 1;
        END IF;
        INSERT INTO banco VALUES(wbanco_id,wbanco_nom,TRUE);
    IF FOUND THEN
            RETURN TRUE;
        ELSE
            RETURN FALSE;
        END IF;
    END;
$BODY$
LANGUAGE PLPGSQL;  

CREATE OR REPLACE FUNCTION fun_insert_proveedores(wproveedor_nit    proveedor.proveedor_nit%TYPE,
                                                  wproveedor_rnt    proveedor.proveedor_rnt%TYPE,                  
                                                  wid_municipio     proveedor.id_municipio%TYPE,
                                                  wproveedor_nom    proveedor.proveedor_nom%TYPE,
                                                  wproveedor_dir    proveedor.proveedor_dir%TYPE,
                                                  wproveedor_mail   proveedor.proveedor_mail%TYPE,
                                                  wproveedor_tel    proveedor.proveedor_tel%TYPE 
                                                 )RETURNS BOOLEAN AS
$BODY$
    BEGIN
 
        INSERT INTO proveedor VALUES(wproveedor_nit,wproveedor_rnt,wid_municipio,wproveedor_nom,wproveedor_dir,wproveedor_mail,wproveedor_tel,TRUE); 
        IF FOUND THEN
            RETURN TRUE;
        ELSE
            RETURN FALSE;
        END IF;
    END;
$BODY$
LANGUAGE PLPGSQL;

 
CREATE OR REPLACE FUNCTION fun_insert_pro_banco(wnit_proveedor  proveedor_banco.nit_proveedor%TYPE,
                                               wid_banco       proveedor_banco.id_banco%TYPE,
                                               wnum_cuenta     proveedor_banco.num_cuenta%TYPE,
                                               wind_cta_aho    proveedor_banco.ind_cta_aho%TYPE
                                               )RETURNS BOOLEAN AS
$BODY$
    BEGIN
 
        INSERT INTO proveedor_banco VALUES(wnit_proveedor,wid_banco,wnum_cuenta,wind_cta_aho); 
        IF FOUND THEN
            RETURN TRUE;
        ELSE
            RETURN FALSE;
        END IF;
    END;
$BODY$
LANGUAGE PLPGSQL; 
 
  
CREATE OR REPLACE FUNCTION fun_insert_pro_serv(wnit_proveedor  proveedor_servicio.nit_proveedor%TYPE,
                                               wid_servicio    proveedor_servicio.id_servicio%TYPE                                                        
                                              )RETURNS BOOLEAN AS
$BODY$                                         
    BEGIN
        INSERT INTO proveedor_servicio VALUES(wnit_proveedor,wid_servicio); 
        IF FOUND THEN
            RETURN TRUE;
        ELSE
            RETURN FALSE;
        END IF;
    END;
$BODY$
LANGUAGE PLPGSQL;
 
CREATE OR REPLACE FUNCTION fun_insert_recaudos (wid_cliente        recaudo.id_cliente%TYPE,
                                                wid_banco          recaudo.id_banco%TYPE,
                                                wrecaudo_fec_hora  recaudo.recaudo_fec_hora%TYPE,
                                                wrecaudo_val_total recaudo.recaudo_val_total%TYPE
                                                )RETURNS BOOLEAN AS
$BODY$
    DECLARE wrecaudo_id recaudo.recaudo_id%TYPE;
    BEGIN
        SELECT MAX(recaudo_id) INTO wrecaudo_id FROM recaudo;
        IF wrecaudo_id IS NULL OR  wrecaudo_id =0 THEN
           wrecaudo_id = 1;
        ELSE
           wrecaudo_id = wrecaudo_id + 1;
        END IF;
        INSERT INTO recaudo VALUES(wrecaudo_id,wid_cliente,wid_banco,wrecaudo_fec_hora,wrecaudo_val_total);
    IF FOUND THEN
            RETURN TRUE;
        ELSE
            RETURN FALSE;
        END IF;
    END;
$BODY$
LANGUAGE PLPGSQL;
  
 
                                               
 
  


 
                                               
 
 
                                               
  


 
                                               
 
 
 
  
 
                                               
 
  


 
                                               
 
 
                                               
  


 
                                               
 
  
 
                                               
 
  


 
                                               
 
 
                                               
  


 
                                               
 


 
                                               
 

 
   

