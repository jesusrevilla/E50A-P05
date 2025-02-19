--Universidad Politécnica de San Luis Potosí
--          18 de Febrero, 2025
--            Base de Datos
--    Christian Alejandro Cárdenas Rucoba

--        Dependencia Funcional

--1. Crear la tabla empleados
CREATE TABLE empleados(
  id SERIAL PRIMARY KEY,
  nombre VARCHAR(100),
  salario NUMERIC
);

--2. Insertar datos en la tabla
INSERT INTO empleados(nombre,salario) VALUES
('Juan Pérez',50000),
('Ana Gómez',60000),
('Luis Martínez',55000),
('Adriana Martínez',65000),
('Susana Montoya',55000);

--3. Actualizar datos
UPDATE empleados 
SET salario = 65000
WHERE nombre = 'Ana Gómez';

--4. Eliminar datos
DELETE FROM empleados
WHERE nombre = 'Luis Martínez';

--5. Consultas
--Seleccionar todos los empleados:
SELECT * FROM empleados;

--Seleccionar empleados con salario mayor a 50000:
SELECT * FROM empleados WHERE salario > 50000;

--Seleccionar solo los nombres de los empleados
SELECT nombre FROM empleados;

-- Prueba unitaria para actualizar el salario de Ana Gómez
DO $$
BEGIN
    -- Verificar que el salario se haya actualizado correctamente
    IF (SELECT salario FROM empleados WHERE nombre = 'Ana Gómez') != 65000 THEN
        RAISE EXCEPTION 'Error: El salario no se actualizó correctamente';
    END IF;
END $$;

-- Prueba unitaria para eliminar a Luis Martínez
DO $$
BEGIN
    -- Verificar que el registro se haya eliminado
    IF EXISTS (SELECT 1 FROM empleados WHERE nombre = 'Luis Martínez') THEN
        RAISE EXCEPTION 'Error: El registro no se eliminó correctamente';
    END IF;
END $$;
