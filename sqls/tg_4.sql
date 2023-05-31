DELIMITER //

CREATE TRIGGER actualizar_posicion_llegada
AFTER UPDATE ON Participa
FOR EACH ROW
BEGIN
  UPDATE Participa p
  SET p.posicion_llegada = (
  SELECT COUNT(*) + 1
    FROM Participa p2
    WHERE p.codigo_corredor = p2.codigo_corredor
    AND p2.tiempo <= p.tiempo
    AND p.id_evento = p2.id_evento
   );
END //

DELIMITER ;