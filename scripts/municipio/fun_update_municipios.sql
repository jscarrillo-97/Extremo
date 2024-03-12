--SELECT fun_update_usuario(91423627,'91423627','Carlos Perez','laura2021*','1','2021-10-17')
CREATE OR REPLACE FUNCTION fun_update_municipios(wmunicipio_id   municipio.municipio_id%TYPE,
                                                 wmunicipio_nom  municipio.municipio_nom%TYPE,
                                                 wcod_postal     municipio.cod_postal%TYPE
                                                )RETURNS BOOLEAN AS
$BODY$
      BEGIN
        UPDATE municipio  SET
                                municipio_nom  = wmunicipio_nom,
                                cod_postal    = wcod_postal                            
        WHERE municipio_id = wmunicipio_id;
        IF FOUND THEN
            RETURN TRUE;
        ELSE
            RETURN FALSE;
        END IF;
    END;
$BODY$
LANGUAGE PLPGSQL