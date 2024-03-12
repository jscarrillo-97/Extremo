 --SELECT fun_insert_usuarios(100,'jloca','Juana la Loca','juana123',1);
CREATE OR REPLACE FUNCTION fun_insert_proveedores(wproveedor_nit    proveedor.proveedor_nit%TYPE,
                                                  wproveedor_rnt    proveedor.proveedor_rnt%TYPE,                  
                                                  wid_municipio     proveedor.id_municipio%TYPE,
                                                  wproveedor_nom    proveedor.proveedor_nom%TYPE,
                                                  wproveedor_dir    proveedor.proveedor_dir%TYPE,
                                                  wproveedor_mail   proveedor.proveedor_mail%TYPE,
                                                  wproveedor_tel    proveedor.proveedor_tel%TYPE 
                                                 )RETURNS BOOLEAN AS
$BODY$
    BEGIN
 
        INSERT INTO proveedor VALUES(wproveedor_nit,wproveedor_rnt,wid_municipio,wproveedor_nom,wproveedor_dir,wproveedor_mail,wproveedor_tel,TRUE); 
        IF FOUND THEN
            RETURN TRUE;
        ELSE
            RETURN FALSE;
        END IF;
    END;
$BODY$
LANGUAGE PLPGSQL;  
 