DELIMITER //
CREATE PROCEDURE EliminarCorredor (IN codigoCorredor INT)
BEGIN
    -- Eliminar los registros de la tabla Tiene_historial que corresponden al corredor
    DELETE FROM Tiene_historial WHERE codigoCorredor = codigoCorredor;
    -- Eliminar los registros de la tabla Participa que corresponden al corredor
    DELETE FROM Participa WHERE codigoCorredor = codigoCorredor;
    -- Eliminar el registro del corredor en la tabla Corredor
    DELETE FROM Corredor WHERE codigoCorredor = codigoCorredor;
    -- Eliminar el registro del corredor en la tabla Representa
    DELETE FROM Representa WHERE codigoCorredor = codigoCorredor;
END //

DELIMITER ;