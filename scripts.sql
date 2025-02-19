\echo 'Sebastian Heredia Pardo - 175680'

-- Creacion de tabla empleados
CREATE TABLE empleados (
 id SERIAL PRIMARY KEY,
 nombre VARCHAR(100),
 salario NUMERIC
);

INSERT INTO empleados (nombre, salario) VALUES 
('Juan Pérez', 50000),
('Ana Gómez', 60000),
('Luis Martínez', 55000),
('Adriana Martínez', 65000),
('Susana Montoya', 55000);

--SELECT * FROM empleados;

UPDATE empleados SET salario = 65000 WHERE nombre = 'Ana Gómez';

--SELECT * FROM empleados;

DELETE FROM empleados WHERE nombre = 'Luis Martínez';

SELECT * FROM empleados;
SELECT * FROM empleados WHERE salario > 50000;
SELECT nombre FROM empleados;
