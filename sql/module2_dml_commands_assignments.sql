INSERT INTO employee (Emp_id, First_Name, Last_Name, mgr_id, depno, salary) VALUES (1009, 'Ricky', 'Lawrence', 1005, 40, 50000);

DELETE FROM employee WHERE salary >= 40000;

UPDATE employee SET First_Name='Peter', Last_Name='John' WHERE Emp_Id=1009 AND mgr_id=1005;

SELECT * FROM employee WHERE Last_Name LIKE 'B%' OR Last_Name LIKE 'F%';