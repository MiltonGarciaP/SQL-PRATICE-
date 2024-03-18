SELECT
  EMPLOYEE_ID AS "EMP #",
  LAST_NAME AS "Empleado",
  JOB_ID AS "Cod_Trabajo",
  HIRE_DATE AS "Fecha de contratación"
FROM
  hr.EMPLOYEES
ORDER BY
  HIRE_DATE ASC;
