--SELECT fun_update_usuario(91423627,'91423627','Carlos Perez','laura2021*','1','2021-10-17')
CREATE OR REPLACE FUNCTION fun_update_proveedores(wproveedor_nit   proveedor.proveedor_nit%TYPE,
                                                  wid_municipio    proveedor.id_municipio%TYPE,
                                                  wproveedor_nom   proveedor.proveedor_nom%TYPE,
                                                  wproveedor_dir   proveedor.proveedor_dir%TYPE,
                                                  wproveedor_mail  proveedor.proveedor_mail%TYPE,
                                                  wproveedor_tel   proveedor.proveedor_tel%TYPE
                                               )RETURNS BOOLEAN AS
$BODY$
    BEGIN
        UPDATE proveedor  SET   
                                id_municipio    = wid_municipio,  
                                proveedor_nom   = wproveedor_nom,
                                proveedor_dir   = wproveedor_dir,
                                proveedor_mail  = wproveedor_mail,
                                proveedor_tel   = wproveedor_tel 
        WHERE proveedor_nit = wproveedor_nit;
        IF FOUND THEN
            RETURN TRUE;
        ELSE
            RETURN FALSE;
       END IF;
    END;
$BODY$
LANGUAGE PLPGSQL