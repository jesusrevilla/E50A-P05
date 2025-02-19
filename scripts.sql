
-- create
CREATE TABLE empleados (
  id SERIAL PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  salario NUMERIC NOT NULL
);

-- insert
INSERT INTO empleados (nombre, salario) VALUES ('Juan Pérez', 50000);
INSERT INTO empleados (nombre, salario) VALUES ('Ana Gómez', 60000);
INSERT INTO empleados (nombre, salario) VALUES ('Luis Martínez', 55000);
INSERT INTO empleados (nombre, salario) VALUES ('Adriana Martínez', 65000);
INSERT INTO empleados (nombre, salario) VALUES ('Susana Montoya', 55000);

UPDATE empleados SET salario = 65000 WHERE nombre='Ana Gómez';
DELETE FROM empleados WHERE nombre = 'Luis Martínez';

-- fetch 
SELECT * FROM empleados;
SELECT * FROM empleados WHERE salario > 50000;
SELECT nombre FROM empleados;

