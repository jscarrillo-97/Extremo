 --SELECT fun_insert_usuarios(100,'jloca','Juana la Loca','juana123',1);
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
 