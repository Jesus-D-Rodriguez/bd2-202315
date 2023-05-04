SET @codigoEvento = 1;
SELECT Corredor.*, Participa.numParticipacion, Participa.nombreCategoria
FROM Corredor
JOIN Participa ON Corredor.codigoCorredor = Participa.codigoCorredor
JOIN Evento ON Participa.codigoEvento = Evento.codigoEvento
WHERE Evento.codigoEvento = @codigoEvento;