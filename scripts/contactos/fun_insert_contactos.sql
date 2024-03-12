--SELECT fun_insert_usuarios(100,'jloca','Juana la Loca','juana123',1);
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
  
 
                                               
 
  


 
                                               
 
 
                                               
  


 
                                               
 