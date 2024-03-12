--SELECT fun_update_usuario(91423627,'91423627','Carlos Perez','laura2021*','1','2021-10-17')
CREATE OR REPLACE FUNCTION fun_update_tipo_servicios(wtpo_servicio_id   tipo_servicio.tpo_servicio_id%TYPE,
                                                    wtpo_servicio_nom  tipo_servicio.tpo_servicio_nom%TYPE
                                                    
                                                   )RETURNS BOOLEAN AS
$BODY$
    BEGIN
        UPDATE tipo_servicio  SET  
                                tpo_servicio_nom  =  wtpo_servicio_nom
                                
        WHERE tpo_servicio_id = wtpo_servicio_id;
        IF FOUND THEN
            RETURN TRUE;
        ELSE
            RETURN FALSE;
        END IF;
    END;
$BODY$
LANGUAGE PLPGSQL