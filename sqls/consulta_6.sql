SET @codigoClub = 1;
SELECT DISTINCT Corredor.nombre
FROM Corredor
INNER JOIN Representa ON Corredor.codigoCorredor = Representa.codigo
INNER JOIN Participa ON Corredor.codigoCorredor = Participa.codigoCorredor
WHERE Representa.codigoClub = @codigoClub;