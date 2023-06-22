CREATE VIEW CarrerasPorRestoDeAno AS
SELECT E.codigoEvento, E.nombre AS NombreEvento, E.fecha, COUNT(P.codigoCorredor) AS ParticipantesInscritos
FROM Evento E
LEFT JOIN Participa P ON E.codigoEvento = P.codigoEvento
WHERE YEAR(E.fecha) = YEAR(CURDATE()) AND MONTH(E.fecha) >= MONTH(CURDATE())
GROUP BY E.codigoEvento, E.nombre, E.fecha;