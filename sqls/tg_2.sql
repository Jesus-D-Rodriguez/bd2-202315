DELIMITER //
CREATE TRIGGER eliminar_datos_corredor
BEFORE DELETE ON Corredor
FOR EACH ROW
BEGIN
   DELETE FROM Tiene_historial WHERE codigoCorredor = OLD.codigoCorredor;
   DELETE FROM Representa WHERE codigoCorredor = OLD.codigoCorredor;
   DELETE FROM Participa WHERE codigoCorredor = OLD.codigoCorredor;
END //
DELIMITER ;