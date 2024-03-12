
--SELECT fun_insert_usuarios(100,'jloca','Juana la Loca','juana123',1);
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
  
 
                                               
 
  


 
                                               
 
 
                                               
  


 
                                               
 