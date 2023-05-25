SET @codigoClub = 1;
SELECT DISTINCT Corredor.codigoCorredor
FROM Corredor
INNER JOIN Representa ON Corredor.codigoCorredor = Representa.codigoCorredor
INNER JOIN Participa ON Corredor.codigoCorredor = Participa.codigoCorredor
WHERE Representa.codigoClub = @codigoClub;