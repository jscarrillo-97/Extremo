
--SELECT fun_insert_usuarios(100,'jloca','Juana la Loca','juana123',1);
CREATE OR REPLACE FUNCTION fun_insert_municipios(wmunicipio_nom municipio.municipio_nom%TYPE,
                                                 wcod_postal municipio.cod_postal%TYPE ) RETURNS BOOLEAN AS
$BODY$
    DECLARE wmunicipio_id municipio.municipio_id%TYPE;
    BEGIN
        SELECT MAX(municipio_id) INTO wmunicipio_id FROM municipio;
        IF wmunicipio_id IS NULL OR  wmunicipio_id =0 THEN
           wmunicipio_id = 1;
        ELSE
           wmunicipio_id = wmunicipio_id + 1;
        END IF;
        INSERT INTO municipio VALUES(wmunicipio_id,wmunicipio_nom,wcod_postal,TRUE);
        IF FOUND THEN
            RETURN TRUE;
        ELSE
            RETURN FALSE;
        END IF;
    END;
$BODY$
LANGUAGE PLPGSQL
  
 
                                               
 
  


 
                                               
 
 
                                               
  


 
                                               
 