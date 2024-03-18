--1.Mostar el contenido de cada una de las tablas del esquema de hr.
-- Locations
SELECT * FROM HR. LOCATIONS
-- Departments
SELECT * FROM HR.departments
-- Employees 
SELECT * FROM HR.Employees
-- Jobs
SELECT * FROM HR.Jobs
-- Jobs_History
SELECT * FROM HR.Job_History
-- Locations
SELECT * FROM HR.locations
-- Regions
SELECT * FROM HR.regions


--2. Mostrar el salario, nombre, apellido de los empleados.
SELECT salary , first_name , last_name FROM HR.Employees

--3. Presentar el código del empleado, su nombre y apellido y su nombre concatenado con una coma espacio y luego el apellido.
SELECT employee_id , first_name || ', '  ||last_name Nombre FROM HR.Employees

--4. Realizar la pregunta anterior concatenando de una manera alterna.
SELECT employee_id, CONCAT(CONCAT(first_name, ', '), last_name) AS nombre FROM HR.Employees;

/*5. Mostrar el código, salario y nombre del empelado. Adicionalmente Mostar un 
proyección de la comisión. Esto se compone del salario por la comisión. También 
realizar un cálculo de proyección con la comisión aumentada en un 10%. Los 
empleados sin comisión deben presentar 0 en las proyecciones.
*/
SELECT 
    employee_id, 
    first_name || ' ' || last_name AS nombre, 
    salary, 
    COALESCE(commission_pct, 0) AS commission_pct,
    salary * COALESCE(commission_pct, 0) AS proyeccion_comision,
    CASE 
        WHEN commission_pct IS NOT NULL THEN salary * (COALESCE(commission_pct, 0) + 0.1)
        ELSE 0 
    END AS proyeccion_aumentada
FROM HR.Employees;

/*6. Mostrar el contenido de la tabla de regiones con los encabezados de las columnas 
en español y el contenido de las columnas en mayúsculas.*/
select 
upper(state_province) provincia ,
upper(STREET_ADDRESS) Dirrecion ,
upper(CITY) Ciudad,
upper(STATE_PROVINCE) Provincia
from HR.locations

/*7. Mostrar los empleados del departamento 10.*/
select * from hr.employees
where department_id = 10

--8. Mostrar los empleados que no tienen jefe.
select * from hr.employees
where Manager_id is null

--9. Mostrar los empleados que no se les paga comisión.
select * from hr.employees
where COMMISSION_PCT is null

--10. Presentar los departamentos cuyo código es menor de 500.
select * from hr.departments
where department_id < 500

--11. Mostrar el nombre del departamento y la tercera letra del nombre.
SELECT department_name, SUBSTR(department_name, 3, 1) 
    AS tercera_letra FROM hr.departments;

--12. Mostar el nombre del departamento y la longitud de este. 
SELECT department_name, LENGTH(department_name) AS longitud FROM hr.departments;

--13. Presente nuevamente el resultado anterior pero ordenado por la longitud.
SELECT department_name, LENGTH(department_name) AS longitud 
FROM hr.departments 
ORDER BY longitud;

--14. Mostar el código del departamento y el nombre, así como el contenido del nombre hasta la posición que corresponda a la línea desplegada.
SELECT department_id, department_name, 
SUBSTR(department_name, 1, LENGTH(department_name)) AS nombre_hasta_pos 
FROM hr.departments;

/*15. Se necesita generar un archivo de datos del contenido de la tabla de empleados. 
Este archivo es de tamaño fijo, por lo que debe de rellenar los campos numéricos 
con ceros a la derecha y los de texto con espacios a la derecha. La longitud de los 
campos en el archivo es la misma que tienen en la tabla.*/
SELECT LPAD(employee_id, 10, '0') || RPAD(first_name, 20) || RPAD(last_name, 20) || TO_CHAR(salary, '0000000.00') || RPAD(job_id, 10) 
FROM hr.employees;

