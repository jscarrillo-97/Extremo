CREATE OR REPLACE FUNCTION fun_update_servicios(wservicio_id     servicio.servicio_id%TYPE,
                                                wid_tpo_servicio servicio.id_tpo_servicio%TYPE,
                                                wservicio_nom    servicio.servicio_nom%TYPE,
                                                wservicio_det    servicio.servicio_det%TYPE 
                                               )RETURNS BOOLEAN AS
$BODY$
    BEGIN
        UPDATE servicio  SET  
                                id_tpo_servicio =  wid_tpo_servicio,
                                servicio_nom    =  wservicio_nom,
                                servicio_disp   =  wservicio_disp,
                                servicio_det    =  wservicio_det 
        WHERE servicio_id = wservicio_id;
        IF FOUND THEN
            RETURN TRUE;
        ELSE
            RETURN FALSE;
        END IF;
    END;
$BODY$
LANGUAGE PLPGSQL;