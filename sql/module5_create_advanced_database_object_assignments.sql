#CREATE FUNCTIONS
DELIMITER //
CREATE FUNCTION UpperCast(text varchar(250)) RETURNS varchar(250) deterministic
BEGIN
  RETURN upper(text);
END 
// DELIMITER ;
Select UpperCast(first_name) from employee;


#CREATE TRIGGERS
DELIMITER //
CREATE TRIGGER onEmplyeeInsertDispayAllEmployeeTrigger AFTER INSERT ON employee FOR EACH ROW
BEGIN
	insert into employee_audit(createDate) values(SYSDATE());
END;
// DELIMITER ;


#CREATE AND EXECUTE STORED PROCEDURES
DELIMITER //
CREATE PROCEDURE getAllEmployeeStartsWithS()
select * from employee where first_name like 'S%';
// DELIMITER ;

call getAllEmployeeStartsWithS();