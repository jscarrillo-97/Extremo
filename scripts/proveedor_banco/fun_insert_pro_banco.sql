 --SELECT fun_insert_usuarios(100,'jloca','Juana la Loca','juana123',1);
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
 