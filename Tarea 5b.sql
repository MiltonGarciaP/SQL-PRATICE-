select *
from hr.employees




-- 1 pregunta 
select table_name 
from all_tables
where table_name like 'JO%' ;

-- 2 pregunta
select SUBSTR (first_name,1,1) ||'. '|| last_name as "Nombre de empleado"
from hr.employees ;

-- 3 Pregunta
select first_name ||' '|| last_name as "Nombre del empleado", email || 'IN' as "Correo electrónico"
from hr.employees ;

-- 4 Pregunta
select min (last_name)as "Apellido Minimo", max(last_name) as "Apellido Maximo"
from hr.employees ;

-- 5 Pregunta
select TO_CHAR(salary, '$9999.99') as salario
from hr.employees
where salary BETWEEN 700 AND 3000 ;

-- 6  Pregunta
select e.first_name as "Primer nombre", j.job_title as "Profesión del trabajo"
from hr.employees e
inner join hr.jobs j on e.job_id = j.job_id ;

-- 7 Pregunta
select e.first_name as "Primer Nombre", j.job_title as "Profesión del trabajo" , e.salary as "Salario"
from hr.employees e 
inner join hr.jobs j 
on e.job_id = j.job_id ;

-- 8 Pregunta
select substr (first_name, 1,1 ) || ' ' || last_name as "Nombre de empleado", d.department_name as Departamento
from hr.employees e
natural join hr.departments d;

-- 9 Pregunta
select substr (first_name, 1,1 ) || ' ' || last_name as "Nombre de empleado", job_id as Departamento
from hr.employees e , hr.departments d
where e.department_id = d.department_id ;


-- 10 Pregunta 
select last_name as Apellido , nvl2(manager_id, 'Yes', 'No' ) as commission
from hr.employees ;

-- 11 Pregunta
select substr (first_name, 1,1 ) || ' ' || last_name as "Nombre de empleado", salary as "Salario", (case when commission_pct is null then 'no' else 'yes' end) as Comisión
from hr.employees;

-- 12 Pregunta
select e.last_name as Apellido , d.department_name as "Departamento", l.city as Ciudad , l .state_province as "Estado o Provincia"
from hr. departments d
inner join hr.locations l
on d.location_id = l.location_id
inner join hr.employees e
on e.department_id = d.department_id ;

-- 13 Pregunta
select first_name as Nombre, last_name as Apellido , coalesce (commission_pct,manager_id ,-1) as Comisión
from hr.employees ;

-- 14 Pregunta
select e.last_name as Apellido ,e.salary as Salario , j.job_title as Profesión
from hr.employees e 
inner join hr.jobs j
on e.job_id = j.job_id
group by e.last_name, e.salary, j.job_title ;

-- 15 pregunta
select e.last_name, d.department_name
from hr.employees e
inner join hr.departments d
on e.department_id = d.department_id ;
 

-- 16 pregunta
select min (hire_date) as lowest , max (hire_date) as higest, count (employee_id) as "Numero de empleados"
from hr.employees ;

-- 17 pregunta 
select d.department_name as "Departamento" , e.salary as "Salario" 
from hr.departments d
inner join hr.employees e
on e.department_id = d.department_id
where salary between 0 and 100000
order by salary desc ;

-- 18 pregunta 
select distinct d.manager_id as "Id del manager", d.department_name as Departamento, e.last_name as "Apellido del Manager"
from hr.departments d
inner join hr.employees e 
on e.manager_id = d.manager_id ;

-- 19 Preguntas
select d.department_name as "Nombre del departamento", d.manager_id as "ID del Manager", e.Last_Name as "Apellido del Manager", 
avg(e.salary) as "Average del departamento"
from hr.departments d 
inner join hr.employees e 
on e.department_id = d.department_id
GROUP BY d.department_name, d.manager_id, e.Last_Name

-- 20 Preguntas
Select sum (salary) as "Salario", d.department_name as "Nombre del departamento"
from hr.employees e
inner join hr.departments d 
on e.department_id = d.department_id 
group by department_name ;


-- 21 Preguntas 
select d.department_name as "Nombre del Departamento", sum(e.salary ) as salario
from hr.employees e
inner join hr.departments d
on e.department_id = d.department_id
inner join hr.jobs j 
on e.job_id = j.job_id
group by d.department_name , j.job_id ;

-- 22 Preguntas 
select d.department_name as "Nombre del departamento", j.job_id as "Id Trabajo", sum (e.salary) as "Costo Mensual"
from hr.employees e
inner join hr.departments d 
on e.department_id = d.department_id
inner join hr.jobs j 
on e.job_id = j.job_id
group by d.department_name , j.job_id ;


-- 23 Preguntas 
select d.department_name as "Nombre del departamento", j.job_id as "Id del trabajo", c.city as "Ciudad" , sum (e.salary) as Salario
from hr.employees e
inner join hr.departments d
on e.department_id = d.department_id
inner join hr.jobs j
on e.job_id = j.job_id
inner join hr.locations c
on d.location_id = c.location_id
group by d.department_name , j.job_id , c.city ;

-- 24´Preguntas 
select d.department_name as "Nombre del Departamento", e.salary as Salario
from hr.departments d
inner join hr.employees e 
on e.department_id = d.department_id ;

-- 25 Preguntas 
select substr (e.first_name,1,1) || ' ' || e.last_name as "Nombre de empleado" , d.department_id as "Id del departamento" , d.department_name as "Nombre del departamento", l.city as ciudad
from hr.departments d
inner join hr.locations l
on d.location_id = l.location_id
inner join hr.employees e
on e.department_id = d.department_id

-- 26 Preguntas 
select substr (first_name,1,1) || ' ' || last_name as "Nombre de empleado ", 
e.salary as Salario, d.department_name as "Nombre de departamento"
from hr.employees e 
inner join hr.departments d 
on e.department_id = d.department_id;