/*16. Mostrar los diferentes títulos de trabajos(tabla jobs), de las siguientes manera: 
todo en mayúscula, todo en minúscula, y las primeras 5 posiciones del nombre.*/

-- Todo en mayúscula
SELECT UPPER(job_title) AS Mayusculas FROM hr.jobs;

-- Todo en minúscula
SELECT LOWER(job_title) AS minuscula FROM hr.jobs;

-- Las primeras 5 posiciones del nombre
SELECT SUBSTR(job_title, 1, 5) AS sbtr FROM hr.jobs;

/*17. Presentar la información de los nombres y apellidos de los empleados. Las 
vocales del nombre se deben sustituir por * y las de los apellidos por @.*/
SELECT 
    REPLACE(REPLACE(first_name, 'a', '*'), 'e', '*') AS nombre_modificado,
    REPLACE(REPLACE(last_name, 'a', '@'), 'e', '@') AS apellido_modificado
FROM hr.employees;

/*18. Presentar la cantidad de días, y la cantidad de meses que tienen laborando los 
empleados de la empresa.*/
SELECT 
    employee_id,
    FLOOR(MONTHS_BETWEEN(SYSDATE, hire_date) / 30) AS dias_trabajados,
    FLOOR(MONTHS_BETWEEN(SYSDATE, hire_date)) AS meses_trabajados
FROM hr.employees;

/*19. Presentar el empleado y su salario. El salario debe ser rellenado de # a la derecha y colocarle el símbolo de pesos. En total se deben presentar 20 posiciones en todos los casos.*/
SELECT employee_id, RPAD(TO_CHAR(salary, '99999.99') || '$', 20, '#') AS salario_formateado FROM hr.employees;

--20. Mostrar los empleados, y el nombre del departamento en el que laboran.
SELECT e.employee_id, e.first_name, e.last_name, d.department_name
FROM hr.employees e
JOIN hr.departments d ON e.department_id = d.department_id;

/*21. Repetir el ejercicio anterior, pero en este caso los departamentos sin empleados 
deben mostrarse.*/
SELECT e.employee_id, e.first_name, e.last_name, COALESCE(d.department_name, 'Sin departamento') AS department_name
FROM hr.employees e
LEFT JOIN hr.departments d ON e.department_id = d.department_id;

--22. Modificar este ejercicio para agregar la información de las localidades. Se quiere ver el nombre de estas.
SELECT e.employee_id, e.first_name, e.last_name, COALESCE(d.department_name, 'Sin departamento') AS department_name, l.city AS localidad
FROM hr.employees e
LEFT JOIN hr.departments d ON e.department_id = d.department_id
LEFT JOIN hr.locations l ON d.location_id = l.location_id;

/*23. Mostrar el empleado, su fecha de contratación y su fecha de evaluación. Se 
supone que esta se realiza seis meses después de su contratación.*/
SELECT employee_id, hire_date, ADD_MONTHS(hire_date, 6) AS fecha_evaluacion
FROM hr.employees;

--24. Determinar el promedio de salario por departamento, así como el máximo salario pagado y el mínimo.
SELECT 
    department_id,
    AVG(salary) AS salario_promedio,
    MAX(salary) AS salario_maximo,
    MIN(salary) AS salario_minimo
FROM hr.employees
GROUP BY department_id;

--25. Indicar el código y nombre o nombres de los empleados que ganan mas dinero por departamento. 
SELECT 
    e.employee_id,
    e.first_name,
    e.last_name,
    e.salary,
    d.department_name
FROM hr.employees e
JOIN hr.departments d ON e.department_id = d.department_id
WHERE (e.department_id, e.salary) IN (
    SELECT e.department_id, MAX(e.salary)
    FROM hr.employees e
    GROUP BY e.department_id
);

