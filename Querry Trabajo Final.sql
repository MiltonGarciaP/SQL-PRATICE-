
-- 1 Pregunta
CREATE TABLE emp AS SELECT * FROM employees; 
CREATE TABLE dept AS SELECT * FROM departments;

-- 2 Pregunta
select userCons.constraint_name, userCons.constraint_type, 
userConsCol.column_name, userConsCol.position
from 
user_constraints userCons full join user_cons_columns userConsCol
on userCons.owner = userConsCol.owner
where userCons.table_name = 'JOB_HISTORY' and userConsCol.position is not null;

-- 3 Pregunta 
alter table emp
add constraint emp_employee_id_pk primary key (employee_id);

-- 4 Pregunta
alter table dept 
add constraint dept_department_id_pk primary key (department_id);

-- 5 Pregunta 
alter table emp add constraint emp_dept_department_id_fk foreign key (department_id)
references dept (department_id) on delete cascade;

-- (A)6 Pregunta 
select count (*) as "Ejemplo"
from emp 

-- (B)6 Pregunta
delete dept 
where department_id = 10;

--(C)6 Pregunta
SELECT COUNT(*) as "Todos" FROM emp;

-- 7 Pregunta 
WITH avg_sal_by_dept AS
(SELECT NVL(department_id, -1) dpt_id, AVG(NVL(salary,0)) avg_sal FROM 
employees
GROUP BY NVL(department_id, -1))
SELECT emp.last_name "Apellido", TO_CHAR(ROUND(emp.salary,2),'$999999.99') 
"Salario", CASE WHEN avgqry.dpt_id = -1 THEN NULL ELSE avgqry.dpt_id END 
"Numero del Departamento", TO_CHAR(ROUND(avgqry.avg_sal,2),'$999999.99') "Average del Salario"
FROM employees emp INNER JOIN (SELECT * FROM avg_sal_by_dept) avgqry ON 
NVL(emp.department_id, -1) = avgqry.dpt_id
WHERE emp.salary > avgqry.avg_sal;


-- 8 Pregunta 
CREATE OR REPLACE VIEW v2 ("Salario mas Alto", "Salario mas Bajo", "Average del Salario", 
"Nombre del Departamento") AS
SELECT 
TO_CHAR(ROUND(MAX(NVL(emp.salary,0)),2),'$999999.99'),
TO_CHAR(ROUND(MIN(NVL(emp.salary,0)),2),'$999999.99'),
TO_CHAR(ROUND(AVG(NVL(emp.salary,0)),2),'$999999.99'), dpt.department_name
FROM departments dpt LEFT OUTER JOIN employees emp ON dpt.department_id = 
emp.department_id
GROUP BY (dpt.department_id, dpt.department_name);

SELECT * FROM v2;



-- 9 Pregunta
CREATE OR REPLACE view Dept_Managers_view 
as select d.department_name dept_name, substr(e.first_name,0,1)||' '|| e.last_name 
mgr_name
from departments d
inner join employees e
on d.department_id = e.department_id
where e.employee_id = d.manager_id;

SELECT * FROM Dept_Managers_view;

-- 10 Pregunta 
drop view v2

--(A) 11 Pregunta
CREATE SEQUENCE ct_seq;
SELECT ct_seq.currval
FROM dual;

--(B) 11 Pregunta
CREATE SEQUENCE ct_seq;
SELECT ct_seq.nextval, ct_seq.currval
FROM dual;

-- 12 Pregunta 
INSERT INTO emp
(employee_id,first_name,last_name,email,phone_number,
hire_date,job_id,salary,commission_pct,manager_id,department_id)
VALUES
(ct_seq.nextval,'Kaare','Hansen','KHANSEN','44965 832123',sysdate,
'Manager',6500,null,100,20)

-- 13 Pregunta 
CREATE INDEX EMP_INDEX 
ON EMP(employee_id DESC, UPPER(SUBSTR("FIRST_NAME",1,1)||' 
'||"LAST_NAME"));

-- 14 Pregunta 
select table_name
from dictionary 
where table_name like '%PRIV%';

-- 15 Pregunta


GRANT SELECT ON emp TO PUBLIC;

-- 16 Pregunta
select e.employee_id as "Id del Empleado" , d.department_name as "Nombre del Departamento"
from employees e  , departments d ;

-- 17 Pregunta 
select e.employee_id as "Id del Empleado"  , d.department_name as "Nombre del Departamento"
from employees e , departments d
where e.department_id = d.department_id;

-- 18 Pregunta y 19 pregunta 
SELECT e.last_name as "Apellido" , d.department_name as "Nombre del Departamento" , e.salary as "Salario", c.country_name as "Nombre del Pais"
FROM employees e, departments d, countries c;







