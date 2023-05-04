SET @fecha = '2024-01-01';

SELECT * FROM Evento
WHERE fecha < @fecha;