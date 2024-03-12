--SELECT fun_update_usuario(91423627,'91423627','Carlos Perez','laura2021*','1','2021-10-17')
CREATE OR REPLACE FUNCTION fun_update_bancos(wbanco_id      banco.banco_id%TYPE,
                                            wbanco_nom     banco.banco_nom%TYPE
                                            )RETURNS BOOLEAN AS
$BODY$
    BEGIN
        UPDATE banco  SET  
                             banco_nom     = wbanco_nom           
        WHERE banco_id = wbanco_id;
        IF FOUND THEN
            RETURN TRUE;
        ELSE
            RETURN FALSE;
        END IF;
    END;
$BODY$
LANGUAGE PLPGSQL 