--26. Presentar el nombre del departamento, su código y el total de salario ganado por los empleados de este.
SELECT 
    d.department_name,
    d.department_id,
    SUM(e.salary) AS total_salario
FROM hr.departments d
JOIN hr.employees e ON d.department_id = e.department_id
GROUP BY d.department_name, d.department_id;

--27. Determinar el promedio de salario por localidad.
SELECT 
    l.city AS localidad,
    AVG(e.salary) AS promedio_salario
FROM hr.employees e
JOIN hr.departments d ON e.department_id = d.department_id
JOIN hr.locations l ON d.location_id = l.location_id
GROUP BY l.city;

--28. Determinar el empleado que mas veces ha cambiado de trabajo. Auxiliarse de la tabla Job History.
SELECT 
    e.employee_id,
    e.first_name,
    e.last_name,
    COUNT(*) AS cambios_trabajo
FROM hr.employees e
JOIN hr.job_history jh ON e.employee_id = jh.employee_id
GROUP BY e.employee_id, e.first_name, e.last_name
ORDER BY COUNT(*) DESC
FETCH FIRST ROW ONLY;

--29. Determinar la cantidad de empleados que existen por el tipo de labor que 
desempeñan.
SELECT 
    job_id,
    COUNT(*) AS cantidad_empleados
FROM hr.employees
GROUP BY job_id;

--30. Indicar el nombre del empleado cuya longitud de nombre es la mayor.
SELECT 
    first_name || ' ' || last_name AS nombre_completo
FROM hr.employees
ORDER BY LENGTH(first_name) + LENGTH(last_name) DESC
FETCH FIRST ROW ONLY;

/*31. Crear una salida en formato de matriz que muestre la información de los 
empleados por departamento y el rango de salario salario que ganan. Tenemos 
tres rangos de 1 a 3000, de 3000 a 4999 y de 5000 o más. La salida sería algo así.
Departamento Rango 1 a 3000 Rango 3000 a 4999 De 5000 o masIT 3 1 0
Sales 0 1 30 nota: Los valores anteriores no son reales, solamente iustran como se quiere la salida. */
SELECT 
    department_name AS "Departamento",
    SUM(CASE WHEN salary BETWEEN 1 AND 3000 THEN 1 ELSE 0 END) AS "Rango 1 a 3000",
    SUM(CASE WHEN salary BETWEEN 3001 AND 4999 THEN 1 ELSE 0 END) AS "Rango 3000 a 4999",
    SUM(CASE WHEN salary >= 5000 THEN 1 ELSE 0 END) AS "De 5000 o más"
FROM hr.employees
JOIN hr.departments ON employees.department_id = departments.department_id
GROUP BY department_name;

/*32. Mostrar el nombre del departamento y la cantidad de empleados por 
departamento, así como el máximo y mínimo salario.*/
SELECT 
    d.department_name,
    COUNT(e.employee_id) AS cantidad_empleados,
    MAX(e.salary) AS max_salario,
    MIN(e.salary) AS min_salario
FROM hr.departments d
LEFT JOIN hr.employees e ON d.department_id = e.department_id
GROUP BY d.department_name;

--33. Encontrar la cantidad de empleados por región
SELECT 
    c.region_id,
    COUNT(e.employee_id) AS cantidad_empleados
FROM hr.employees e
JOIN hr.departments d ON e.department_id = d.department_id
JOIN hr.locations l ON d.location_id = l.location_id
JOIN hr.countries c ON l.country_id = c.country_id
GROUP BY c.region_id;

/*34. Mostrar la fecha del día, presentando el nombre del día y del mes en vez de los 
números. */
SELECT 
    TO_CHAR(SYSDATE, 'Day, DD Month YYYY') AS fecha_actual
FROM dual;

/*35. Mostrar los empleados que ganan mas que el promedio de salario del 
departamento en que laboran.*/
SELECT 
    e.employee_id,
    e.first_name,
    e.last_name,
    e.salary,
    d.department_name
