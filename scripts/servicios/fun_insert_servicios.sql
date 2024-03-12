 --SELECT fun_insert_usuarios(100,'jloca','Juana la Loca','juana123',1);
CREATE OR REPLACE FUNCTION fun_insert_servicios(wid_tpo_servicio servicio.id_tpo_servicio%TYPE,
                                                wservicio_nom    servicio.servicio_nom%TYPE,
                                                wservicio_det    servicio.servicio_det%TYPE,
                                                ) RETURNS BOOLEAN AS
                                               
$BODY$
    DECLARE wservicio_id servicio.servicio_id%TYPE; 
    BEGIN
        SELECT MAX(servicio_id) INTO  wservicio_id FROM servicio;
        IF   wservicio_id IS NULL OR   wservicio_id=0 THEN
            wservicio_id = 1;
        ELSE
             wservicio_id =   wservicio_id + 1;
        END IF;
        INSERT INTO servicio VALUES(wservicio_id,wid_tpo_servicio,wservicio_nom,wservicio_det,TRUE);
        IF FOUND THEN
            RETURN TRUE;
        ELSE
            RETURN FALSE;
        END IF;
    END;
$BODY$
LANGUAGE PLPGSQL; 


 
                                               
 