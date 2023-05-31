DELIMITER //

CREATE TRIGGER impide_registro_corredor_liga
BEFORE INSERT ON Representa
FOR EACH ROW
BEGIN
    DECLARE numParticipaciones INTEGER;
    SELECT COUNT(*) INTO numParticipaciones FROM Participa
    WHERE codigoCorredor = NEW.codigoCorredor AND codigoEvento = (
    SELECT codigoEvento FROM Evento WHERE codigoLiga = NEW.codigoLiga ORDER BY fecha ASC LIMIT 1
    );
    IF numParticipaciones = 0 THEN
       SIGNAL SQLSTATE '45000' 
       SET MESSAGE_TEXT = 'El corredor no participó en la primera carrera de la liga.';
    END IF;
END //

DELIMITER ;