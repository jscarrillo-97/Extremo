CREATE OR REPLACE FUNCTION fun_delete_bancos(wbanco_id banco.banco_id%TYPE)
RETURNS BOOLEAN AS
$BODY$
     BEGIN
          UPDATE banco SET ind_borrado=FALSE 
          WHERE banco_id= wbanco_id;
          IF FOUND THEN
               RETURN TRUE;
          ELSE
               RETURN FALSE;
          END IF;
     END;
$BODY$
LANGUAGE PLPGSQL