FROM hr.employees e
JOIN hr.departments d ON e.department_id = d.department_id
WHERE e.salary > (SELECT AVG(salary) FROM hr.employees WHERE department_id = e.department_id);

--36. Indicar los empleados que ganan menos de 1/3 del salario que gana King
SELECT 
    e.employee_id,
    e.first_name,
    e.last_name,
    e.salary
FROM hr.employees e
JOIN hr.employees king ON king.first_name = 'King' AND king.last_name = e.last_name
WHERE e.salary < king.salary / 3;

--37. Mostrar el nombre del empleado, su código, salario y el nombre del departamento en que labora utilizando subconsultas.
SELECT 
    e.employee_id,
    e.first_name || ' ' || e.last_name AS nombre_completo,
    e.salary,
    (SELECT department_name FROM hr.departments WHERE department_id = e.department_id) AS nombre_departamento
FROM hr.employees e;


/*40. Desplegar el nombre salario, nombre, apellido y codigo de los empleados. 
Adicionalmente mostrar la cantidad de dinero que gana representado con un 
grupo de signos de pesos a la derecha del salario, cada 100 en salario representan 
un signo de pesos. */
SELECT 
    first_name || ' ' || last_name AS nombre_completo,
    salary || LPAD('$', salary / 100, '$') AS salario_con_signos,
    employee_id
FROM hr.employees
ORDER BY salary ASC;

/*41. Crear la tabla Emp_dept_loc con la información correspondiente a el código, 
nombre, apellido, salario, nombre del deprtamento que trabaja, y nombre de la 
ciudad, en que labora el empleado.*/
CREATE TABLE Emp_dept_loc AS
SELECT 
    e.employee_id AS codigo,
    e.first_name AS nombre,
    e.last_name AS apellido,
    e.salary,
    d.department_name AS nombre_departamento,
    l.city AS nombre_ciudad
FROM hr.employees e
JOIN hr.departments d ON e.department_id = d.department_id
JOIN hr.locations l ON d.location_id = l.location_id;
select * from Emp_dept_loc

/*42. Agregue una columna a la tabla anterior llamada Full_name que sea varchar2 de 60. Llenar esta columna con la información resultante de concatenar el nombre un espacio y el apellido.*/
ALTER TABLE Emp_dept_loc
ADD Full_name VARCHAR2(60);
UPDATE Emp_dept_loc
SET Full_name = nombre || ' ' || apellido;

--43. Agregar una columna llamada hire_date a la tabla, Emp_dept_loc. 
ALTER TABLE Emp_dept_loc
ADD hire_date DATE;

--44. Actualizar la columna hire_date, con la información de la columna hire_date de la tabla de empleados (employees).
UPDATE Emp_dept_loc edl
SET edl.hire_date = (
    SELECT e.hire_date
    FROM hr.employees e
    WHERE e.employee_id = edl.codigo
);

/*45. Agregue un nuevo empleado a la tabla emp_dept_loc. Coloque la información 
relacionada a usted para completar los datos, para el codigo de empelado, utilice 
9999 y la fecha de contratación con la fecha de sistema.*/
INSERT INTO Emp_dept_loc (codigo, nombre, apellido, salary, nombre_departamento, nombre_ciudad, Full_name, hire_date)
VALUES (9999, 'Milton', 'Garcia', 2000, 'IT', 'Santo Domingo', 'Milton Garcia', SYSDATE);

--46. Actualice el empleado creado y colóquele un aumento de un 20%.
UPDATE Emp_dept_loc
SET salary = salary * 1.20
WHERE codigo = 9999;

--47. Elimine el empleado creado en la pregunta 45.
DELETE FROM Emp_dept_loc
WHERE codigo = 9999;


