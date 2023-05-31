DELIMITER //
CREATE TRIGGER verificar_categoria
BEFORE INSERT ON Participa
FOR EACH ROW
BEGIN
  DECLARE num_rows INTEGER;
  SELECT COUNT(*) INTO num_rows
  FROM Participa
  WHERE codigoCorredor = NEW.codigoCorredor
  AND codigoEvento = NEW.codigoEvento
  AND nombreCategoria != NEW.nombreCategoria;
  IF num_rows > 0 THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'El corredor ya está inscrito en otra categoría de este evento';
  END IF;
END //
DELIMITER ;