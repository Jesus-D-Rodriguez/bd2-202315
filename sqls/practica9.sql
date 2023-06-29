DELIMITER //

CREATE PROCEDURE EliminarCorredor (IN codigoCorredor INT)
BEGIN
    DECLARE exit HANDLER FOR SQLEXCEPTION ROLLBACK;
    DECLARE commit BOOLEAN DEFAULT FALSE;
    START TRANSACTION;
    
    -- Eliminar los registros de la tabla Tiene_historial que corresponden al corredor
    DELETE FROM Tiene_historial WHERE codigoCorredor = codigoCorredor;
    SET commit = TRUE;
    
    -- Eliminar los registros de la tabla Participa que corresponden al corredor
    DELETE FROM Participa WHERE codigoCorredor = codigoCorredor;
    SET commit = TRUE;
    
    -- Eliminar el registro del corredor en la tabla Corredor
    DELETE FROM Corredor WHERE codigoCorredor = codigoCorredor;
    SET commit = TRUE;
    
    -- Eliminar el registro del corredor en la tabla Representa
    DELETE FROM Representa WHERE codigoCorredor = codigoCorredor;
    SET commit = TRUE;
    
    IF commit THEN
        COMMIT;
    END IF;
END //

DELIMITER ;