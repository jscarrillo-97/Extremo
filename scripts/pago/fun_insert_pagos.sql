
--SELECT fun_insert_usuarios(100,'jloca','Juana la Loca','juana123',1);
CREATE OR REPLACE FUNCTION fun_insert_pagos (wnit_proveedor     pago.nit_proveedor%TYPE,
                                             wid_banco          pago.id_banco%TYPE,
                                             wpago_fec_hor      pago.pago_fec_hor%TYPE,
                                             wval_iva           pago.val_iva%TYPE,
                                             wval_neto          pago.val_neto%TYPE,
                                             wval_total         pago.val_total%TYPE,
                                             wcta_pgo          pago.cta_pgo%TYPE) RETURNS BOOLEAN AS
$BODY$
    DECLARE wpago_id pago.pago_id%TYPE;
    BEGIN
        SELECT MAX(pago_id) INTO wpago_id FROM pago;
        IF wpago_id IS NULL OR  wpago_id =0 THEN
           wpago_id = 1;
        ELSE
           wpago_id = wpago_id + 1;
        END IF;
        INSERT INTO pago VALUES(wpago_id,wnit_proveedor,wid_banco,wpago_fec_hor,wval_iva,wval_neto,wval_total,wcta_pgo);
    IF FOUND THEN
            RETURN TRUE;
        ELSE
            RETURN FALSE;
        END IF;
    END;
$BODY$
LANGUAGE PLPGSQL
  
 
                                               
 
  


 
                                               
 
 
                                               
  


 
                                               
 