/*48. Cree una nueva tabla llamada emp_dept_loc2, con la información de la tabla de emp_dept_loc, pero solamente para los empleado que ganan menos del promedio de salario de la empresa.*/
CREATE TABLE emp_dept_loc2 AS
SELECT *
FROM Emp_dept_loc
WHERE salary < (SELECT AVG(salary) FROM Emp_dept_loc);

/*49. Actualice la tabla emp_dept_loc2 y coloque el apellido y nombre todo en 
minúscula.*/
UPDATE emp_dept_loc2
SET nombre = LOWER(nombre),
    apellido = LOWER(apellido);

/*50. Actualice la información de emp_dept_loc2 usando como fuente emp_dept_loc. 
Para esto utilice el comando merge. Solamente actualice la información del 
nombre y agregue los empleados que no existen en emp_dept_loc. Verifique que 
fuesen exitosas las actualizaciones.*/
MERGE INTO emp_dept_loc2 edl2
USING (
    SELECT 
        e.employee_id AS codigo,
        e.first_name AS nombre,
        e.last_name AS apellido,
        e.salary,
        d.department_name AS nombre_departamento,
        l.city AS nombre_ciudad,
        e.first_name || ' ' || e.last_name AS full_name,
        e.hire_date
    FROM hr.employees e
    JOIN hr.departments d ON e.department_id = d.department_id
    JOIN hr.locations l ON d.location_id = l.location_id
) edl1
ON (edl2.codigo = edl1.codigo)
WHEN MATCHED THEN
    UPDATE SET 
        edl2.nombre = edl1.nombre,
        edl2.apellido = edl1.apellido,
        edl2.salary = edl1.salary,
        edl2.nombre_departamento = edl1.nombre_departamento,
        edl2.nombre_ciudad = edl1.nombre_ciudad,
        edl2.full_name = edl1.full_name,
        edl2.hire_date = edl1.hire_date
WHEN NOT MATCHED THEN
    INSERT (codigo, nombre, apellido, salary, nombre_departamento, nombre_ciudad, Full_name, hire_date)
    VALUES (edl1.codigo, edl1.nombre, edl1.apellido, edl1.salary, edl1.nombre_departamento, edl1.nombre_ciudad, edl1.full_name, edl1.hire_date);

/*51. Presentar la siguiente salida, haciendo una consulta sobre la tabla emp_dept_loc.
El empleado NOMBRE_COMPLETO labora en la empresa desde el 
FECHA_CONTRATACION y gana un sueldo de SALARIO. En donde 
Nombre_completo, FECHA_CONTRATACION y SALARIO son columnas de la 
tabla.*/
SELECT 
    'El empleado ' || Full_name || ' labora en la empresa desde el ' || TO_CHAR(hire_date, 'DD-MON-YYYY') || ' y gana un sueldo de ' || salary || ' dólares.' AS salida
FROM emp_dept_loc;

--52. Eliminar la tabla emp_dept_loc2 de la base de datos.
DROP TABLE emp_dept_loc2;

/*53. Crear una vista llamada emp_dept_loc2, con la información correspondiente a el código, nombre, apellido, salario, nombre del departamento que trabaja, y nombre de la ciudad, en que labora el empleado.*/
CREATE VIEW emp_dept_loc2 AS
SELECT 
    codigo,
    nombre,
    apellido,
    salary,
    nombre_departamento,
    nombre_ciudad
FROM Emp_dept_loc;

/*55. Realice una consulta en la cual se muestre la estructura jerárquica de la empresa. 
Recuerde que el campo manager_id, muestra el código de empleado de mi jefe. 
La información debe mostrarse indentada atendiendo a la jerarquía del empleado, 
mientras jerárquicamente mas abajo se encuentre, mayor indentacion tiene.*/
SELECT LPAD(' ', 2 * (LEVEL - 1)) || first_name || ' ' || last_name AS nombre_completo
FROM hr.employees
START WITH manager_id IS NULL
CONNECT BY PRIOR employee_id = manager_id
ORDER BY LEVEL, employee_id;
