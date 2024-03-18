
--Primera preguta 
select  (first_name|| ' ' ||last_name)as "Nombre", replace(phone_number,'.','-') as "Numero de telefono",TRUNC(hire_date, 'MM') as hire_date, department_id
from hr.employees 
where department_id = '100';

--Segunda pregunta
select upper(CITY)as "Ciudad", replace ('US','US','EE.UU') as "Nuevo Codigo"
from hr.locations
where city  not like '%o%' and State_province is not  null ;

--Tercera Pregunta
SELECT last_name as "apellido" , salary /3 as "salario"
 FROM hr.employees 
 WHERE MOD  (salary, 3) = 0;
 
--Cuarta Pregunta
SELECT INSTR ('Oracle Internet Academy', 'I' ) as "Posicion de la I" 
FROM dual;

-- Quinta Pregunta
SELECT REPLACE(RPAD(LPAD('Oracle Internet Academy', 27, '*'),31,'*'),' ', '****') AS "Resultado"
FROM DUAL;

-- Sexta  Pregunta 
SELECT LENGTH('Oracle Internet Academy')AS "Tamaño de la palabra" 
FROM DUAL;

--Septima Pregunta
SELECT last_name as "Apellido", salary /5 as "Nuevo Salario"
 FROM hr.employees 
WHERE MOD  (salary, 5) = 0;

--Octava Pregunta
SELECT  start_date as "Dia de inicio",  end_date as "Renuncias ", trunc ( (end_date - start_date)/365) as Años
FROM job_history;

-- Novena Pregunta
select *
from hr.employees
where substr(hire_date,4,2)= :mes_entrada

--Decima Pregunta 
SELECT (first_name|| ' ' || last_name)as "Nombre", salary, ROUND(salary / 1.55, 2) as "Nuevo salario"
FROM employees 
WHERE employee_id BETWEEN 100 AND 102;

--Onceava Pregunta
select (first_name|| ' ' || last_name) as Nombre , manager_id as "Id del Manager", commission_pct * 100 "Porcentaje de comision",
coalesce (manager_id,commission_pct,99999)"Nuevo"
from hr.employees
where department_id in (80,90);

--Doceava Pregunta
select (first_name|| ' ' || last_name)"Nombre completo",
to_char (salary, '999,999.99$')"Sueldo anterior",
to_char (salary + 3000,'999,999,999.99')"Nuevo salario"
from hr.employees
where first_name = 'Valli';

-- Trece Pregunta
select (first_name|| ' ' || last_name) as "Nombre y Apeliido", hire_date "Fecha de contraracion"
from hr.employees;

-- Catorce Pregunta
select (first_name|| ' ' || last_name) as "Nombre y Apeliido" , nvl2(nullif (to_char(hire_date,'mm'),'01'),hire_date,null)"Contratación"
from hr.employees;

-- Quince pregunta
select (first_name|| ' ' || last_name) as "Nombre y Apellido", job_id as "Id de puesto de trabajo",
DECODE (JOB_id,
'AD_PRES','A',
'ST_MAN' ,'B',
'SAP_REP','C',
'ST_CLERK','D',
'IT_PROG','E',0
)as "Grade"
from hr.employees





)

