DELIMITER $$
CREATE PROCEDURE InscribirEnLiga(
    IN codigoCorredor INT,
    IN codigoLiga INT,
    OUT Num_Corredor INT
)
BEGIN
    -- Verificar si es la primera carrera de la liga
    DECLARE numCarrerasLiga INT;
    DECLARE numInscripciones INT;
    SELECT COUNT(*) INTO numCarrerasLiga FROM Evento WHERE codigoLiga = codigoLiga;
    IF(numCarrerasLiga = 1) THEN
        -- Inscribir al corredor en la primera carrera de la liga
        CALL Inscribir(codigoCorredor, (SELECT codigo FROM Evento WHERE codigoLiga = codigoLiga), Num_Corredor);
        ELSE
        -- Verificar si el corredor se ha inscrito anteriormente en la liga
        SELECT COUNT(*) INTO numInscripciones FROM Participa P
        INNER JOIN Evento E ON P.codigoEvento = E.codigo
        WHERE P.codigoCorredor = codigoCorredor AND E.codigoLiga = codigoLiga;
        -- Si el corredor se ha inscrito anteriormente en la liga, inscribirlo en la carrera actual
        IF(numInscripciones > 0) THEN
            CALL Inscribir(codigoCorredor, (SELECT codigo FROM Evento WHERE codigoLiga = codigoLiga AND fechaEvento >= CURDATE()), Num_Corredor);
        ELSE
            -- Si el corredor no se ha inscrito anteriormente en la liga, no se puede inscribir en una carrera posterior
            SET Num_Corredor = NULL;
        END IF;
    END IF;
END$$
DELIMITER ;