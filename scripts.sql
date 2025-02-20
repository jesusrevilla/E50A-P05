CREATE TABLE empleados (
  Id SERIAL PRIMARY KEY,
  nombre  VARCHAR(100) NOT NULL,
  salario NUMERIC
);

--INSERTAR LIBROS
INSERT INTO empleados (nombre, salario) VALUES
('Juan Perez', 50000),
('Ana Gómez', 60000),
('Luis Martinez', 55000),
('Adriana Martinez', 65000),
('Susana Montoya', 55000);

--mostrar tabla de empleados original 
SELECT * FROM empleados;

--modificacion 1 de tabla 
UPDATE empleados SET salario = 65000 
WHERE nombre = 'Ana Gómez';
SELECT * FROM empleados;

-- eliminacion de registro 
DELETE FROM empleados
WHERE nombre = 'Luis Martinez';
SELECT * FROM empleados;

--mostrar empleados con sueldo mayor a los 50 000
SELECT * FROM empleados WHERE salario  > 50000;

--tabla  con solo nombres
SELECT nombre FROM empleados;


