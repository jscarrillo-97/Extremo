CREATE OR REPLACE FUNCTION fun_delete_proveedores(wproveedor_nit proveedor.proveedor_nit%TYPE)
RETURNS BOOLEAN AS
$BODY$
     BEGIN
          UPDATE proveedor SET ind_borrado=FALSE 
          WHERE  proveedor_nit = wproveedor_nit;
          IF FOUND THEN
               RETURN TRUE;
          ELSE
               RETURN FALSE;
          END IF;
     END;
$BODY$
LANGUAGE PLPGSQL