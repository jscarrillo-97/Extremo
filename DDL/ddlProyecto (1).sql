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
    empresa_nit      DECIMAL(9,0)    NOT NULL,                 --NIT DE EMPRESA  
    empresa_nom      VARCHAR         NOT NULL,                 --NOMBRE DE LA EMPRESA SANTANDERXTREMO
    empresa_ciu      VARCHAR         NOT NULL,                 --CIUDAD DE LA EMPRESA  
    porc_iva         DECIMAL(2,0)    NOT NULL     DEFAULT (0), -- PORCENTAJE DEL IVA EN % 
    num_fact         DECIMAL(12,0)   NOT NULL,                 -- NÚMERO DE LA FACTURA
    primer_pago      DECIMAL(2,0)    NOT NULL,                 --VALOR DEL PRIMER DEL PRIMER PAGO
    admin_mail       VARCHAR         NOT NULL,                 --IDENTIFICADOR DE ADMINISTRADOR  
    admin_pass       VARCHAR         NOT NULL,                 --CLAVE DE ACCESO DE ADMINISTRADOR 
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
    municipio_id           VARCHAR  NOT NULL,          --CODIGO IDENTIFICADOR DE MUNICIPIO
    municipio_nom          VARCHAR       NOT NULL,     --NOMBRE DEL MUNICIPIO
    cod_postal             DECIMAL(6,0)  NOT NULL,     --CODIGO POSTAL DEL MUNICIPIO
    ind_borrado            BOOLEAN       NOT NULL,
    usr_insert             VARCHAR,
    fec_insert             TIMESTAMP     WITHOUT TIME ZONE,
    usr_update             VARCHAR,
    fec_update             TIMESTAMP     WITHOUT TIME ZONE,
    PRIMARY KEY(municipio_id)    
);

CREATE TABLE banco --CRUD
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

CREATE TABLE  proveedor_banco  --CRUD                             
( 
    nit_proveedor      DECIMAL(9,0)  NOT NULL,                      --FORANEA DEL PROVEEDOR    
    id_banco           DECIMAL(2,0)  NOT NULL,                      --FORANEA DEL SERVICIO 
    num_cuenta         DECIMAL(12,0) NOT NULL,                     --NUMERO DE CUENTA 
    ind_cta_aho        BOOLEAN       NOT NULL,                      --INDICADOR DE CUENTA  TRUE->AHORRO / FALSE->CORRIENTE  
    usr_insert         VARCHAR,
    fec_insert         TIMESTAMP     WITHOUT TIME ZONE,
    usr_update         VARCHAR,
    fec_update         TIMESTAMP     WITHOUT TIME ZONE,
    PRIMARY KEY(nit_proveedor,id_banco,num_cuenta),
    FOREIGN KEY(nit_proveedor)  REFERENCES proveedor(proveedor_nit),
    FOREIGN KEY(id_banco)       REFERENCES banco(banco_id)
);


CREATE TABLE pago  --¿Por que voy a pagar iva al proveedor?  
(                  --¿Debo saber por cuantos servicios realizo el pago?
    pago_id                     DECIMAL(10,0) NOT NULL,              --Identificador de pago
    nit_proveedor               DECIMAL(9,0)  NOT NULL,              --FORANEA DEL PROVEEDOR    
    id_banco                    DECIMAL(2,0)  NOT NULL,              --FORANEA DEL BANCO
    fecha_pago                  TIMESTAMP     NOT NULL,             --FECHA Y HORA DEL PAGO
    val_total                   DECIMAL(10,0) NOT NULL,              --VALOR TOTAL INCLUYE IVA-*-
    cta_pgo                     VARCHAR(20)   NOT NULL,              --CUENTA DONDE SE REALIZA EL PAGO
    cant_servicios              DECIMAL(2,0)  NOT NULL,              --FORANEA DEL BANCO
    usr_insert                  VARCHAR,        
    fec_insert                  TIMESTAMP     WITHOUT TIME ZONE,  
    usr_update                  VARCHAR,                       .
    fec_update                  TIMESTAMP     WITHOUT TIME ZONE,  
    PRIMARY KEY (pago_id),
    FOREIGN KEY (nit_proveedor)      REFERENCES proveedor(proveedor_nit),
    FOREIGN KEY (id_banco)           REFERENCES banco(banco_id)
    
);
 
CREATE TABLE  proveedor_servicio  --CRUD                
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
    val_total       DECIMAL(10,0) NOT NULL     DEFAULT 0, --VALOT TOTAL DE RESERVA 
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
    id_servicio    DECIMAL(2,0)    NOT NULL,        --FORANEA DEL SERVICIO
    cant_persona   DECIMAL(2,0)    NOT NULL,        --CANTIDAD DE personas
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
    id_reserva        DECIMAL(2,0)    NOT NULL,          --FORÁNEA NÚMERO DE RESERVA
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
 
--SCRIPT DE ARRANQUE 
INSERT INTO cliente (cliente_id, cliente_tpdoc, cliente_nom, cliente_ape, cliente_nac, cliente_mail, cliente_pass, cliente_tel, cliente_cto, ind_borrado)
VALUES (1232894168, 'CC', 'Juan', 'Pérez', '1990-01-01', 'juan@example.com', MD5('mipassword123'), 1234567890, 9876543210, true);
INSERT INTO parametros VALUES (169878951,'SantanderXtreme','Bucaramanga',19,111612012120,,19,'admin@gmail.com',MD5('admin123'));
INSERT INTO tipo_servicio VALUES (1,'Deporte Extremo',TRUE);
INSERT INTO tipo_servicio VALUES (2,'Hospedaje',TRUE);
INSERT INTO servicio VALUES (1,1,'Parapente','Descubre la emoción del parapente en Ruitoque entre las 11:30 a.m. y las 4:00 p.m. Disfruta de un vuelo dinámico de aproximadamente 15 minutos. ',95000,TRUE);
INSERT INTO servicio VALUES (2,1,'Cuatrimotos','40 minutos de recorrido',65000,TRUE);
INSERT INTO servicio VALUES (3,1,'Rafting','20 minutos',110000,TRUE);
INSERT INTO servicio VALUES (4,1,'Bungee Jumping','Duración 30 minutos',90000,TRUE);
 
INSERT INTO banco  VALUES (01,'BBVA',TRUE);
INSERT INTO banco  VALUES (02,'Bancolombia',TRUE);
INSERT INTO banco  VALUES (03,'Nequi',TRUE);
INSERT INTO proveedor VALUES (801234785,54875,01,'Bungee Extremo','Calle 4 25-87','bungee-ext@gmail.com',3158745269,TRUE);

 --Insertaremos los datos de la tabla de departamentos, con su respectivo numero 
INSERT INTO tab_deptos VALUES ('05', 'ANTIOQUIA'); 
INSERT INTO tab_deptos VALUES ('08', 'ATLANTICO'); 
INSERT INTO tab_deptos VALUES ('11', 'BOGOTA D.C.'); 
INSERT INTO tab_deptos VALUES ('13', 'BOLIVAR'); 
INSERT INTO tab_deptos VALUES ('15', 'BOYACA'); 
INSERT INTO tab_deptos VALUES ('17', 'CALDAS'); 
INSERT INTO tab_deptos VALUES ('18', 'CAQUETA'); 
INSERT INTO tab_deptos VALUES ('19', 'CAUCA'); 
INSERT INTO tab_deptos VALUES ('20', 'CESAR'); 
INSERT INTO tab_deptos VALUES ('23', 'CORDOBA'); 
INSERT INTO tab_deptos VALUES ('25', 'CUNDINAMARCA'); 
INSERT INTO tab_deptos VALUES ('27', 'CHOCO'); 
INSERT INTO tab_deptos VALUES ('41', 'HUILA'); 
INSERT INTO tab_deptos VALUES ('44', 'LA GUAJIRA'); 
INSERT INTO tab_deptos VALUES ('47', 'MAGDALENA'); 
INSERT INTO tab_deptos VALUES ('50', 'META'); 
INSERT INTO tab_deptos VALUES ('52', 'NARIÑO'); 
INSERT INTO tab_deptos VALUES ('54', 'NORTE DE SANTANDER'); 
INSERT INTO tab_deptos VALUES ('63', 'QUINDIO'); 
INSERT INTO tab_deptos VALUES ('66', 'RISARALDA'); 
INSERT INTO tab_deptos VALUES ('68', 'SANTANDER'); 
INSERT INTO tab_deptos VALUES ('70', 'SUCRE'); 
INSERT INTO tab_deptos VALUES ('73', 'TOLIMA'); 
INSERT INTO tab_deptos VALUES ('76', 'VALLE DEL CAUCA'); 
INSERT INTO tab_deptos VALUES ('81', 'ARAUCA'); 
INSERT INTO tab_deptos VALUES ('85', 'CASANARE'); 
INSERT INTO tab_deptos VALUES ('86', 'PUTUMAYO'); 
INSERT INTO tab_deptos VALUES ('88', 'SAN ANDRES Y PROVIDENCIA'); 
INSERT INTO tab_deptos VALUES ('91', 'AMAZONAS'); 
INSERT INTO tab_deptos VALUES ('94', 'GUAINIA'); 
INSERT INTO tab_deptos VALUES ('95', 'GUAVIARE'); 
INSERT INTO tab_deptos VALUES ('97', 'VAUPES'); 
INSERT INTO tab_deptos VALUES ('99', 'VICHADA'); 


