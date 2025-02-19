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

-- Prueba unitaria para comprobar salario arriba de 50000
DO $$ 
DECLARE
    empleados_count INT;
BEGIN
    SELECT COUNT(*) INTO empleados_count FROM empleados WHERE salario > 50000;

    -- Verificar que la cantidad de empleados sea 3
    IF empleados_count <> 3 THEN
        RAISE EXCEPTION 'Error: La cantidad de empleados debería de ser 3';
    ELSE  
        RAISE NOTICE 'Prueba 3: Correcta';
    END IF;
END $$;

-- Prueba unitaria para comprobar nombre de empleados
DO $$ 
DECLARE
    empleados_nombres TEXT[];
BEGIN
    -- Obtener los nombres de todos los empleados
    SELECT ARRAY(SELECT nombre FROM empleados) INTO empleados_nombres;

    -- Verificar que los nombres sean correctos
    IF NOT ('Juan Pérez' = ANY(empleados_nombres) AND 
            'Ana Gómez' = ANY(empleados_nombres) AND
            'Adriana Martínez' = ANY(empleados_nombres) AND
            'Susana Montoya' = ANY(empleados_nombres)) THEN
        RAISE EXCEPTION 'Error: Los nombres de los empleados no son los esperados';
    ELSE  
        RAISE NOTICE 'Prueba 4: Correcta';
    END IF;
END $$;

-- Prueba unitaria para comprobar el salario total de todos los empleados
DO $$ 
DECLARE
    salario_total NUMERIC;
BEGIN
    -- Calcular el salario total de todos los empleados
    SELECT SUM(salario) INTO salario_total FROM empleados;

    -- Verificar que el salario total sea el esperado
    IF salario_total <> 235000 THEN
        RAISE EXCEPTION 'Error: El salario total no es correcto. El valor esperado es 245000';
    ELSE  
        RAISE NOTICE 'Prueba 5: Correcta';
    END IF;
END $$;

-- Prueba unitaria para comprobar la cantidad total de empleados
DO $$ 
DECLARE
    empleados_count INT;
BEGIN
    -- Contar la cantidad de empleados
    SELECT COUNT(*) INTO empleados_count FROM empleados;

    -- Verificar que la cantidad de empleados sea la esperada (4 empleados después de la eliminación de Luis Martínez)
    IF empleados_count <> 4 THEN
        RAISE EXCEPTION 'Error: La cantidad total de empleados no es la esperada. El valor esperado es 4';
    ELSE  
        RAISE NOTICE 'Prueba 6: Correcta';
    END IF;
END $$;

-- Prueba unitaria para verificar que los salarios estén dentro de un rango esperado
DO $$ 
DECLARE
    salario_empleado NUMERIC;
BEGIN
    -- Verificar que todos los salarios estén entre 30,000 y 100,000
    FOR salario_empleado IN (SELECT salario FROM empleados) LOOP
        IF salario_empleado < 30000 OR salario_empleado > 100000 THEN
            RAISE EXCEPTION 'Error: El salario % es fuera del rango permitido (30,000 - 100,000)', salario_empleado;
        END IF;
    END LOOP;

    RAISE NOTICE 'Prueba 7: Correcta';
END $$;
