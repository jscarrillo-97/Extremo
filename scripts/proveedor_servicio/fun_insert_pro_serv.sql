 --SELECT fun_insert_usuarios(100,'jloca','Juana la Loca','juana123',1);
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
 