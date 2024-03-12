 CREATE OR REPLACE FUNCTION verificar_disponibilidad(
                                                    wnit_proveedor proveedor_servicio.nit_proveedor%TYPE,
                                                    wid_servicio  proveedor_servicio.id_servicio%TYPE,
                                                    westado_dispo proveedor_servicio.estado_dispo%TYPE) 
                                                    RETURNS BOOLEAN AS
$BODY$
DECLARE wproveedor proveedor_servicio.nit_proveedor%TYPE;
DECLARE wservicio proveedor_servicio.id_servicio%TYPE;
DECLARE westado  proveedor_servicio.estado_dispo%TYPE;
BEGIN
    -- Verificar disponibilidad
    SELECT estado_dispo INTO westado
    FROM proveedor_servicio
    WHERE nit_proveedor = wnit_proveedor AND id_servicio = wid_servicio;

    -- Responder a la alerta del sistema
    IF westado = westado_dispo THEN
        -- Disponible
        RAISE NOTICE 'El proveedor con ID % está disponible para el servicio.', wproveedor;
    ELSE
        -- No disponible
        RAISE NOTICE 'El proveedor con ID % no está disponible para el servicio.', wproveedor;
        -- Registrar alerta
        INSERT INTO alerta (nit_proveedor, id_servicio, alerta_msg)
        VALUES (wnit_proveedor, wid_servicio, 'El proveedor no está disponible para el servicio');
    END IF;

    -- Retornar TRUE si proveedor está disponible
    IF FOUND THEN
        RETURN TRUE;
    ELSE
        RETURN FALSE;
    END IF;
END;
$BODY$
LANGUAGE PLPGSQL;

