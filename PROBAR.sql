
Select *
from hr.employees




-- Primera Pregunta

select concat (first_name,last_name) as "Nombres de los Empleados"  
from hr.employees
where department_id = 110

-- Segunda Pregunta

select last_name,salary,department_id
from hr.employees 
where hire_Date BETWEEN '01/01/03' and '31/12/03'

-- Terecera Pregunta
select first_name as "Nombre",last_name as "Apellido" ,salary * 0.3 as "Nuevo salario" 
from hr.employees
where commission_pct is null

-- Cuarta Pregunta 
select salary - 500 as "Nuevo salario"
from hr.employees
where job_id != 'IT_PROG'

-- Quinta Pregunta
select DISTINCT JOB_ID as "Codigo trabajo", DEPARTMENT_ID as "ID del departamento"
from hr.employees
order by JOB_ID ASC

-- Sexta Pregunta
select First_Name as "Primer Nombre", salary as "Salario"
from HR.employees
where (department_id = 60) or (department_id = 80) or (commission_pct >=0.20)

-- Septima Pregunta
select Employee_id as "Codigo", First_Name as "Nombre", Last_name as "Apellido", salary as "Salario"
from hr.employees
where Last_name = ('Cambrault') or Last_name = ('Grant')
order by Hire_date

-- octava pregunta
select first_name as "Nombre", last_name as "apelldio" 
from  hr.employees
where department_id  is null


-- novena pregunta 
SELECT last_name as "Apellido", (salary +100) * .05+ salary as "Nuevo salario" FROM hr.employees


-- 13 pregunta 
select phone_number as "Telefono"
from hr.employees
where first_name = 'Alexander' and last_name = 'Khoo';

-- 14 preguntas
select manager_id as "Id del Manager"
from hr.employees

-- 15 preguntas
select distinct Manager_Id 
from hr.employees







