CREATE OR REPLACE FUNCTION fun_insert_factura(wid_cliente  cliente.id_cliente%TYPE,
                                              wfec_inicio  reserva.fec_inicio%TYPE,
                                              wfec_fin     reserva.fec_fin%TYPE,
                                              west_reserva reserva.est_reserva%TYPE,
                                              ---Arrays para procesar multiples valores
                                              wid_servicio DECIMAL(2,0)[] ,wnit_proveedor DECIMAL(9,0)[]
                                              wcant_persona DECIMAL(2,0)[],wval_bruto DECIMAL(10,0)[],
                                              ) RETURNS VARCHAR AS 
$BODY$
    DECLARE wreserva_id  parametros.num_fact%TYPE;
    DECLARE wmessage  VARCHAR;
    DECLARE wcliente  cliente.cliente_id%TYPE;
    DECLARE wreg_proveedor_serv RECORD;
    DECLARE i INTEGER;
    DECLARE cantarray_servicios INTEGER = array_length(wid_servicio, 1);
    --DECLARE wreg_producto RECORD;
    --DECLARE wnewStock INTEGER;
    --DECLARE winsert INTEGER;

    BEGIN
        --Buscar ultimo número de factura
        wmessage='00000';
        SELECT num_fact INTO wreserva_id FROM parametros;
        IF NOT FOUND THEN 
            wmessage = 'No se encontró ningún número de factura';
            RETURN wmessage
        END IF;
        num_fact += 1;
        
        --Verificarla existencia del cliente
        SELECT c.cliente_id INTO wcliente FROM cliente c
        WHERE  c.cliente_id = wcliente;                                 
        IF NOT FOUND THEN
            wmessage = 'El cliente no se encuentra registrado';
            RETURN wmessage;
        END IF;

        SELECT nit_proveedor,id_servicio,estado_dispo,precio_reserva INTO wreg_proveedor_serv
        FROM proveedor_servicio WHERE nit_proveedor= wreg_proveedor_serv.nit_proveedor 
        AND id_servicio =wreg_proveedor_serv.id_servicio;
        IF NOT FOUND THEN
            wmessage = 'El servicio de este proveedor no se encuentra disponible'
            RETURN  wmessage;
        END IF;


        i=1;
        wnewStock = 0;
        winsert = 1;
        FOR i in 1..cantarray_servicios LOOP
            IF winsert = 1 THEN
                IF wtiponombre != 'Ninguno' THEN
                    BEGIN WORK;
                    INSERT INTO pedidoproveedor(pedidoNum, nitProvee, idTipPag, pedidoTotal, pedidoPag, usr_insert, usr_insert_rol) 
                                VALUES(wnum_pedido, wnit_proveedor, wid_tipopago, wtotal_pedido, TRUE, wuser_insert, wuser_insert_rol);
                    IF NOT FOUND THEN
                        wmessage = 'El número de pedido % al proveedor % no se ha insertado', wnum_pedido, wnit_proveedor;
                        ROLLBACK;
                        RETURN wmessage;
                    END IF;
                ELSE





$BODY$
LANGUAGE PLPGSQL;