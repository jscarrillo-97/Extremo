--SELECT fun_update_usuario(91423627,'91423627','Carlos Perez','laura2021*','1','2021-10-17')
CREATE OR REPLACE FUNCTION fun_update_pagos(wpago_id   pago.pago_id%TYPE,
                                            wpago_fec_hor pago.pago_fec_hor%TYPE,
                                            wval_iva   pago.val_iva%TYPE,
                                            wval_neto  pago.val_neto%TYPE,
                                            wval_total pago.val_total%TYPE,
                                            wcta_pgo   pago.cta_pgo%TYPE
                                            )RETURNS BOOLEAN AS
$BODY$
    BEGIN
        UPDATE pago  SET        
                                pago_fec_hor = wpago_fec_hor,  
                                val_iva      = wval_iva,
                                val_neto     = wval_neto,
                                val_total    = wval_total,
                                cta_pgo      = wcta_pgo
        WHERE pago_id = wpago_id;
        IF FOUND THEN
            RETURN TRUE;
        ELSE
           RETURN FALSE;
        END IF;
    END;
$BODY$
LANGUAGE PLPGSQL
 