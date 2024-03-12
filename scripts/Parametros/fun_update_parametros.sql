--SELECT fun_update_usuario(91423627,'91423627','Carlos Perez','laura2021*','1','2021-10-17')
CREATE OR REPLACE FUNCTION fun_update_parametros(wempresa_nit  parametros.empresa_nit%TYPE,
                                               wempresa_nom  parametros.empresa_nom%TYPE,
                                               wempresa_ciu  parametros.empresa_ciu%TYPE,
                                               wporc_iva     parametros.porc_iva%TYPE,
                                               wnum_fact     parametros.num_fact%TYPE,
                                               wadmin_mail   parametros.admin_mail%TYPE,
                                               wadmin_pass   parametros.admin_pass%TYPE
                                               )RETURNS BOOLEAN AS
$BODY$
    BEGIN
        UPDATE parametros  SET  
                                 empresa_nom  = wempresa_nom,
                                 empresa_ciu  = wempresa_ciu,
                                 porc_iva     = wporc_iva,
                                 num_fact     = wnum_fact,
                                 admin_mail   = wadmin_mail,
                                 admin_pass   = wadmin_pass
        WHERE empresa_nit = wempresa_nit;
        IF FOUND THEN
            RETURN TRUE;
        ELSE
            RETURN FALSE;
        END IF;
    END;
$BODY$
LANGUAGE PLPGSQL