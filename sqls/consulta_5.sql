SET @codigoEvento = 1;
SELECT Corredor.nombre, Participa.tiempo, Participa.nombreCategoria
FROM Corredor
INNER JOIN Participa ON Corredor.codigoCorredor = Participa.codigoCorredor
WHERE Participa.codigoEvento = @codigoEvento
ORDER BY Participa.tiempo ASC, Participa.nombreCategoria ASC;