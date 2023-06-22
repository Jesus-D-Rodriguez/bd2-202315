CREATE VIEW Participantes_por_evento AS
SELECT Participa.codigoCorredor, Corredor.nombre, Participa.numParticipacion
FROM Participa
JOIN Corredor ON Participa.codigoCorredor = Corredor.codigoCorredor
WHERE Participa.codigoEvento = 1;