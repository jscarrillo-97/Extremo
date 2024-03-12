CREATE OR REPLACE FUNCTION fun_delete_municipios(wmunicipio_id municipio.municipio_id%TYPE)
RETURNS BOOLEAN AS
$BODY$
     BEGIN
          UPDATE municipio SET ind_borrado=FALSE 
          WHERE  municipio_id= wmunicipio_id;
          IF FOUND THEN
               RETURN TRUE;
          ELSE
               RETURN FALSE;
          END IF;
     END;
$BODY$
LANGUAGE PLPGSQL