CREATE OR REPLACE FUNCTION fun_delete_tpservicio(wtpo_servicio_id tipo_servicio.tpo_servicio_id%TYPE)
RETURNS BOOLEAN AS
$BODY$
     BEGIN
          UPDATE tipo_servicio SET ind_borrado=FALSE 
          WHERE tpo_servicio_id= wtpo_servicio_id;
          IF FOUND THEN
               RETURN TRUE;
          ELSE
               RETURN FALSE;      
          END IF;
     END;
$BODY$
LANGUAGE PLPGSQL