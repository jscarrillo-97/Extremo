 


CREATE OR REPLACE FUNCTION fun_delete_servicio(wservicio_id servicio.servicio_id%TYPE) RETURNS BOOLEAN AS
$BODY$
     BEGIN
          UPDATE servicio SET ind_borrado=FALSE 
          WHERE  servicio_id = wservicio_id;
          IF FOUND THEN
               RETURN TRUE;
          ELSE
               RETURN FALSE;
          END IF;
     END;
$BODY$
LANGUAGE PLPGSQL
 

 