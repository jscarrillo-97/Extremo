 --SELECT fun_insert_usuarios(100,'jloca','Juana la Loca','juana123',1);
CREATE OR REPLACE FUNCTION fun_insert_det_reservas(wid_reserva        detalle_reserva.id_reserva%TYPE,
                                                   wid_servicio       detalle_reserva.id_servicio%TYPE,
                                                   wcant_serv         detalle_reserva.cant_serv%TYPE,
                                                   wval_total         detalle_reserva.val_total%TYPE
                                                  )RETURNS BOOLEAN AS
$BODY$                                         
    BEGIN
        INSERT INTO detalle_reserva VALUES(wid_reserva,wid_servicio,wcant_serv,wval_total); 
        IF FOUND THEN
            RETURN TRUE;
        ELSE
            RETURN FALSE;
        END IF;
    END;
$BODY$
LANGUAGE PLPGSQL;  
 