 --SELECT fun_insert_usuarios(100,'jloca','Juana la Loca','juana123',1);
CREATE OR REPLACE FUNCTION fun_insert_parametros(wempresa_nit   parametros.empresa_nit%TYPE,
                                                 wempresa_nom   parametros.empresa_nom%TYPE,
                                                 wempresa_ciu   parametros.empresa_ciu%TYPE,
                                                 wporc_iva      parametros.porc_iva%TYPE,
                                                 wnum_fact      parametros.num_fact%TYPE,
                                                 wprimer_pago   parametros.primer_pago%TYPE,
                                                 wadmin_mail    parametros.admin_mail%TYPE,
                                                 wadmin_pass    parametros.admin_pass %TYPE
                                               )RETURNS BOOLEAN AS
$BODY$
    BEGIN
 
        INSERT INTO parametros VALUES(wempresa_nit,wempresa_nom,wempresa_ciu,wporc_iva,wnum_fact,wprimer_pago,wadmin_mail,MD5(wadmin_pass)); 
        IF FOUND THEN
            RETURN TRUE;
        ELSE
            RETURN FALSE;
        END IF;
    END;
$BODY$
LANGUAGE PLPGSQL;  
 