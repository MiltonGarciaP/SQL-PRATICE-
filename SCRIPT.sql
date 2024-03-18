SELECT 
EMPLOYEE_ID IDENTIFICACION_EMPLEADO, 
first_name Nombre,  
last_name Apellido,
email correo,
phone_number Celular,
hire_date fecha_contratacion,
job_id Puesto,
salary salario,
commission_pct comsion,
manager_id Encargado,
department_id Departamento
FROM hr.employees;

DESCRIBE hr.employees
DESCRIBE hr.departments

select 
DEPARTMENT_ID NUMERO_DEPARTAMENTO,       
DEPARTMENT_NAME Nombre_Departamento,
MANAGER_ID ID_ENCARGADO,                 
LOCATION_ID Localizacion
from hr.departments


