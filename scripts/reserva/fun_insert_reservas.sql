
--SELECT fun_insert_usuarios(100,'jloca','Juana la Loca','juana123',1);
CREATE OR REPLACE FUNCTION fun_insert_reservas (wid_cliente reserva.id_cliente%TYPE,
                                                wreserva_fech   reserva.reserva_fech%TYPE,
                                                wreserva_dur   reserva.reserva_dur%TYPE,
                                                wreserva_val  reserva.reserva_val%TYPE,
 
 wreserva_est  reserva.reserva_est%TYPE                                               ) RETURNS BOOLEAN AS
$BODY$
    DECLARE wreserva_id reserva.reserva_id%TYPE;
    BEGIN
        SELECT MAX(reserva_id) INTO wreserva_id FROM reserva;
        IF wreserva_id IS NULL OR  wreserva_id =0 THEN
           wreserva_id = 1;
        ELSE
           wreserva_id = wreserva_id + 1;
        END IF;
        INSERT INTO reserva VALUES(wreserva_id,wid_cliente,wreserva_fech,wreserva_dur,wreserva_val,wreserva_est);
    IF FOUND THEN
            RETURN TRUE;
        ELSE
            RETURN FALSE;
        END IF;
    END;
$BODY$
LANGUAGE PLPGSQL
  
 
                                               
 
  


 
                                               
 
 
                                               
  


 
                                               
 