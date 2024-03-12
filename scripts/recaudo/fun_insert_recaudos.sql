
--SELECT fun_insert_usuarios(100,'jloca','Juana la Loca','juana123',1);
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
LANGUAGE PLPGSQL
  
 
                                               
 
  


 
                                               
 
 
                                               
  


 
                                               
 