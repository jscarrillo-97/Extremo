CREATE OR REPLACE FUNCTION fun_delete_clientes(wcliente_id cliente.cliente_id%TYPE)
RETURNS BOOLEAN AS
$BODY$
     BEGIN
          UPDATE cliente SET ind_borrado=FALSE 
          WHERE cliente_id= wcliente_id;
          IF FOUND THEN
               RETURN TRUE;
          ELSE
               RETURN FALSE;
          END IF;
     END;
$BODY$
LANGUAGE PLPGSQL