SET @codigoCorredor = 1;
SET @distancia = 0;
SELECT e.codigo, e.distancia, e.fechaEntrenamiento
FROM Entrenamiento e
INNER JOIN Tiene_historial th ON e.codigo = th.codigoEntrenamiento
INNER JOIN Corredor c ON th.codigoCorredor = c.codigoCorredor
WHERE c.codigoCorredor = @codigoCorredor
AND e.distancia > @distancia
ORDER BY e.fechaEntrenamiento DESC;