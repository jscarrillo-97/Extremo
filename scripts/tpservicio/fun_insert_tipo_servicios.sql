  --SELECT fun_insert_usuarios(100,'jloca','Juana la Loca','juana123',1);
CREATE OR REPLACE FUNCTION fun_insert_tipo_servicios(wtpo_servicio_nom tipo_servicio.tpo_servicio_nom%TYPE) RETURNS BOOLEAN AS
                                               
$BODY$
    DECLARE wtpo_servicio_id tipo_servicio.tpo_servicio_id%TYPE; 
    BEGIN
        SELECT MAX(tpo_servicio_id) INTO wtpo_servicio_id FROM tipo_servicio ;
        IF wtpo_servicio_id IS NULL OR wtpo_servicio_id=0 THEN
          wtpo_servicio_id = 1;
        ELSE
           wtpo_servicio_id =wtpo_servicio_id + 1;
        END IF;
        INSERT INTO tipo_servicio  VALUES(wtpo_servicio_id,wtpo_servicio_nom,TRUE);
        IF FOUND THEN
            RETURN TRUE;
        ELSE
            RETURN FALSE;
        END IF;
    END;
$BODY$
LANGUAGE PLPGSQL; 

 