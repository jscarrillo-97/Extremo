--SELECT fun_update_usuario(91423627,'91423627','Carlos Perez','laura2021*','1','2021-10-17')
CREATE OR REPLACE FUNCTION fun_update_pro_banco(wid_banco   cliente.id_banco%TYPE,
                                               wnum_cuenta cliente.num_cuenta%TYPE,
                                               wcliente_cto  cliente.cliente_cto%TYPE
                                               )RETURNS BOOLEAN AS
$BODY$
    BEGIN
        UPDATE cliente  SET  
                                 
                                cliente_pass  = wcliente_pass,
                                cliente_tel   = wcliente_tel,
                                cliente_cto   = wcliente_cto
        WHERE cliente_id = wcliente_id;
        IF FOUND THEN
            RETURN TRUE;
        ELSE
            RETURN FALSE;
        END IF;
    END;
$BODY$
LANGUAGE PLPGSQL