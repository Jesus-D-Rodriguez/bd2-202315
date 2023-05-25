DELIMITER $$

CREATE PROCEDURE Inscribir(
    IN codigoCorredor INT,
    IN codigoEvento INT,
    OUT Num_Corredor INT
)
BEGIN
    DECLARE genero CHAR(1);
    DECLARE distanciaEvento INT;
    DECLARE numEntrenamientos INT;
    DECLARE numCorredores INT;
    -- Obtener el género del corredor
    SELECT genero INTO genero FROM Corredor WHERE codigoCorredor = codigoCorredor;
    -- Obtener la distancia del evento
    SELECT distanciaEvento INTO distanciaEvento FROM Evento WHERE codigoEvento = codigoEvento;
    -- Obtener el número de entrenamientos del corredor de la misma distancia o superior
    SELECT COUNT(*) INTO numEntrenamientos FROM Tiene_historial TH
    INNER JOIN Entrenamiento E ON TH.codigoEntrenamiento = E.codigo
    WHERE TH.codigoCorredor = codigoCorredor AND E.distanciaEntrenamiento >= distanciaEvento;
    -- Obtener el número de corredores inscritos en el evento
    SELECT COUNT(*) INTO numCorredores FROM Participa WHERE codigoEvento = codigoEvento;
    -- Verificar que el corredor cumple con los requisitos de inscripción
    IF(numEntrenamientos >= 3) THEN
        -- Asignar el siguiente número de corredor disponible en el evento
        IF (numCorredores%2 = 0) THEN
            SET Num_Corredor = IF(genero = 'F', numCorredores + 1, numCorredores + 2);
        ELSE
            SET Num_Corredor = IF(genero = 'F', numCorredores + 2, numCorredores + 1);
        END IF;
        -- Insertar el registro de participación
        INSERT INTO Participa (codigoCorredor, codigoEvento, nombreCategoria, tiempo, numParticipacion)
        VALUES (codigoCorredor, codigoEvento, 'Senior', 0, Num_Corredor);
    ELSE
        -- Asignar null al número de corredor si no se cumple con los requisitos de inscripción
        SET Num_Corredor = NULL;
    END IF;
END$$

DELIMITER ;