--Insertaremos los datos de la tabla de ciudades, con su respectivo codigo postal y su departamento 
INSERT INTO municipio VALUES ('05','05001','MEDELLÍN'); 
INSERT INTO municipio VALUES ('05','05002','ABEJORRAL'); 
INSERT INTO municipio VALUES ('05','05004','ABRIAQUÍ'); 
INSERT INTO municipio VALUES ('05','05021','ALEJANDRÍA'); 
INSERT INTO municipio VALUES ('05','05030','AMAGÁ'); 
INSERT INTO municipio VALUES ('05','05031','AMALFI'); 
INSERT INTO municipio VALUES ('05','05034','ANDES'); 
INSERT INTO municipio VALUES ('05','05036','ANGELÓPOLIS'); 
INSERT INTO municipio VALUES ('05','05038','ANGOSTURA'); 
INSERT INTO municipio VALUES ('05','05040','ANORÍ'); 
INSERT INTO municipio VALUES ('05','05042','SANTAFÉ DE ANTIOQUIA'); 
INSERT INTO municipio VALUES ('05','05044','ANZA'); 
INSERT INTO municipio VALUES ('05','05045','APARTADÓ'); 
INSERT INTO municipio VALUES ('05','05051','ARBOLETES'); 
INSERT INTO municipio VALUES ('05','05055','ARGELIA'); 
INSERT INTO municipio VALUES ('05','05059','ARMENIA'); 
INSERT INTO municipio VALUES ('05','05079','BARBOSA'); 
INSERT INTO municipio VALUES ('05','05086','BELMIRA'); 
INSERT INTO municipio VALUES ('05','05088','BELLO'); 
INSERT INTO municipio VALUES ('05','05091','BETANIA'); 
INSERT INTO municipio VALUES ('05','05093','BETULIA'); 
INSERT INTO municipio VALUES ('05','05101','CIUDAD BOLÍVAR'); 
INSERT INTO municipio VALUES ('05','05107','BRICEÑO'); 
INSERT INTO municipio VALUES ('05','05113','BURITICÁ'); 
INSERT INTO municipio VALUES ('05','05120','CÁCERES'); 
INSERT INTO municipio VALUES ('05','05125','CAICEDO'); 
INSERT INTO municipio VALUES ('05','05129','CALDAS'); 
INSERT INTO municipio VALUES ('05','05134','CAMPAMENTO'); 
INSERT INTO municipio VALUES ('05','05138','CAÑASGORDAS'); 
INSERT INTO municipio VALUES ('05','05142','CARACOLÍ'); 
INSERT INTO municipio VALUES ('05','05145','CARAMANTA'); 
INSERT INTO municipio VALUES ('05','05147','CAREPA'); 
INSERT INTO municipio VALUES ('05','05148','EL CARMEN DE VIBORAL'); 
INSERT INTO municipio VALUES ('05','05150','CAROLINA'); 
INSERT INTO municipio VALUES ('05','05154','CAUCASIA'); 
INSERT INTO municipio VALUES ('05','05172','CHIGORODÓ'); 
INSERT INTO municipio VALUES ('05','05190','CISNEROS'); 
INSERT INTO municipio VALUES ('05','05197','COCORNÁ'); 
INSERT INTO municipio VALUES ('05','05206','CONCEPCIÓN'); 
INSERT INTO municipio VALUES ('05','05209','CONCORDIA'); 
INSERT INTO municipio VALUES ('05','05212','COPACABANA'); 
INSERT INTO municipio VALUES ('05','05234','DABEIBA'); 
INSERT INTO municipio VALUES ('05','05237','DON MATÍAS'); 
INSERT INTO municipio VALUES ('05','05240','EBÉJICO'); 
INSERT INTO municipio VALUES ('05','05250','EL BAGRE'); 
INSERT INTO municipio VALUES ('05','05264','ENTRERRIOS'); 
INSERT INTO municipio VALUES ('05','05266','ENVIGADO'); 
INSERT INTO municipio VALUES ('05','05282','FREDONIA'); 
INSERT INTO municipio VALUES ('05','05284','FRONTINO'); 
INSERT INTO municipio VALUES ('05','05306','GIRALDO'); 
INSERT INTO municipio VALUES ('05','05308','GIRARDOTA'); 
INSERT INTO municipio VALUES ('05','05310','GÓMEZ PLATA'); 
INSERT INTO municipio VALUES ('05','05313','GRANADA'); 
INSERT INTO municipio VALUES ('05','05315','GUADALUPE'); 
INSERT INTO municipio VALUES ('05','05318','GUARNE'); 
INSERT INTO municipio VALUES ('05','05321','GUATAPE'); 
INSERT INTO municipio VALUES ('05','05347','HELICONIA'); 
INSERT INTO municipio VALUES ('05','05353','HISPANIA'); 
INSERT INTO municipio VALUES ('05','05360','ITAGUI'); 
INSERT INTO municipio VALUES ('05','05361','ITUANGO'); 
INSERT INTO municipio VALUES ('05','05364','JARDÍN'); 
INSERT INTO municipio VALUES ('05','05368','JERICÓ'); 
INSERT INTO municipio VALUES ('05','05376','LA CEJA'); 
INSERT INTO municipio VALUES ('05','05380','LA ESTRELLA'); 
INSERT INTO municipio VALUES ('05','05390','LA PINTADA'); 
INSERT INTO municipio VALUES ('05','05400','LA UNIÓN'); 
INSERT INTO municipio VALUES ('05','05411','LIBORINA'); 
INSERT INTO municipio VALUES ('05','05425','MACEO'); 
INSERT INTO municipio VALUES ('05','05440','MARINILLA'); 
INSERT INTO municipio VALUES ('05','05467','MONTEBELLO'); 
INSERT INTO municipio VALUES ('05','05475','MURINDÓ'); 
INSERT INTO municipio VALUES ('05','05480','MUTATÁ'); 
INSERT INTO municipio VALUES ('05','05483','NARIÑO'); 
INSERT INTO municipio VALUES ('05','05490','NECOCLÍ'); 
INSERT INTO municipio VALUES ('05','05495','NECHÍ'); 
INSERT INTO municipio VALUES ('05','05501','OLAYA'); 
INSERT INTO municipio VALUES ('05','05541','PEÑOL'); 
INSERT INTO municipio VALUES ('05','05543','PEQUE'); 
INSERT INTO municipio VALUES ('05','05576','PUEBLORRICO'); 
INSERT INTO municipio VALUES ('05','05579','PUERTO BERRÍO'); 
INSERT INTO municipio VALUES ('05','05585','PUERTO NARE'); 
INSERT INTO municipio VALUES ('05','05591','PUERTO TRIUNFO'); 
INSERT INTO municipio VALUES ('05','05604','REMEDIOS'); 
INSERT INTO municipio VALUES ('05','05607','RETIRO'); 
INSERT INTO municipio VALUES ('05','05615','RIONEGRO'); 
INSERT INTO municipio VALUES ('05','05628','SABANALARGA'); 
INSERT INTO municipio VALUES ('05','05631','SABANETA'); 
INSERT INTO municipio VALUES ('05','05642','SALGAR'); 
INSERT INTO municipio VALUES ('05','05647','SAN ANDRÉS DE CUERQUÍA'); 
INSERT INTO municipio VALUES ('05','05649','SAN CARLOS'); 
INSERT INTO municipio VALUES ('05','05652','SAN FRANCISCO'); 
INSERT INTO municipio VALUES ('05','05656','SAN JERÓNIMO'); 
INSERT INTO municipio VALUES ('05','05658','SAN JOSÉ DE LA MONTAÑA'); 
INSERT INTO municipio VALUES ('05','05659','SAN JUAN DE URABÁ'); 
INSERT INTO municipio VALUES ('05','05660','SAN LUIS'); 
INSERT INTO municipio VALUES ('05','05664','SAN PEDRO'); 
INSERT INTO municipio VALUES ('05','05665','SAN PEDRO DE URABA'); 
INSERT INTO municipio VALUES ('05','05667','SAN RAFAEL'); 
INSERT INTO municipio VALUES ('05','05670','SAN ROQUE'); 
INSERT INTO municipio VALUES ('05','05674','SAN VICENTE'); 
INSERT INTO municipio VALUES ('05','05679','SANTA BÁRBARA'); 
INSERT INTO municipio VALUES ('05','05686','SANTA ROSA DE OSOS'); 
INSERT INTO municipio VALUES ('05','05690','SANTO DOMINGO'); 
INSERT INTO municipio VALUES ('05','05697','EL SANTUARIO'); 
INSERT INTO municipio VALUES ('05','05736','SEGOVIA'); 
INSERT INTO municipio VALUES ('05','05756','SONSON'); 
INSERT INTO municipio VALUES ('05','05761','SOPETRÁN'); 
INSERT INTO municipio VALUES ('05','05789','TÁMESIS'); 
INSERT INTO municipio VALUES ('05','05790','TARAZÁ'); 
INSERT INTO municipio VALUES ('05','05792','TARSO'); 
INSERT INTO municipio VALUES ('05','05809','TITIRIBÍ'); 
INSERT INTO municipio VALUES ('05','05819','TOLEDO'); 
INSERT INTO municipio VALUES ('05','05837','TURBO'); 
INSERT INTO municipio VALUES ('05','05842','URAMITA'); 
INSERT INTO municipio VALUES ('05','05847','URRAO'); 
INSERT INTO municipio VALUES ('05','05854','VALDIVIA'); 
INSERT INTO municipio VALUES ('05','05856','VALPARAÍSO'); 
INSERT INTO municipio VALUES ('05','05858','VEGACHÍ'); 
INSERT INTO municipio VALUES ('05','05861','VENECIA'); 
INSERT INTO municipio VALUES ('05','05873','VIGÍA DEL FUERTE'); 
INSERT INTO municipio VALUES ('05','05885','YALÍ'); 
INSERT INTO municipio VALUES ('05','05887','YARUMAL'); 
INSERT INTO municipio VALUES ('05','05890','YOLOMBÓ'); 
INSERT INTO municipio VALUES ('05','05893','YONDÓ'); 
INSERT INTO municipio VALUES ('05','05895','ZARAGOZA'); 
INSERT INTO municipio VALUES ('08','08001','BARRANQUILLA'); 
INSERT INTO municipio VALUES ('08','08078','BARANOA'); 
INSERT INTO municipio VALUES ('08','08137','CAMPO DE LA CRUZ'); 
INSERT INTO municipio VALUES ('08','08141','CANDELARIA'); 
INSERT INTO municipio VALUES ('08','08296','GALAPA'); 
INSERT INTO municipio VALUES ('08','08372','JUAN DE ACOSTA'); 
INSERT INTO municipio VALUES ('08','08421','LURUACO'); 
INSERT INTO municipio VALUES ('08','08433','MALAMBO'); 
INSERT INTO municipio VALUES ('08','08436','MANATÍ'); 
INSERT INTO municipio VALUES ('08','08520','PALMAR DE VARELA'); 
INSERT INTO municipio VALUES ('08','08549','PIOJÓ'); 
INSERT INTO municipio VALUES ('08','08558','POLONUEVO'); 
INSERT INTO municipio VALUES ('08','08560','PONEDERA'); 
INSERT INTO municipio VALUES ('08','08573','PUERTO COLOMBIA'); 
INSERT INTO municipio VALUES ('08','08606','REPELÓN'); 
INSERT INTO municipio VALUES ('08','08634','SABANAGRANDE'); 
INSERT INTO municipio VALUES ('08','08638','SABANALARGA'); 
INSERT INTO municipio VALUES ('08','08675','SANTA LUCÍA'); 
INSERT INTO municipio VALUES ('08','08685','SANTO TOMÁS'); 
INSERT INTO municipio VALUES ('08','08758','SOLEDAD'); 
INSERT INTO municipio VALUES ('08','08770','SUAN'); 
INSERT INTO municipio VALUES ('08','08832','TUBARÁ'); 
INSERT INTO municipio VALUES ('08','08849','USIACURÍ'); 
INSERT INTO municipio VALUES ('11','11001','BOGOTÁ, D.C.'); 
INSERT INTO municipio VALUES ('13','13001','CARTAGENA'); 
INSERT INTO municipio VALUES ('13','13006','ACHÍ'); 
INSERT INTO municipio VALUES ('13','13030','ALTOS DEL ROSARIO'); 
INSERT INTO municipio VALUES ('13','13042','ARENAL'); 
INSERT INTO municipio VALUES ('13','13052','ARJONA'); 
INSERT INTO municipio VALUES ('13','13062','ARROYOHONDO'); 
INSERT INTO municipio VALUES ('13','13074','BARRANCO DE LOBA'); 
INSERT INTO municipio VALUES ('13','13140','CALAMAR'); 
INSERT INTO municipio VALUES ('13','13160','CANTAGALLO'); 
INSERT INTO municipio VALUES ('13','13188','CICUCO'); 
INSERT INTO municipio VALUES ('13','13212','CÓRDOBA'); 
INSERT INTO municipio VALUES ('13','13222','CLEMENCIA'); 
INSERT INTO municipio VALUES ('13','13244','EL CARMEN DE BOLÍVAR'); 
INSERT INTO municipio VALUES ('13','13248','EL GUAMO'); 
INSERT INTO municipio VALUES ('13','13268','EL PEÑÓN'); 
INSERT INTO municipio VALUES ('13','13300','HATILLO DE LOBA'); 
INSERT INTO municipio VALUES ('13','13430','MAGANGUÉ'); 
INSERT INTO municipio VALUES ('13','13433','MAHATES'); 
INSERT INTO municipio VALUES ('13','13440','MARGARITA'); 
INSERT INTO municipio VALUES ('13','13442','MARÍA LA BAJA'); 
INSERT INTO municipio VALUES ('13','13458','MONTECRISTO'); 
INSERT INTO municipio VALUES ('13','13468','MOMPÓS'); 
INSERT INTO municipio VALUES ('13','13473','MORALES'); 
INSERT INTO municipio VALUES ('13','13549','PINILLOS'); 
INSERT INTO municipio VALUES ('13','13580','REGIDOR'); 
INSERT INTO municipio VALUES ('13','13600','RÍO VIEJO'); 
INSERT INTO municipio VALUES ('13','13620','SAN CRISTÓBAL'); 
INSERT INTO municipio VALUES ('13','13647','SAN ESTANISLAO'); 
INSERT INTO municipio VALUES ('13','13650','SAN FERNANDO'); 
INSERT INTO municipio VALUES ('13','13654','SAN JACINTO'); 
INSERT INTO municipio VALUES ('13','13655','SAN JACINTO DEL CAUCA'); 
INSERT INTO municipio VALUES ('13','13657','SAN JUAN NEPOMUCENO'); 
INSERT INTO municipio VALUES ('13','13667','SAN MARTÍN DE LOBA'); 
INSERT INTO municipio VALUES ('13','13670','SAN PABLO'); 
INSERT INTO municipio VALUES ('13','13673','SANTA CATALINA'); 
INSERT INTO municipio VALUES ('13','13683','SANTA ROSA'); 
INSERT INTO municipio VALUES ('13','13688','SANTA ROSA DEL SUR'); 
INSERT INTO municipio VALUES ('13','13744','SIMITÍ'); 
INSERT INTO municipio VALUES ('13','13760','SOPLAVIENTO'); 
INSERT INTO municipio VALUES ('13','13780','TALAIGUA NUEVO'); 
INSERT INTO municipio VALUES ('13','13810','TIQUISIO'); 
INSERT INTO municipio VALUES ('13','13836','TURBACO'); 
INSERT INTO municipio VALUES ('13','13838','TURBANÁ'); 
INSERT INTO municipio VALUES ('13','13873','VILLANUEVA'); 
INSERT INTO municipio VALUES ('13','13894','ZAMBRANO'); 
INSERT INTO municipio VALUES ('15','15001','TUNJA'); 
INSERT INTO municipio VALUES ('15','15022','ALMEIDA'); 
INSERT INTO municipio VALUES ('15','15047','AQUITANIA'); 
INSERT INTO municipio VALUES ('15','15051','ARCABUCO'); 
INSERT INTO municipio VALUES ('15','15087','BELÉN'); 
INSERT INTO municipio VALUES ('15','15090','BERBEO'); 
INSERT INTO municipio VALUES ('15','15092','BETÉITIVA'); 
INSERT INTO municipio VALUES ('15','15097','BOAVITA'); 
INSERT INTO municipio VALUES ('15','15104','BOYACÁ'); 
INSERT INTO municipio VALUES ('15','15106','BRICEÑO'); 
INSERT INTO municipio VALUES ('15','15109','BUENAVISTA'); 
INSERT INTO municipio VALUES ('15','15114','BUSBANZÁ'); 
INSERT INTO municipio VALUES ('15','15131','CALDAS'); 
INSERT INTO municipio VALUES ('15','15135','CAMPOHERMOSO'); 
INSERT INTO municipio VALUES ('15','15162','CERINZA'); 
INSERT INTO municipio VALUES ('15','15172','CHINAVITA'); 
INSERT INTO municipio VALUES ('15','15176','CHIQUINQUIRÁ'); 
INSERT INTO municipio VALUES ('15','15180','CHISCAS'); 
INSERT INTO municipio VALUES ('15','15183','CHITA'); 
INSERT INTO municipio VALUES ('15','15185','CHITARAQUE'); 
INSERT INTO municipio VALUES ('15','15187','CHIVATÁ'); 
INSERT INTO municipio VALUES ('15','15189','CIÉNEGA'); 
INSERT INTO municipio VALUES ('15','15204','CÓMBITA'); 
INSERT INTO municipio VALUES ('15','15212','COPER'); 
INSERT INTO municipio VALUES ('15','15215','CORRALES'); 
INSERT INTO municipio VALUES ('15','15218','COVARACHÍA'); 
INSERT INTO municipio VALUES ('15','15223','CUBARÁ'); 
INSERT INTO municipio VALUES ('15','15224','CUCAITA'); 
INSERT INTO municipio VALUES ('15','15226','CUÍTIVA'); 
INSERT INTO municipio VALUES ('15','15232','CHÍQUIZA'); 
INSERT INTO municipio VALUES ('15','15236','CHIVOR'); 
INSERT INTO municipio VALUES ('15','15238','DUITAMA'); 
INSERT INTO municipio VALUES ('15','15244','EL COCUY'); 
INSERT INTO municipio VALUES ('15','15248','EL6aSPINO'); 
INSERT INTO municipio VALUES ('15','15272','FIRAVITOBA'); 
INSERT INTO municipio VALUES ('15','15276','FLORESTA'); 
INSERT INTO municipio VALUES ('15','15293','GACHANTIVÁ'); 
INSERT INTO municipio VALUES ('15','15296','GAMEZA'); 
INSERT INTO municipio VALUES ('15','15299','GARAGOA'); 
INSERT INTO municipio VALUES ('15','15317','GUACAMAYAS'); 
INSERT INTO municipio VALUES ('15','15322','GUATEQUE'); 
INSERT INTO municipio VALUES ('15','15325','GUAYATÁ'); 
INSERT INTO municipio VALUES ('15','15332','GÜICÁN'); 
INSERT INTO municipio VALUES ('15','15362','IZA'); 
INSERT INTO municipio VALUES ('15','15367','JENESANO'); 
INSERT INTO municipio VALUES ('15','15368','JERICÓ'); 
INSERT INTO municipio VALUES ('15','15377','LABRANZAGRANDE'); 
INSERT INTO municipio VALUES ('15','15380','LA CAPILLA'); 
INSERT INTO municipio VALUES ('15','15401','LA VICTORIA'); 
INSERT INTO municipio VALUES ('15','15403','LA UVITA'); 
INSERT INTO municipio VALUES ('15','15407','VILLA DE LEYVA'); 
INSERT INTO municipio VALUES ('15','15425','MACANAL'); 
INSERT INTO municipio VALUES ('15','15442','MARIPÍ'); 
INSERT INTO municipio VALUES ('15','15455','MIRAFLORES'); 
INSERT INTO municipio VALUES ('15','15464','MONGUA'); 
INSERT INTO municipio VALUES ('15','15466','MONGUÍ'); 
INSERT INTO municipio VALUES ('15','15469','MONIQUIRÁ'); 
INSERT INTO municipio VALUES ('15','15476','MOTAVITA'); 
INSERT INTO municipio VALUES ('15','15480','MUZO'); 
INSERT INTO municipio VALUES ('15','15491','NOBSA'); 
INSERT INTO municipio VALUES ('15','15494','NUEVO COLÓN'); 
INSERT INTO municipio VALUES ('15','15500','OICATÁ'); 
INSERT INTO municipio VALUES ('15','15507','OTANCHE'); 
INSERT INTO municipio VALUES ('15','15511','PACHAVITA'); 
INSERT INTO municipio VALUES ('15','15514','PÁEZ'); 
INSERT INTO municipio VALUES ('15','15516','PAIPA'); 
INSERT INTO municipio VALUES ('15','15518','PAJARITO'); 
INSERT INTO municipio VALUES ('15','15522','PANQUEBA'); 
INSERT INTO municipio VALUES ('15','15531','PAUNA'); 
INSERT INTO municipio VALUES ('15','15533','PAYA'); 
INSERT INTO municipio VALUES ('15','15537','PAZ DE RÍO'); 
INSERT INTO municipio VALUES ('15','15542','PESCA'); 
INSERT INTO municipio VALUES ('15','15550','PISBA'); 
INSERT INTO municipio VALUES ('15','15572','PUERTO BOYACÁ'); 
INSERT INTO municipio VALUES ('15','15580','QUÍPAMA'); 
INSERT INTO municipio VALUES ('15','15599','RAMIRIQUÍ'); 
INSERT INTO municipio VALUES ('15','15600','RÁQUIRA'); 
INSERT INTO municipio VALUES ('15','15621','RONDÓN'); 
INSERT INTO municipio VALUES ('15','15632','SABOYÁ'); 
INSERT INTO municipio VALUES ('15','15638','SÁCHICA'); 
INSERT INTO municipio VALUES ('15','15646','SAMACÁ'); 
INSERT INTO municipio VALUES ('15','15660','SAN EDUARDO'); 
INSERT INTO municipio VALUES ('15','15664','SAN JOSÉ DE PARE'); 
INSERT INTO municipio VALUES ('15','15667','SAN LUIS DE GACENO'); 
INSERT INTO municipio VALUES ('15','15673','SAN MATEO'); 
INSERT INTO municipio VALUES ('15','15676','SAN MIGUEL DE SEMA'); 
INSERT INTO municipio VALUES ('15','15681','SAN PABLO DE BORBUR'); 
INSERT INTO municipio VALUES ('15','15686','SANTANA'); 
INSERT INTO municipio VALUES ('15','15690','SANTA MARÍA'); 
INSERT INTO municipio VALUES ('15','15693','SANTA ROSA DE VITERBO'); 
INSERT INTO municipio VALUES ('15','15696','SANTA SOFÍA'); 
INSERT INTO municipio VALUES ('15','15720','SATIVANORTE'); 
INSERT INTO municipio VALUES ('15','15723','SATIVASUR'); 
INSERT INTO municipio VALUES ('15','15740','SIACHOQUE'); 
INSERT INTO municipio VALUES ('15','15753','SOATÁ'); 
INSERT INTO municipio VALUES ('15','15755','SOCOTÁ'); 
INSERT INTO municipio VALUES ('15','15757','SOCHA'); 
INSERT INTO municipio VALUES ('15','15759','SOGAMOSO'); 
INSERT INTO municipio VALUES ('15','15761','SOMONDOCO'); 
INSERT INTO municipio VALUES ('15','15762','SORA'); 
INSERT INTO municipio VALUES ('15','15763','SOTAQUIRÁ'); 
INSERT INTO municipio VALUES ('15','15764','SORACÁ'); 
INSERT INTO municipio VALUES ('15','15774','SUSACÓN'); 
INSERT INTO municipio VALUES ('15','15776','SUTAMARCHÁN'); 
INSERT INTO municipio VALUES ('15','15778','SUTATENZA'); 
INSERT INTO municipio VALUES ('15','15790','TASCO'); 
INSERT INTO municipio VALUES ('15','15798','TENZA'); 
INSERT INTO municipio VALUES ('15','15804','TIBANÁ'); 
INSERT INTO municipio VALUES ('15','15806','TIBASOSA'); 
INSERT INTO municipio VALUES ('15','15808','TINJACÁ'); 
INSERT INTO municipio VALUES ('15','15810','TIPACOQUE'); 
INSERT INTO municipio VALUES ('15','15814','TOCA'); 
INSERT INTO municipio VALUES ('15','15816','TOGÜÍ'); 
INSERT INTO municipio VALUES ('15','15820','TÓPAGA'); 
INSERT INTO municipio VALUES ('15','15822','TOTA'); 
INSERT INTO municipio VALUES ('15','15832','TUNUNGUÁ'); 
INSERT INTO municipio VALUES ('15','15835','TURMEQUÉ'); 
INSERT INTO municipio VALUES ('15','15837','TUTA'); 
INSERT INTO municipio VALUES ('15','15839','TUTAZÁ'); 
INSERT INTO municipio VALUES ('15','15842','UMBITA'); 
INSERT INTO municipio VALUES ('15','15861','VENTAQUEMADA'); 
INSERT INTO municipio VALUES ('15','15879','VIRACACHÁ'); 
INSERT INTO municipio VALUES ('15','15897','ZETAQUIRA'); 
INSERT INTO municipio VALUES ('17','17001','MANIZALES'); 
INSERT INTO municipio VALUES ('17','17013','AGUADAS'); 
INSERT INTO municipio VALUES ('17','17042','ANSERMA'); 
INSERT INTO municipio VALUES ('17','17050','ARANZAZU'); 
INSERT INTO municipio VALUES ('17','17088','BELALCÁZAR'); 
INSERT INTO municipio VALUES ('17','17174','CHINCHINÁ'); 
INSERT INTO municipio VALUES ('17','17272','FILADELFIA'); 
INSERT INTO municipio VALUES ('17','17380','LA DORADA'); 
INSERT INTO municipio VALUES ('17','17388','LA MERCED'); 
INSERT INTO municipio VALUES ('17','17433','MANZANARES'); 
INSERT INTO municipio VALUES ('17','17442','MARMATO'); 
INSERT INTO municipio VALUES ('17','17444','MARQUETALIA'); 
INSERT INTO municipio VALUES ('17','17446','MARULANDA'); 
INSERT INTO municipio VALUES ('17','17486','NEIRA'); 
INSERT INTO municipio VALUES ('17','17495','NORCASIA'); 
INSERT INTO municipio VALUES ('17','17513','PÁCORA'); 
INSERT INTO municipio VALUES ('17','17524','PALESTINA'); 
INSERT INTO municipio VALUES ('17','17541','PENSILVANIA'); 
INSERT INTO municipio VALUES ('17','17614','RIOSUCIO'); 
INSERT INTO municipio VALUES ('17','17616','RISARALDA'); 
INSERT INTO municipio VALUES ('17','17653','SALAMINA'); 
INSERT INTO municipio VALUES ('17','17662','SAMANÁ'); 
INSERT INTO municipio VALUES ('17','17665','SAN JOSÉ'); 
INSERT INTO municipio VALUES ('17','17777','SUPÍA'); 
INSERT INTO municipio VALUES ('17','17867','VICTORIA'); 
INSERT INTO municipio VALUES ('17','17873','VILLAMARÍA'); 
INSERT INTO municipio VALUES ('17','17877','VITERBO'); 
INSERT INTO municipio VALUES ('18','18001','FLORENCIA'); 
INSERT INTO municipio VALUES ('18','18029','ALBANIA'); 
INSERT INTO municipio VALUES ('18','18094','BELÉN DE LOS ANDAQUIES'); 
INSERT INTO municipio VALUES ('18','18150','CARTAGENA DEL CHAIRÁ'); 
INSERT INTO municipio VALUES ('18','18205','CURILLO'); 
INSERT INTO municipio VALUES ('18','18247','EL DONCELLO'); 
INSERT INTO municipio VALUES ('18','18256','EL PAUJIL'); 
INSERT INTO municipio VALUES ('18','18410','LA MONTAÑITA'); 
INSERT INTO municipio VALUES ('18','18460','MILÁN'); 
INSERT INTO municipio VALUES ('18','18479','MORELIA'); 
INSERT INTO municipio VALUES ('18','18592','PUERTO RICO'); 
INSERT INTO municipio VALUES ('18','18610','SAN JOSÉ DEL FRAGUA'); 
INSERT INTO municipio VALUES ('18','18753','SAN VICENTE DEL CAGUÁN'); 
INSERT INTO municipio VALUES ('18','18756','SOLANO'); 
INSERT INTO municipio VALUES ('18','18785','SOLITA'); 
INSERT INTO municipio VALUES ('18','18860','VALPARAÍSO'); 
INSERT INTO municipio VALUES ('19','19001','POPAYÁN'); 
INSERT INTO municipio VALUES ('19','19022','ALMAGUER'); 
INSERT INTO municipio VALUES ('19','19050','ARGELIA'); 
INSERT INTO municipio VALUES ('19','19075','BALBOA'); 
INSERT INTO municipio VALUES ('19','19100','BOLÍVAR'); 
INSERT INTO municipio VALUES ('19','19110','BUENOS AIRES'); 
INSERT INTO municipio VALUES ('19','19130','CAJIBÍO'); 
INSERT INTO municipio VALUES ('19','19137','CALDONO'); 
INSERT INTO municipio VALUES ('19','19142','CALOTO'); 
INSERT INTO municipio VALUES ('19','19212','CORINTO'); 
INSERT INTO municipio VALUES ('19','19256','EL TAMBO'); 
INSERT INTO municipio VALUES ('19','19290','FLORENCIA'); 
INSERT INTO municipio VALUES ('19','19300','GUACHENÉ'); 
INSERT INTO municipio VALUES ('19','19318','GUAPI'); 
INSERT INTO municipio VALUES ('19','19355','INZÁ'); 
INSERT INTO municipio VALUES ('19','19364','JAMBALÓ'); 
INSERT INTO municipio VALUES ('19','19392','LA SIERRA'); 
INSERT INTO municipio VALUES ('19','19397','LA VEGA'); 
INSERT INTO municipio VALUES ('19','19418','LÓPEZ'); 
INSERT INTO municipio VALUES ('19','19450','MERCADERES'); 
INSERT INTO municipio VALUES ('19','19455','MIRANDA'); 
INSERT INTO municipio VALUES ('19','19473','MORALES'); 
INSERT INTO municipio VALUES ('19','19513','PADILLA'); 
INSERT INTO municipio VALUES ('19','19517','PAEZ'); 
INSERT INTO municipio VALUES ('19','19532','PATÍA'); 
INSERT INTO municipio VALUES ('19','19533','PIAMONTE'); 
INSERT INTO municipio VALUES ('19','19548','PIENDAMÓ'); 
INSERT INTO municipio VALUES ('19','19573','PUERTO TEJADA'); 
INSERT INTO municipio VALUES ('19','19585','PURACÉ'); 
INSERT INTO municipio VALUES ('19','19622','ROSAS'); 
INSERT INTO municipio VALUES ('19','19693','SAN SEBASTIÁN'); 
INSERT INTO municipio VALUES ('19','19698','SANTANDER DE QUILICHAO'); 
INSERT INTO municipio VALUES ('19','19701','SANTA ROSA'); 
INSERT INTO municipio VALUES ('19','19743','SILVIA'); 
INSERT INTO municipio VALUES ('19','19760','SOTARA'); 
INSERT INTO municipio VALUES ('19','19780','SUÁREZ'); 
INSERT INTO municipio VALUES ('19','19785','SUCRE'); 
INSERT INTO municipio VALUES ('19','19807','TIMBÍO'); 
INSERT INTO municipio VALUES ('19','19809','TIMBIQUÍ'); 
INSERT INTO municipio VALUES ('19','19821','TORIBIO'); 
INSERT INTO municipio VALUES ('19','19824','TOTORÓ'); 
INSERT INTO municipio VALUES ('19','19845','VILLA RICA'); 
INSERT INTO municipio VALUES ('20','20001','VALLEDUPAR'); 
INSERT INTO municipio VALUES ('20','20011','AGUACHICA'); 
INSERT INTO municipio VALUES ('20','20013','AGUSTÍN CODAZZI'); 
INSERT INTO municipio VALUES ('20','20032','ASTREA'); 
INSERT INTO municipio VALUES ('20','20045','BECERRIL'); 
INSERT INTO municipio VALUES ('20','20060','BOSCONIA'); 
INSERT INTO municipio VALUES ('20','20175','CHIMICHAGUA'); 
INSERT INTO municipio VALUES ('20','20178','CHIRIGUANÁ'); 
INSERT INTO municipio VALUES ('20','20228','CURUMANÍ'); 
INSERT INTO municipio VALUES ('20','20238','EL COPEY'); 
INSERT INTO municipio VALUES ('20','20250','EL PASO'); 
INSERT INTO municipio VALUES ('20','20295','GAMARRA'); 
INSERT INTO municipio VALUES ('20','20310','GONZÁLEZ'); 
INSERT INTO municipio VALUES ('20','20383','LA GLORIA'); 
INSERT INTO municipio VALUES ('20','20400','LA JAGUA DE IBIRICO'); 
INSERT INTO municipio VALUES ('20','20443','MANAURE'); 
INSERT INTO municipio VALUES ('20','20517','PAILITAS'); 
INSERT INTO municipio VALUES ('20','20550','PELAYA'); 
INSERT INTO municipio VALUES ('20','20570','PUEBLO BELLO'); 
INSERT INTO municipio VALUES ('20','20614','RÍO DE ORO'); 
INSERT INTO municipio VALUES ('20','20621','LA PAZ'); 
INSERT INTO municipio VALUES ('20','20710','SAN ALBERTO'); 
INSERT INTO municipio VALUES ('20','20750','SAN DIEGO'); 
INSERT INTO municipio VALUES ('20','20770','SAN MARTÍN'); 
INSERT INTO municipio VALUES ('20','20787','TAMALAMEQUE'); 
INSERT INTO municipio VALUES ('23','23001','MONTERÍA'); 
INSERT INTO municipio VALUES ('23','23068','AYAPEL'); 
INSERT INTO municipio VALUES ('23','23079','BUENAVISTA'); 
INSERT INTO municipio VALUES ('23','23090','CANALETE'); 
INSERT INTO municipio VALUES ('23','23162','CERETÉ'); 
INSERT INTO municipio VALUES ('23','23168','CHIMÁ'); 
INSERT INTO municipio VALUES ('23','23182','CHINÚ'); 
INSERT INTO municipio VALUES ('23','23189','CIÉNAGA DE ORO'); 
INSERT INTO municipio VALUES ('23','23300','COTORRA'); 
INSERT INTO municipio VALUES ('23','23350','LA APARTADA'); 
INSERT INTO municipio VALUES ('23','23417','LORICA'); 
INSERT INTO municipio VALUES ('23','23419','LOS CÓRDOBAS '); 
INSERT INTO municipio VALUES ('23','23464','MOMIL'); 
INSERT INTO municipio VALUES ('23','23466','MONTELÍBANO'); 
INSERT INTO municipio VALUES ('23','23500','MOÑITOS'); 
INSERT INTO municipio VALUES ('23','23555','PLANETA RICA'); 
INSERT INTO municipio VALUES ('23','23570','PUEBLO NUEVO'); 
INSERT INTO municipio VALUES ('23','23574','PUERTO ESCONDIDO'); 
INSERT INTO municipio VALUES ('23','23580','PUERTO LIBERTADOR'); 
INSERT INTO municipio VALUES ('23','23586','PURÍSIMA'); 
INSERT INTO municipio VALUES ('23','23660','SAHAGÚN'); 
INSERT INTO municipio VALUES ('23','23670','SAN ANDRÉS SOTAVENTO'); 
INSERT INTO municipio VALUES ('23','23672','SAN ANTERO'); 
INSERT INTO municipio VALUES ('23','23675','SAN BERNARDO DEL VIENTO'); 
INSERT INTO municipio VALUES ('23','23678','SAN CARLOS'); 
INSERT INTO municipio VALUES ('23','23686','SAN PELAYO'); 
INSERT INTO municipio VALUES ('23','23807','TIERRALTA'); 
INSERT INTO municipio VALUES ('23','23855','VALENCIA'); 
INSERT INTO municipio VALUES ('25','25001','AGUA DE DIOS'); 
INSERT INTO municipio VALUES ('25','25019','ALBÁN'); 
INSERT INTO municipio VALUES ('25','25035','ANAPOIMA'); 
INSERT INTO municipio VALUES ('25','25040','ANOLAIMA'); 
INSERT INTO municipio VALUES ('25','25053','ARBELÁEZ'); 
INSERT INTO municipio VALUES ('25','25086','BELTRÁN'); 
INSERT INTO municipio VALUES ('25','25095','BITUIMA'); 
INSERT INTO municipio VALUES ('25','25099','BOJACÁ'); 
INSERT INTO municipio VALUES ('25','25120','CABRERA'); 
INSERT INTO municipio VALUES ('25','25123','CACHIPAY'); 
INSERT INTO municipio VALUES ('25','25126','CAJICÁ'); 
INSERT INTO municipio VALUES ('25','25148','CAPARRAPÍ'); 
INSERT INTO municipio VALUES ('25','25151','CAQUEZA'); 
INSERT INTO municipio VALUES ('25','25154','CARMEN DE CARUPA'); 
INSERT INTO municipio VALUES ('25','25168','CHAGUANÍ'); 
INSERT INTO municipio VALUES ('25','25175','CHÍA'); 
INSERT INTO municipio VALUES ('25','25178','CHIPAQUE'); 
INSERT INTO municipio VALUES ('25','25181','CHOACHÍ'); 
INSERT INTO municipio VALUES ('25','25183','CHOCONTÁ'); 
INSERT INTO municipio VALUES ('25','25200','COGUA'); 
INSERT INTO municipio VALUES ('25','25214','COTA'); 
INSERT INTO municipio VALUES ('25','25224','CUCUNUBÁ'); 
INSERT INTO municipio VALUES ('25','25245','EL COLEGIO'); 
INSERT INTO municipio VALUES ('25','25258','EL PEÑÓN'); 
INSERT INTO municipio VALUES ('25','25260','EL ROSAL'); 
INSERT INTO municipio VALUES ('25','25269','FACATATIVÁ'); 
INSERT INTO municipio VALUES ('25','25279','FOMEQUE'); 
INSERT INTO municipio VALUES ('25','25281','FOSCA'); 
INSERT INTO municipio VALUES ('25','25286','FUNZA'); 
INSERT INTO municipio VALUES ('25','25288','FÚQUENE'); 
INSERT INTO municipio VALUES ('25','25290','FUSAGASUGÁ'); 
INSERT INTO municipio VALUES ('25','25293','GACHALA'); 
INSERT INTO municipio VALUES ('25','25295','GACHANCIPÁ'); 
INSERT INTO municipio VALUES ('25','25297','GACHETÁ'); 
INSERT INTO municipio VALUES ('25','25299','GAMA'); 
INSERT INTO municipio VALUES ('25','25307','GIRARDOT'); 
INSERT INTO municipio VALUES ('25','25312','GRANADA'); 
INSERT INTO municipio VALUES ('25','25317','GUACHETÁ'); 
INSERT INTO municipio VALUES ('25','25320','GUADUAS'); 
INSERT INTO municipio VALUES ('25','25322','GUASCA'); 
INSERT INTO municipio VALUES ('25','25324','GUATAQUÍ'); 
INSERT INTO municipio VALUES ('25','25326','GUATAVITA'); 
INSERT INTO municipio VALUES ('25','25328','GUAYABAL DE SIQUIMA'); 
INSERT INTO municipio VALUES ('25','25335','GUAYABETAL'); 
INSERT INTO municipio VALUES ('25','25339','GUTIÉRREZ'); 
INSERT INTO municipio VALUES ('25','25368','JERUSALÉN'); 
INSERT INTO municipio VALUES ('25','25372','JUNÍN'); 
INSERT INTO municipio VALUES ('25','25377','LA CALERA'); 
INSERT INTO municipio VALUES ('25','25386','LA MESA'); 
INSERT INTO municipio VALUES ('25','25394','LA PALMA'); 
INSERT INTO municipio VALUES ('25','25398','LA PEÑA'); 
INSERT INTO municipio VALUES ('25','25402','LA VEGA'); 
INSERT INTO municipio VALUES ('25','25407','LENGUAZAQUE'); 
INSERT INTO municipio VALUES ('25','25426','MACHETA'); 
INSERT INTO municipio VALUES ('25','25430','MADRID'); 
INSERT INTO municipio VALUES ('25','25436','MANTA'); 
INSERT INTO municipio VALUES ('25','25438','MEDINA'); 
INSERT INTO municipio VALUES ('25','25473','MOSQUERA'); 
INSERT INTO municipio VALUES ('25','25483','NARIÑO'); 
INSERT INTO municipio VALUES ('25','25486','NEMOCÓN'); 
INSERT INTO municipio VALUES ('25','25488','NILO'); 
INSERT INTO municipio VALUES ('25','25489','NIMAIMA'); 
INSERT INTO municipio VALUES ('25','25491','NOCAIMA'); 
INSERT INTO municipio VALUES ('25','25506','VENECIA'); 
INSERT INTO municipio VALUES ('25','25513','PACHO'); 
INSERT INTO municipio VALUES ('25','25518','PAIME'); 
INSERT INTO municipio VALUES ('25','25524','PANDI'); 
INSERT INTO municipio VALUES ('25','25530','PARATEBUENO'); 
INSERT INTO municipio VALUES ('25','25535','PASCA'); 
INSERT INTO municipio VALUES ('25','25572','PUERTO SALGAR'); 
INSERT INTO municipio VALUES ('25','25580','PULÍ'); 
INSERT INTO municipio VALUES ('25','25592','QUEBRADANEGRA'); 
INSERT INTO municipio VALUES ('25','25594','QUETAME'); 
INSERT INTO municipio VALUES ('25','25596','QUIPILE'); 
INSERT INTO municipio VALUES ('25','25599','APULO'); 
INSERT INTO municipio VALUES ('25','25612','RICAURTE'); 
INSERT INTO municipio VALUES ('25','25645','SAN ANTONIO DEL TEQUENDAMA'); 
INSERT INTO municipio VALUES ('25','25649','SAN BERNARDO'); 
INSERT INTO municipio VALUES ('25','25653','SAN CAYETANO'); 
INSERT INTO municipio VALUES ('25','25658','SAN FRANCISCO'); 
INSERT INTO municipio VALUES ('25','25662','SAN JUAN DE RÍO SECO'); 
INSERT INTO municipio VALUES ('25','25718','SASAIMA'); 
INSERT INTO municipio VALUES ('25','25736','SESQUILÉ'); 
INSERT INTO municipio VALUES ('25','25740','SIBATÉ'); 
INSERT INTO municipio VALUES ('25','25743','SILVANIA'); 
INSERT INTO municipio VALUES ('25','25745','SIMIJACA'); 
INSERT INTO municipio VALUES ('25','25754','SOACHA'); 
INSERT INTO municipio VALUES ('25','25758','SOPÓ'); 
INSERT INTO municipio VALUES ('25','25769','SUBACHOQUE'); 
INSERT INTO municipio VALUES ('25','25772','SUESCA'); 
INSERT INTO municipio VALUES ('25','25777','SUPATÁ'); 
INSERT INTO municipio VALUES ('25','25779','SUSA'); 
INSERT INTO municipio VALUES ('25','25781','SUTATAUSA'); 
INSERT INTO municipio VALUES ('25','25785','TABIO'); 
INSERT INTO municipio VALUES ('25','25793','TAUSA'); 
INSERT INTO municipio VALUES ('25','25797','TENA'); 
INSERT INTO municipio VALUES ('25','25799','TENJO'); 
INSERT INTO municipio VALUES ('25','25805','TIBACUY'); 
INSERT INTO municipio VALUES ('25','25807','TIBIRITA'); 
INSERT INTO municipio VALUES ('25','25815','TOCAIMA'); 
INSERT INTO municipio VALUES ('25','25817','TOCANCIPÁ'); 
INSERT INTO municipio VALUES ('25','25823','TOPAIPÍ'); 
INSERT INTO municipio VALUES ('25','25839','UBALÁ'); 
INSERT INTO municipio VALUES ('25','25841','UBAQUE'); 
INSERT INTO municipio VALUES ('25','25843','VILLA DE SAN DIEGO DE'); 
INSERT INTO municipio VALUES ('25','25845','UNE'); 
INSERT INTO municipio VALUES ('25','25851','ÚTICA'); 
INSERT INTO municipio VALUES ('25','25862','VERGARA'); 
INSERT INTO municipio VALUES ('25','25867','VIANÍ'); 
INSERT INTO municipio VALUES ('25','25871','VILLAGÓMEZ'); 
INSERT INTO municipio VALUES ('25','25873','VILLAPINZÓN'); 
INSERT INTO municipio VALUES ('25','25875','VILLETA'); 
INSERT INTO municipio VALUES ('25','25878','VIOTÁ'); 
INSERT INTO municipio VALUES ('25','25885','YACOPÍ'); 
INSERT INTO municipio VALUES ('25','25898','ZIPACÓN'); 
INSERT INTO municipio VALUES ('25','25899','ZIPAQUIRÁ'); 
INSERT INTO municipio VALUES ('27','27001','QUIBDÓ'); 
INSERT INTO municipio VALUES ('27','27006','ACANDÍ'); 
INSERT INTO municipio VALUES ('27','27025','ALTO BAUDO'); 
INSERT INTO municipio VALUES ('27','27050','ATRATO'); 
INSERT INTO municipio VALUES ('27','27073','BAGADÓ'); 
INSERT INTO municipio VALUES ('27','27075','BAHÍA SOLANO'); 
INSERT INTO municipio VALUES ('27','27077','BAJO BAUDÓ'); 
INSERT INTO municipio VALUES ('27','27086','BELÉN DE BAJIRÁ'); 
INSERT INTO municipio VALUES ('27','27099','BOJAYA'); 
INSERT INTO municipio VALUES ('27','27135','EL CANTÓN DEL SAN PABLO'); 
INSERT INTO municipio VALUES ('27','27150','CARMEN DEL DARIEN'); 
INSERT INTO municipio VALUES ('27','27160','CÉRTEGUI'); 
INSERT INTO municipio VALUES ('27','27205','CONDOTO'); 
INSERT INTO municipio VALUES ('27','27245','EL CARMEN DE ATRATO'); 
INSERT INTO municipio VALUES ('27','27250','EL LITORAL DEL SAN JUAN'); 
INSERT INTO municipio VALUES ('27','27361','ISTMINA'); 
INSERT INTO municipio VALUES ('27','27372','JURADÓ'); 
INSERT INTO municipio VALUES ('27','27413','LLORÓ'); 
INSERT INTO municipio VALUES ('27','27425','MEDIO ATRATO'); 
INSERT INTO municipio VALUES ('27','27430','MEDIO BAUDÓ'); 
INSERT INTO municipio VALUES ('27','27450','MEDIO SAN JUAN'); 
INSERT INTO municipio VALUES ('27','27491','NÓVITA'); 
INSERT INTO municipio VALUES ('27','27495','NUQUÍ'); 
INSERT INTO municipio VALUES ('27','27580','RÍO IRO'); 
INSERT INTO municipio VALUES ('27','27600','RÍO QUITO'); 
INSERT INTO municipio VALUES ('27','27615','RIOSUCIO'); 
INSERT INTO municipio VALUES ('27','27660','SAN JOSÉ DEL PALMAR'); 
INSERT INTO municipio VALUES ('27','27745','SIPÍ'); 
INSERT INTO municipio VALUES ('27','27787','TADÓ'); 
INSERT INTO municipio VALUES ('27','27800','UNGUÍA'); 
INSERT INTO municipio VALUES ('27','27810','UNIÓN PANAMERICANA'); 
INSERT INTO municipio VALUES ('41','41001','NEIVA'); 
INSERT INTO municipio VALUES ('41','41006','ACEVEDO'); 
INSERT INTO municipio VALUES ('41','41013','AGRADO'); 
INSERT INTO municipio VALUES ('41','41016','AIPE'); 
INSERT INTO municipio VALUES ('41','41020','ALGECIRAS'); 
INSERT INTO municipio VALUES ('41','41026','ALTAMIRA'); 
INSERT INTO municipio VALUES ('41','41078','BARAYA'); 
INSERT INTO municipio VALUES ('41','41132','CAMPOALEGRE'); 
INSERT INTO municipio VALUES ('41','41206','COLOMBIA'); 
INSERT INTO municipio VALUES ('41','41244','ELÍAS'); 
INSERT INTO municipio VALUES ('41','41298','GARZÓN'); 
INSERT INTO municipio VALUES ('41','41306','GIGANTE'); 
INSERT INTO municipio VALUES ('41','41319','GUADALUPE'); 
INSERT INTO municipio VALUES ('41','41349','HOBO'); 
INSERT INTO municipio VALUES ('41','41357','IQUIRA'); 
INSERT INTO municipio VALUES ('41','41359','ISNOS'); 
INSERT INTO municipio VALUES ('41','41378','LA ARGENTINA'); 
INSERT INTO municipio VALUES ('41','41396','LA PLATA'); 
INSERT INTO municipio VALUES ('41','41483','NÁTAGA'); 
INSERT INTO municipio VALUES ('41','41503','OPORAPA'); 
INSERT INTO municipio VALUES ('41','41518','PAICOL'); 
INSERT INTO municipio VALUES ('41','41524','PALERMO'); 
INSERT INTO municipio VALUES ('41','41530','PALESTINA'); 
INSERT INTO municipio VALUES ('41','41548','PITAL'); 
INSERT INTO municipio VALUES ('41','41551','PITALITO'); 
INSERT INTO municipio VALUES ('41','41615','RIVERA'); 
INSERT INTO municipio VALUES ('41','41660','SALADOBLANCO'); 
INSERT INTO municipio VALUES ('41','41668','SAN AGUSTÍN'); 
INSERT INTO municipio VALUES ('41','41676','SANTA MARÍA'); 
INSERT INTO municipio VALUES ('41','41770','SUAZA'); 
INSERT INTO municipio VALUES ('41','41791','TARQUI'); 
INSERT INTO municipio VALUES ('41','41797','TESALIA'); 
INSERT INTO municipio VALUES ('41','41799','TELLO'); 
INSERT INTO municipio VALUES ('41','41801','TERUEL'); 
INSERT INTO municipio VALUES ('41','41807','TIMANÁ'); 
INSERT INTO municipio VALUES ('41','41872','VILLAVIEJA'); 
INSERT INTO municipio VALUES ('41','41885','YAGUARÁ'); 
INSERT INTO municipio VALUES ('44','44001','RIOHACHA'); 
INSERT INTO municipio VALUES ('44','44035','ALBANIA'); 
INSERT INTO municipio VALUES ('44','44078','BARRANCAS'); 
INSERT INTO municipio VALUES ('44','44090','DIBULLA'); 
INSERT INTO municipio VALUES ('44','44098','DISTRACCIÓN'); 
INSERT INTO municipio VALUES ('44','44110','EL MOLINO'); 
INSERT INTO municipio VALUES ('44','44279','FONSECA'); 
INSERT INTO municipio VALUES ('44','44378','HATONUEVO'); 
INSERT INTO municipio VALUES ('44','44420','LA JAGUA DEL PILAR'); 
INSERT INTO municipio VALUES ('44','44430','MAICAO'); 
INSERT INTO municipio VALUES ('44','44560','MANAURE'); 
INSERT INTO municipio VALUES ('44','44650','SAN JUAN DEL CESAR'); 
INSERT INTO municipio VALUES ('44','44847','URIBIA'); 
INSERT INTO municipio VALUES ('44','44855','URUMITA'); 
INSERT INTO municipio VALUES ('44','44874','VILLANUEVA'); 
INSERT INTO municipio VALUES ('47','47001','SANTA MARTA'); 
INSERT INTO municipio VALUES ('47','47030','ALGARROBO'); 
INSERT INTO municipio VALUES ('47','47053','ARACATACA'); 
INSERT INTO municipio VALUES ('47','47058','ARIGUANÍ'); 
INSERT INTO municipio VALUES ('47','47161','CERRO SAN ANTONIO'); 
INSERT INTO municipio VALUES ('47','47170','CHIBOLO'); 
INSERT INTO municipio VALUES ('47','47189','CIÉNAGA'); 
INSERT INTO municipio VALUES ('47','47205','CONCORDIA'); 
INSERT INTO municipio VALUES ('47','47245','EL BANCO'); 
INSERT INTO municipio VALUES ('47','47258','EL PIÑON'); 
INSERT INTO municipio VALUES ('47','47268','EL RETÉN'); 
INSERT INTO municipio VALUES ('47','47288','FUNDACIÓN'); 
INSERT INTO municipio VALUES ('47','47318','GUAMAL'); 
INSERT INTO municipio VALUES ('47','47460','NUEVA GRANADA'); 
INSERT INTO municipio VALUES ('47','47541','PEDRAZA'); 
INSERT INTO municipio VALUES ('47','47545','PIJIÑO DEL CARMEN'); 
INSERT INTO municipio VALUES ('47','47551','PIVIJAY'); 
INSERT INTO municipio VALUES ('47','47555','PLATO'); 
INSERT INTO municipio VALUES ('47','47570','PUEBLOVIEJO'); 
INSERT INTO municipio VALUES ('47','47605','REMOLINO'); 
INSERT INTO municipio VALUES ('47','47660','SABANAS DE SAN ANGEL'); 
INSERT INTO municipio VALUES ('47','47675','SALAMINA'); 
INSERT INTO municipio VALUES ('47','47692','SAN SEBASTIÁN DE BUENAVISTA'); 
INSERT INTO municipio VALUES ('47','47703','SAN ZENÓN'); 
INSERT INTO municipio VALUES ('47','47707','SANTA ANA'); 
INSERT INTO municipio VALUES ('47','47720','SANTA BÁRBARA DE PINTO'); 
INSERT INTO municipio VALUES ('47','47745','SITIONUEVO'); 
INSERT INTO municipio VALUES ('47','47798','TENERIFE'); 
INSERT INTO municipio VALUES ('47','47960','ZAPAYÁN'); 
INSERT INTO municipio VALUES ('47','47980','ZONA BANANERA'); 
INSERT INTO municipio VALUES ('50','50001','VILLAVICENCIO'); 
INSERT INTO municipio VALUES ('50','50006','ACACÍAS'); 
INSERT INTO municipio VALUES ('50','50110','BARRANCA DE UPÍA'); 
INSERT INTO municipio VALUES ('50','50124','CABUYARO'); 
INSERT INTO municipio VALUES ('50','50150','CASTILLA LA NUEVA'); 
INSERT INTO municipio VALUES ('50','50223','CUBARRAL'); 
INSERT INTO municipio VALUES ('50','50226','CUMARAL'); 
INSERT INTO municipio VALUES ('50','50245','EL CALVARIO'); 
INSERT INTO municipio VALUES ('50','50251','EL CASTILLO'); 
INSERT INTO municipio VALUES ('50','50270','EL DORADO'); 
INSERT INTO municipio VALUES ('50','50287','FUENTE DE ORO'); 
INSERT INTO municipio VALUES ('50','50313','GRANADA'); 
INSERT INTO municipio VALUES ('50','50318','GUAMAL'); 
INSERT INTO municipio VALUES ('50','50325','MAPIRIPÁN'); 
INSERT INTO municipio VALUES ('50','50330','MESETAS'); 
INSERT INTO municipio VALUES ('50','50350','LA MACARENA'); 
INSERT INTO municipio VALUES ('50','50370','URIBE'); 
INSERT INTO municipio VALUES ('50','50400','LEJANÍAS'); 
INSERT INTO municipio VALUES ('50','50450','PUERTO CONCORDIA'); 
INSERT INTO municipio VALUES ('50','50568','PUERTO GAITÁN'); 
INSERT INTO municipio VALUES ('50','50573','PUERTO LÓPEZ'); 
INSERT INTO municipio VALUES ('50','50577','PUERTO LLERAS'); 
INSERT INTO municipio VALUES ('50','50590','PUERTO RICO'); 
INSERT INTO municipio VALUES ('50','50606','RESTREPO'); 
INSERT INTO municipio VALUES ('50','50680','SAN CARLOS DE GUAROA'); 
INSERT INTO municipio VALUES ('50','50683','SAN JUAN DE ARAMA'); 
INSERT INTO municipio VALUES ('50','50686','SAN JUANITO'); 
INSERT INTO municipio VALUES ('50','50689','SAN MARTÍN'); 
INSERT INTO municipio VALUES ('50','50711','VISTAHERMOSA'); 
INSERT INTO municipio VALUES ('52','52001','PASTO'); 
INSERT INTO municipio VALUES ('52','52019','ALBÁN'); 
INSERT INTO municipio VALUES ('52','52022','ALDANA'); 
INSERT INTO municipio VALUES ('52','52036','ANCUYÁ'); 
INSERT INTO municipio VALUES ('52','52051','ARBOLEDA'); 
INSERT INTO municipio VALUES ('52','52079','BARBACOAS'); 
INSERT INTO municipio VALUES ('52','52083','BELÉN'); 
INSERT INTO municipio VALUES ('52','52110','BUESACO'); 
INSERT INTO municipio VALUES ('52','52203','COLÓN'); 
INSERT INTO municipio VALUES ('52','52207','CONSACA'); 
INSERT INTO municipio VALUES ('52','52210','CONTADERO'); 
INSERT INTO municipio VALUES ('52','52215','CÓRDOBA'); 
INSERT INTO municipio VALUES ('52','52224','CUASPUD'); 
INSERT INTO municipio VALUES ('52','52227','CUMBAL'); 
INSERT INTO municipio VALUES ('52','52233','CUMBITARA'); 
INSERT INTO municipio VALUES ('52','52240','CHACHAGÜÍ'); 
INSERT INTO municipio VALUES ('52','52250','EL CHARCO'); 
INSERT INTO municipio VALUES ('52','52254','EL PEÑOL'); 
INSERT INTO municipio VALUES ('52','52256','EL ROSARIO'); 
INSERT INTO municipio VALUES ('52','52258','EL TABLÓN DE GÓMEZ'); 
INSERT INTO municipio VALUES ('52','52260','EL TAMBO'); 
INSERT INTO municipio VALUES ('52','52287','FUNES'); 
INSERT INTO municipio VALUES ('52','52317','GUACHUCAL'); 
INSERT INTO municipio VALUES ('52','52320','GUAITARILLA'); 
INSERT INTO municipio VALUES ('52','52323','GUALMATÁN'); 
INSERT INTO municipio VALUES ('52','52352','ILES'); 
INSERT INTO municipio VALUES ('52','52354','IMUÉS'); 
INSERT INTO municipio VALUES ('52','52356','IPIALES'); 
INSERT INTO municipio VALUES ('52','52378','LA CRUZ'); 
INSERT INTO municipio VALUES ('52','52381','LA FLORIDA'); 
INSERT INTO municipio VALUES ('52','52385','LA LLANADA'); 
INSERT INTO municipio VALUES ('52','52390','LA TOLA'); 
INSERT INTO municipio VALUES ('52','52399','LA UNIÓN'); 
INSERT INTO municipio VALUES ('52','52405','LEIVA'); 
INSERT INTO municipio VALUES ('52','52411','LINARES'); 
INSERT INTO municipio VALUES ('52','52418','LOS ANDES'); 
INSERT INTO municipio VALUES ('52','52427','MAGÜI'); 
INSERT INTO municipio VALUES ('52','52435','MALLAMA'); 
INSERT INTO municipio VALUES ('52','52473','MOSQUERA'); 
INSERT INTO municipio VALUES ('52','52480','NARIÑO'); 
INSERT INTO municipio VALUES ('52','52490','OLAYA HERRERA'); 
INSERT INTO municipio VALUES ('52','52506','OSPINA'); 
INSERT INTO municipio VALUES ('52','52520','FRANCISCO PIZARRO'); 
INSERT INTO municipio VALUES ('52','52540','POLICARPA'); 
INSERT INTO municipio VALUES ('52','52560','POTOSÍ'); 
INSERT INTO municipio VALUES ('52','52565','PROVIDENCIA'); 
INSERT INTO municipio VALUES ('52','52573','PUERRES'); 
INSERT INTO municipio VALUES ('52','52585','PUPIALES'); 
INSERT INTO municipio VALUES ('52','52612','RICAURTE'); 
INSERT INTO municipio VALUES ('52','52621','ROBERTO PAYÁN'); 
INSERT INTO municipio VALUES ('52','52678','SAMANIEGO'); 
INSERT INTO municipio VALUES ('52','52683','SANDONÁ'); 
INSERT INTO municipio VALUES ('52','52685','SAN BERNARDO'); 
INSERT INTO municipio VALUES ('52','52687','SAN LORENZO'); 
INSERT INTO municipio VALUES ('52','52693','SAN PABLO'); 
INSERT INTO municipio VALUES ('52','52694','SAN PEDRO DE CARTAGO'); 
INSERT INTO municipio VALUES ('52','52696','SANTA BÁRBARA'); 
INSERT INTO municipio VALUES ('52','52699','SANTACRUZ'); 
INSERT INTO municipio VALUES ('52','52720','SAPUYES'); 
INSERT INTO municipio VALUES ('52','52786','TAMINANGO'); 
INSERT INTO municipio VALUES ('52','52788','TANGUA'); 
INSERT INTO municipio VALUES ('52','52835','SAN ANDRES DE TUMACO'); 
INSERT INTO municipio VALUES ('52','52838','TÚQUERRES'); 
INSERT INTO municipio VALUES ('52','52885','YACUANQUER'); 
INSERT INTO municipio VALUES ('54','54001','CÚCUTA'); 
INSERT INTO municipio VALUES ('54','54003','ABREGO'); 
INSERT INTO municipio VALUES ('54','54051','ARBOLEDAS'); 
INSERT INTO municipio VALUES ('54','54099','BOCHALEMA'); 
INSERT INTO municipio VALUES ('54','54109','BUCARASICA'); 
INSERT INTO municipio VALUES ('54','54125','CÁCOTA'); 
INSERT INTO municipio VALUES ('54','54128','CACHIRÁ'); 
INSERT INTO municipio VALUES ('54','54172','CHINÁCOTA'); 
INSERT INTO municipio VALUES ('54','54174','CHITAGÁ'); 
INSERT INTO municipio VALUES ('54','54206','CONVENCIÓN'); 
INSERT INTO municipio VALUES ('54','54223','CUCUTILLA'); 
INSERT INTO municipio VALUES ('54','54239','DURANIA'); 
INSERT INTO municipio VALUES ('54','54245','EL CARMEN'); 
INSERT INTO municipio VALUES ('54','54250','EL TARRA'); 
INSERT INTO municipio VALUES ('54','54261','EL ZULIA'); 
INSERT INTO municipio VALUES ('54','54313','GRAMALOTE'); 
INSERT INTO municipio VALUES ('54','54344','HACARÍ'); 
INSERT INTO municipio VALUES ('54','54347','HERRÁN'); 
INSERT INTO municipio VALUES ('54','54377','LABATECA'); 
INSERT INTO municipio VALUES ('54','54385','LA ESPERANZA'); 
INSERT INTO municipio VALUES ('54','54398','LA PLAYA'); 
INSERT INTO municipio VALUES ('54','54405','LOS PATIOS'); 
INSERT INTO municipio VALUES ('54','54418','LOURDES'); 
INSERT INTO municipio VALUES ('54','54480','MUTISCUA'); 
INSERT INTO municipio VALUES ('54','54498','OCAÑA'); 
INSERT INTO municipio VALUES ('54','54518','PAMPLONA'); 
INSERT INTO municipio VALUES ('54','54520','PAMPLONITA'); 
INSERT INTO municipio VALUES ('54','54553','PUERTO SANTANDER'); 
INSERT INTO municipio VALUES ('54','54599','RAGONVALIA'); 
INSERT INTO municipio VALUES ('54','54660','SALAZAR'); 
INSERT INTO municipio VALUES ('54','54670','SAN CALIXTO'); 
INSERT INTO municipio VALUES ('54','54673','SAN CAYETANO'); 
INSERT INTO municipio VALUES ('54','54680','SANTIAGO'); 
INSERT INTO municipio VALUES ('54','54720','SARDINATA'); 
INSERT INTO municipio VALUES ('54','54743','SILOS'); 
INSERT INTO municipio VALUES ('54','54800','TEORAMA'); 
INSERT INTO municipio VALUES ('54','54810','TIBÚ'); 
INSERT INTO municipio VALUES ('54','54820','TOLEDO'); 
INSERT INTO municipio VALUES ('54','54871','VILLA CARO'); 
INSERT INTO municipio VALUES ('54','54874','VILLA DEL ROSARIO'); 
INSERT INTO municipio VALUES ('63','63001','ARMENIA'); 
INSERT INTO municipio VALUES ('63','63111','BUENAVISTA'); 
INSERT INTO municipio VALUES ('63','63130','CALARCA'); 
INSERT INTO municipio VALUES ('63','63190','CIRCASIA'); 
INSERT INTO municipio VALUES ('63','63212','CÓRDOBA'); 
INSERT INTO municipio VALUES ('63','63272','FILANDIA'); 
INSERT INTO municipio VALUES ('63','63302','GÉNOVA'); 
INSERT INTO municipio VALUES ('63','63401','LA TEBAIDA'); 
INSERT INTO municipio VALUES ('63','63470','MONTENEGRO'); 
INSERT INTO municipio VALUES ('63','63548','PIJAO'); 
INSERT INTO municipio VALUES ('63','63594','QUIMBAYA'); 
INSERT INTO municipio VALUES ('63','63690','SALENTO'); 
INSERT INTO municipio VALUES ('66','66001','PEREIRA'); 
INSERT INTO municipio VALUES ('66','66045','APÍA'); 
INSERT INTO municipio VALUES ('66','66075','BALBOA'); 
INSERT INTO municipio VALUES ('66','66088','BELÉN DE UMBRÍA'); 
INSERT INTO municipio VALUES ('66','66170','DOSQUEBRADAS'); 
INSERT INTO municipio VALUES ('66','66318','GUÁTICA'); 
INSERT INTO municipio VALUES ('66','66383','LA CELIA'); 
INSERT INTO municipio VALUES ('66','66400','LA VIRGINIA'); 
INSERT INTO municipio VALUES ('66','66440','MARSELLA'); 
INSERT INTO municipio VALUES ('66','66456','MISTRATÓ'); 
INSERT INTO municipio VALUES ('66','66572','PUEBLO RICO'); 
INSERT INTO municipio VALUES ('66','66594','QUINCHÍA'); 
INSERT INTO municipio VALUES ('66','66682','SANTA ROSA DE CABAL'); 
INSERT INTO municipio VALUES ('66','66687','SANTUARIO'); 
INSERT INTO municipio VALUES ('68','68001','BUCARAMANGA'); 
INSERT INTO municipio VALUES ('68','68013','AGUADA'); 
INSERT INTO municipio VALUES ('68','68020','ALBANIA'); 
INSERT INTO municipio VALUES ('68','68051','ARATOCA'); 
INSERT INTO municipio VALUES ('68','68077','BARBOSA'); 
INSERT INTO municipio VALUES ('68','68079','BARICHARA'); 
INSERT INTO municipio VALUES ('68','68081','BARRANCABERMEJA'); 
INSERT INTO municipio VALUES ('68','68092','BETULIA'); 
INSERT INTO municipio VALUES ('68','68101','BOLÍVAR'); 
INSERT INTO municipio VALUES ('68','68121','CABRERA'); 
INSERT INTO municipio VALUES ('68','68132','CALIFORNIA'); 
INSERT INTO municipio VALUES ('68','68147','CAPITANEJO'); 
INSERT INTO municipio VALUES ('68','68152','CARCASÍ'); 
INSERT INTO municipio VALUES ('68','68160','CEPITÁ'); 
INSERT INTO municipio VALUES ('68','68162','CERRITO'); 
INSERT INTO municipio VALUES ('68','68167','CHARALÁ'); 
INSERT INTO municipio VALUES ('68','68169','CHARTA'); 
INSERT INTO municipio VALUES ('68','68176','CHIMA'); 
INSERT INTO municipio VALUES ('68','68179','CHIPATÁ'); 
INSERT INTO municipio VALUES ('68','68190','CIMITARRA'); 
INSERT INTO municipio VALUES ('68','68207','CONCEPCIÓN'); 
INSERT INTO municipio VALUES ('68','68209','CONFINES'); 
INSERT INTO municipio VALUES ('68','68211','CONTRATACIÓN'); 
INSERT INTO municipio VALUES ('68','68217','COROMORO'); 
INSERT INTO municipio VALUES ('68','68229','CURITÍ'); 
INSERT INTO municipio VALUES ('68','68235','EL CARMEN DE CHUCURÍ'); 
INSERT INTO municipio VALUES ('68','68245','EL GUACAMAYO'); 
INSERT INTO municipio VALUES ('68','68250','EL PEÑÓN'); 
INSERT INTO municipio VALUES ('68','68255','EL PLAYÓN'); 
INSERT INTO municipio VALUES ('68','68264','ENCINO'); 
INSERT INTO municipio VALUES ('68','68266','ENCISO'); 
INSERT INTO municipio VALUES ('68','68271','FLORIÁN'); 
INSERT INTO municipio VALUES ('68','68276','FLORIDABLANCA'); 
INSERT INTO municipio VALUES ('68','68296','GALÁN'); 
INSERT INTO municipio VALUES ('68','68298','GAMBITA'); 
INSERT INTO municipio VALUES ('68','68307','GIRÓN'); 
INSERT INTO municipio VALUES ('68','68318','GUACA'); 
INSERT INTO municipio VALUES ('68','68320','GUADALUPE'); 
INSERT INTO municipio VALUES ('68','68322','GUAPOTÁ'); 
INSERT INTO municipio VALUES ('68','68324','GUAVATÁ'); 
INSERT INTO municipio VALUES ('68','68327','GÜEPSA'); 
INSERT INTO municipio VALUES ('68','68344','HATO'); 
INSERT INTO municipio VALUES ('68','68368','JESÚS MARÍA'); 
INSERT INTO municipio VALUES ('68','68370','JORDÁN'); 
INSERT INTO municipio VALUES ('68','68377','LA BELLEZA'); 
INSERT INTO municipio VALUES ('68','68385','LANDÁZURI'); 
INSERT INTO municipio VALUES ('68','68397','LA PAZ'); 
INSERT INTO municipio VALUES ('68','68406','LEBRÍJA'); 
INSERT INTO municipio VALUES ('68','68418','LOS SANTOS'); 
INSERT INTO municipio VALUES ('68','68425','MACARAVITA'); 
INSERT INTO municipio VALUES ('68','68432','MÁLAGA'); 
INSERT INTO municipio VALUES ('68','68444','MATANZA'); 
INSERT INTO municipio VALUES ('68','68464','MOGOTES'); 
INSERT INTO municipio VALUES ('68','68468','MOLAGAVITA'); 
INSERT INTO municipio VALUES ('68','68498','OCAMONTE'); 
INSERT INTO municipio VALUES ('68','68500','OIBA'); 
INSERT INTO municipio VALUES ('68','68502','ONZAGA'); 
INSERT INTO municipio VALUES ('68','68522','PALMAR'); 
INSERT INTO municipio VALUES ('68','68524','PALMAS DEL SOCORRO'); 
INSERT INTO municipio VALUES ('68','68533','PÁRAMO'); 
INSERT INTO municipio VALUES ('68','68547','PIEDECUESTA'); 
INSERT INTO municipio VALUES ('68','68549','PINCHOTE'); 
INSERT INTO municipio VALUES ('68','68572','PUENTE NACIONAL'); 
INSERT INTO municipio VALUES ('68','68573','PUERTO PARRA'); 
INSERT INTO municipio VALUES ('68','68575','PUERTO WILCHES'); 
INSERT INTO municipio VALUES ('68','68615','RIONEGRO'); 
INSERT INTO municipio VALUES ('68','68655','SABANA DE TORRES'); 
INSERT INTO municipio VALUES ('68','68669','SAN ANDRÉS'); 
INSERT INTO municipio VALUES ('68','68673','SAN BENITO'); 
INSERT INTO municipio VALUES ('68','68679','SAN GIL'); 
INSERT INTO municipio VALUES ('68','68682','SAN JOAQUÍN'); 
INSERT INTO municipio VALUES ('68','68684','SAN JOSÉ DE MIRANDA'); 
INSERT INTO municipio VALUES ('68','68686','SAN MIGUEL'); 
INSERT INTO municipio VALUES ('68','68689','SAN VICENTE DE CHUCURÍ'); 
INSERT INTO municipio VALUES ('68','68705','SANTA BÁRBARA'); 
INSERT INTO municipio VALUES ('68','68720','SANTA HELENA DEL OPÓN'); 
INSERT INTO municipio VALUES ('68','68745','SIMACOTA'); 
INSERT INTO municipio VALUES ('68','68755','SOCORRO'); 
INSERT INTO municipio VALUES ('68','68770','SUAITA'); 
INSERT INTO municipio VALUES ('68','68773','SUCRE'); 
INSERT INTO municipio VALUES ('68','68780','SURATÁ'); 
INSERT INTO municipio VALUES ('68','68820','TONA'); 
INSERT INTO municipio VALUES ('68','68855','VALLE DE SAN JOSÉ'); 
INSERT INTO municipio VALUES ('68','68861','VÉLEZ'); 
INSERT INTO municipio VALUES ('68','68867','VETAS'); 
INSERT INTO municipio VALUES ('68','68872','VILLANUEVA'); 
INSERT INTO municipio VALUES ('68','68895','ZAPATOCA'); 
INSERT INTO municipio VALUES ('70','70001','SINCELEJO'); 
INSERT INTO municipio VALUES ('70','70110','BUENAVISTA'); 
INSERT INTO municipio VALUES ('70','70124','CAIMITO'); 
INSERT INTO municipio VALUES ('70','70204','COLOSO'); 
INSERT INTO municipio VALUES ('70','70215','COROZAL'); 
INSERT INTO municipio VALUES ('70','70221','COVEÑAS'); 
INSERT INTO municipio VALUES ('70','70230','CHALÁN'); 
INSERT INTO municipio VALUES ('70','70233','EL ROBLE'); 
INSERT INTO municipio VALUES ('70','70235','GALERAS'); 
INSERT INTO municipio VALUES ('70','70265','GUARANDA'); 
INSERT INTO municipio VALUES ('70','70400','LA UNIÓN'); 
INSERT INTO municipio VALUES ('70','70418','LOS PALMITOS'); 
INSERT INTO municipio VALUES ('70','70429','MAJAGUAL'); 
INSERT INTO municipio VALUES ('70','70473','MORROA'); 
INSERT INTO municipio VALUES ('70','70508','OVEJAS'); 
INSERT INTO municipio VALUES ('70','70523','PALMITO'); 
INSERT INTO municipio VALUES ('70','70670','SAMPUÉS'); 
INSERT INTO municipio VALUES ('70','70678','SAN BENITO ABAD'); 
INSERT INTO municipio VALUES ('70','70702','SAN JUAN DE BETULIA'); 
INSERT INTO municipio VALUES ('70','70708','SAN MARCOS'); 
INSERT INTO municipio VALUES ('70','70713','SAN ONOFRE'); 
INSERT INTO municipio VALUES ('70','70717','SAN PEDRO'); 
INSERT INTO municipio VALUES ('70','70742','SAN LUIS DE SINCÉ'); 
INSERT INTO municipio VALUES ('70','70771','SUCRE'); 
INSERT INTO municipio VALUES ('70','70820','SANTIAGO DE TOLÚ'); 
INSERT INTO municipio VALUES ('70','70823','TOLÚ VIEJO'); 
INSERT INTO municipio VALUES ('73','73001','IBAGUÉ'); 
INSERT INTO municipio VALUES ('73','73024','ALPUJARRA'); 
INSERT INTO municipio VALUES ('73','73026','ALVARADO'); 
INSERT INTO municipio VALUES ('73','73030','AMBALEMA'); 
INSERT INTO municipio VALUES ('73','73043','ANZOÁTEGUI'); 
INSERT INTO municipio VALUES ('73','73055','ARMERO'); 
INSERT INTO municipio VALUES ('73','73067','ATACO'); 
INSERT INTO municipio VALUES ('73','73124','CAJAMARCA'); 
INSERT INTO municipio VALUES ('73','73148','CARMEN DE APICALÁ'); 
INSERT INTO municipio VALUES ('73','73152','CASABIANCA'); 
INSERT INTO municipio VALUES ('73','73168','CHAPARRAL'); 
INSERT INTO municipio VALUES ('73','73200','COELLO'); 
INSERT INTO municipio VALUES ('73','73217','COYAIMA'); 
INSERT INTO municipio VALUES ('73','73226','CUNDAY'); 
INSERT INTO municipio VALUES ('73','73236','DOLORES'); 
INSERT INTO municipio VALUES ('73','73268','ESPINAL'); 
INSERT INTO municipio VALUES ('73','73270','FALAN'); 
INSERT INTO municipio VALUES ('73','73275','FLANDES'); 
INSERT INTO municipio VALUES ('73','73283','FRESNO'); 
INSERT INTO municipio VALUES ('73','73319','GUAMO'); 
INSERT INTO municipio VALUES ('73','73347','HERVEO'); 
INSERT INTO municipio VALUES ('73','73349','HONDA'); 
INSERT INTO municipio VALUES ('73','73352','ICONONZO'); 
INSERT INTO municipio VALUES ('73','73408','LÉRIDA'); 
INSERT INTO municipio VALUES ('73','73411','LÍBANO'); 
INSERT INTO municipio VALUES ('73','73443','MARIQUITA'); 
INSERT INTO municipio VALUES ('73','73449','MELGAR'); 
INSERT INTO municipio VALUES ('73','73461','MURILLO'); 
INSERT INTO municipio VALUES ('73','73483','NATAGAIMA'); 
INSERT INTO municipio VALUES ('73','73504','ORTEGA'); 
INSERT INTO municipio VALUES ('73','73520','PALOCABILDO'); 
INSERT INTO municipio VALUES ('73','73547','PIEDRAS'); 
INSERT INTO municipio VALUES ('73','73555','PLANADAS'); 
INSERT INTO municipio VALUES ('73','73563','PRADO'); 
INSERT INTO municipio VALUES ('73','73585','PURIFICACIÓN'); 
INSERT INTO municipio VALUES ('73','73616','RIOBLANCO'); 
INSERT INTO municipio VALUES ('73','73622','RONCESVALLES'); 
INSERT INTO municipio VALUES ('73','73624','ROVIRA'); 
INSERT INTO municipio VALUES ('73','73671','SALDAÑA'); 
INSERT INTO municipio VALUES ('73','73675','SAN ANTONIO'); 
INSERT INTO municipio VALUES ('73','73678','SAN LUIS'); 
INSERT INTO municipio VALUES ('73','73686','SANTA ISABEL'); 
INSERT INTO municipio VALUES ('73','73770','SUÁREZ'); 
INSERT INTO municipio VALUES ('73','73854','VALLE DE SAN JUAN'); 
INSERT INTO municipio VALUES ('73','73861','VENADILLO'); 
INSERT INTO municipio VALUES ('73','73870','VILLAHERMOSA'); 
INSERT INTO municipio VALUES ('73','73873','VILLARRICA'); 
INSERT INTO municipio VALUES ('76','76001','CALI'); 
INSERT INTO municipio VALUES ('76','76020','ALCALÁ'); 
INSERT INTO municipio VALUES ('76','76036','ANDALUCÍA'); 
INSERT INTO municipio VALUES ('76','76041','ANSERMANUEVO'); 
INSERT INTO municipio VALUES ('76','76054','ARGELIA'); 
INSERT INTO municipio VALUES ('76','76100','BOLÍVAR'); 
INSERT INTO municipio VALUES ('76','76109','BUENAVENTURA'); 
INSERT INTO municipio VALUES ('76','76111','GUADALAJARA DE BUGA'); 
INSERT INTO municipio VALUES ('76','76113','BUGALAGRANDE'); 
INSERT INTO municipio VALUES ('76','76122','CAICEDONIA'); 
INSERT INTO municipio VALUES ('76','76126','CALIMA'); 
INSERT INTO municipio VALUES ('76','76130','CANDELARIA'); 
INSERT INTO municipio VALUES ('76','76147','CARTAGO'); 
INSERT INTO municipio VALUES ('76','76233','DAGUA'); 
INSERT INTO municipio VALUES ('76','76243','EL ÁGUILA'); 
INSERT INTO municipio VALUES ('76','76246','EL CAIRO'); 
INSERT INTO municipio VALUES ('76','76248','EL CERRITO'); 
INSERT INTO municipio VALUES ('76','76250','EL DOVIO'); 
INSERT INTO municipio VALUES ('76','76275','FLORIDA'); 
INSERT INTO municipio VALUES ('76','76306','GINEBRA'); 
INSERT INTO municipio VALUES ('76','76318','GUACARÍ'); 
INSERT INTO municipio VALUES ('76','76364','JAMUNDÍ'); 
INSERT INTO municipio VALUES ('76','76377','LA CUMBRE'); 
INSERT INTO municipio VALUES ('76','76400','LA UNIÓN'); 
INSERT INTO municipio VALUES ('76','76403','LA VICTORIA'); 
INSERT INTO municipio VALUES ('76','76497','OBANDO'); 
INSERT INTO municipio VALUES ('76','76520','PALMIRA'); 
INSERT INTO municipio VALUES ('76','76563','PRADERA'); 
INSERT INTO municipio VALUES ('76','76606','RESTREPO'); 
INSERT INTO municipio VALUES ('76','76616','RIOFRÍO'); 
INSERT INTO municipio VALUES ('76','76622','ROLDANILLO'); 
INSERT INTO municipio VALUES ('76','76670','SAN PEDRO'); 
INSERT INTO municipio VALUES ('76','76736','SEVILLA'); 
INSERT INTO municipio VALUES ('76','76823','TORO'); 
INSERT INTO municipio VALUES ('76','76828','TRUJILLO'); 
INSERT INTO municipio VALUES ('76','76834','TULUÁ'); 
INSERT INTO municipio VALUES ('76','76845','ULLOA'); 
INSERT INTO municipio VALUES ('76','76863','VERSALLES'); 
INSERT INTO municipio VALUES ('76','76869','VIJES'); 
INSERT INTO municipio VALUES ('76','76890','YOTOCO'); 
INSERT INTO municipio VALUES ('76','76892','YUMBO'); 
INSERT INTO municipio VALUES ('76','76895','ZARZAL'); 
INSERT INTO municipio VALUES ('81','81001','ARAUCA'); 
INSERT INTO municipio VALUES ('81','81065','ARAUQUITA'); 
INSERT INTO municipio VALUES ('81','81220','CRAVO NORTE'); 
INSERT INTO municipio VALUES ('81','81300','FORTUL'); 
INSERT INTO municipio VALUES ('81','81591','PUERTO RONDÓN'); 
INSERT INTO municipio VALUES ('81','81736','SARAVENA'); 
INSERT INTO municipio VALUES ('81','81794','TAME'); 
INSERT INTO municipio VALUES ('85','85001','YOPAL'); 
INSERT INTO municipio VALUES ('85','85010','AGUAZUL'); 
INSERT INTO municipio VALUES ('85','85015','CHAMEZA'); 
INSERT INTO municipio VALUES ('85','85125','HATO COROZAL'); 
INSERT INTO municipio VALUES ('85','85136','LA SALINA'); 
INSERT INTO municipio VALUES ('85','85139','MANÍ'); 
INSERT INTO municipio VALUES ('85','85162','MONTERREY'); 
INSERT INTO municipio VALUES ('85','85225','NUNCHÍA'); 
INSERT INTO municipio VALUES ('85','85230','OROCUÉ'); 
INSERT INTO municipio VALUES ('85','85250','PAZ DE ARIPORO'); 
INSERT INTO municipio VALUES ('85','85263','PORE'); 
INSERT INTO municipio VALUES ('85','85279','RECETOR'); 
INSERT INTO municipio VALUES ('85','85300','SABANALARGA'); 
INSERT INTO municipio VALUES ('85','85315','SÁCAMA'); 
INSERT INTO municipio VALUES ('85','85325','SAN LUIS DE PALENQUE'); 
INSERT INTO municipio VALUES ('85','85400','TÁMARA'); 
INSERT INTO municipio VALUES ('85','85410','TAURAMENA'); 
INSERT INTO municipio VALUES ('85','85430','TRINIDAD'); 
INSERT INTO municipio VALUES ('85','85440','VILLANUEVA'); 
INSERT INTO municipio VALUES ('86','86001','MOCOA'); 
INSERT INTO municipio VALUES ('86','86219','COLÓN'); 
INSERT INTO municipio VALUES ('86','86320','ORITO'); 
INSERT INTO municipio VALUES ('86','86568','PUERTO ASÍS'); 
INSERT INTO municipio VALUES ('86','86569','PUERTO CAICEDO'); 
INSERT INTO municipio VALUES ('86','86571','PUERTO GUZMÁN'); 
INSERT INTO municipio VALUES ('86','86573','LEGUÍZAMO'); 
INSERT INTO municipio VALUES ('86','86749','SIBUNDOY'); 
INSERT INTO municipio VALUES ('86','86755','SAN FRANCISCO'); 
INSERT INTO municipio VALUES ('86','86757','SAN MIGUEL'); 
INSERT INTO municipio VALUES ('86','86760','SANTIAGO'); 
INSERT INTO municipio VALUES ('86','86865','VALLE DEL GUAMUEZ'); 
INSERT INTO municipio VALUES ('86','86885','VILLAGARZÓN'); 
INSERT INTO municipio VALUES ('88','88001','SAN ANDRÉS'); 
INSERT INTO municipio VALUES ('88','88564','PROVIDENCIA'); 
INSERT INTO municipio VALUES ('91','91001','LETICIA'); 
INSERT INTO municipio VALUES ('91','91263','EL ENCANTO'); 
INSERT INTO municipio VALUES ('91','91405','LA CHORRERA'); 
INSERT INTO municipio VALUES ('91','91407','LA PEDRERA'); 
INSERT INTO municipio VALUES ('91','91430','LA VICTORIA'); 
INSERT INTO municipio VALUES ('91','91460','MIRITI - PARANÁ'); 
INSERT INTO municipio VALUES ('91','91530','PUERTO ALEGRÍA'); 
INSERT INTO municipio VALUES ('91','91536','PUERTO ARICA'); 
INSERT INTO municipio VALUES ('91','91540','PUERTO NARIÑO'); 
INSERT INTO municipio VALUES ('91','91669','PUERTO SANTANDER'); 
INSERT INTO municipio VALUES ('91','91798','TARAPACÁ'); 
INSERT INTO municipio VALUES ('94','94001','INÍRIDA'); 
INSERT INTO municipio VALUES ('94','94343','BARRANCO MINAS'); 
INSERT INTO municipio VALUES ('94','94663','MAPIRIPANA'); 
INSERT INTO municipio VALUES ('94','94883','SAN FELIPE'); 
INSERT INTO municipio VALUES ('94','94884','PUERTO COLOMBIA'); 
INSERT INTO municipio VALUES ('94','94885','LA GUADALUPE'); 
INSERT INTO municipio VALUES ('94','94886','CACAHUAL'); 
INSERT INTO municipio VALUES ('94','94887','PANA PANA'); 
INSERT INTO municipio VALUES ('94','94888','MORICHAL'); 
INSERT INTO municipio VALUES ('95','95001','SAN JOSÉ DEL GUAVIARE'); 
INSERT INTO municipio VALUES ('95','95015','CALAMAR'); 
INSERT INTO municipio VALUES ('95','95025','EL RETORNO'); 
INSERT INTO municipio VALUES ('95','95200','MIRAFLORES'); 
INSERT INTO municipio VALUES ('97','97001','MITÚ'); 
INSERT INTO municipio VALUES ('97','97161','CARURU'); 
INSERT INTO municipio VALUES ('97','97511','PACOA'); 
INSERT INTO municipio VALUES ('97','97666','TARAIRA'); 
INSERT INTO municipio VALUES ('97','97777','PAPUNAUA'); 
INSERT INTO municipio VALUES ('97','97889','YAVARATÉ'); 
INSERT INTO municipio VALUES ('99','99001','PUERTO CARREÑO'); 
INSERT INTO municipio VALUES ('99','99524','LA PRIMAVERA'); 
INSERT INTO municipio VALUES ('99','99624','SANTA ROSALÍA'); 
INSERT INTO municipio VALUES ('99','99773','CUMARIBO');

 