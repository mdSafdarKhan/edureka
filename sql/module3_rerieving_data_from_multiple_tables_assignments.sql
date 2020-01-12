select employee.first_name, employee.last_name, profiles.age, profiles.qualification from employee inner join profiles on employee.empId=profiles.empId;

select employee.first_name, employee.last_name, profiles.age, profiles.qualification from employee left join profiles on employee.empId=profiles.empId;

select employee.first_name, employee.last_name, profiles.age, profiles.qualification from employee right join profiles on employee.empId=profiles.empId;

#Since MySQL does not support full join
SELECT * FROM employee LEFT JOIN profiles ON employee.empId = profiles.empId UNION SELECT * FROM employee RIGHT JOIN profiles ON employee.empId = profiles.empId;

SELECT * FROM country_data AS table1 INNER JOIN country_data AS table2 ON table1.Year=table2.Year AND table2.Country='Turkey';