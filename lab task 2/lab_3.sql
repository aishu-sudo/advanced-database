
-- Create Table:
-- drop table employee;

-- create table employee (
--    e_id   number primary key,
--    name   varchar2(50),
--    salary number
-- );

-- insert into employee values (1, 'John Doe', 5000);
-- insert into employee values (2, 'Jane Smith', 6000);
-- insert into employee values (3, 'Alice Johnson', 5500);
-- insert into employee values (4, 'Bob Brown', 4500);


-- --Write a PL/SQL block that increases the salary by 500 for all employees whose salary
-- is less than 5000. Print the number of rows updated using SQL%ROWCOUNT.
-- (using implicit cursor)

BEGIN
    UPDATE employee
    set salary =salary+500
    where salary < 5000;
    dbms_output.put_line('Rows updated: ' || SQL%ROWCOUNT);
END;

-- Using %TYPE, declare variables to hold Name and Salary. Write a PL/SQL block to
-- select the Name and Salary of an employee with E_ID = 2 into those variables and
-- print the values. (using implicit cursor)
DECLARE 
v_name employee.name%TYPE;
v_salary employee.salary%TYPE;
BEGIN
SELECT name,salary INTO v_name,v_salary
from employee
where e_id=2;
DBMS_OUTPUT.PUT_LINE('Name: ' || v_name || ' Salary: ' || v_salary);
END;

-- Write a PL/SQL block to increase the salary by 300 for employee ID 3. Use
-- SQL%FOUND to print whether the update succeeded or no record was found. (using
-- implicit cursor)
BEGIN
update employee
set salary=salary+300
where e_id=3;

IF SQL%found THEN
dbms_output.put_line('update succeeded.');
ELSE
dbms_output.put_line('record not found.');
END IF;
END;



-- Declare variables for Name and Salary using %TYPE. Write a PL/SQL block to
-- select employee details for E_ID = 10. Handle the NO_DATA_FOUND exception and
-- print “Employee not found”. (using implicit cursor)
declare
   v_name   employee.name%type;
   v_salary employee.salary%type;
begin
   select name,salary into v_name, v_salary
     from employee
    where e_id = 10;
   dbms_output.put_line('Name: '|| v_name || ' Salary: ' || v_salary);

EXCEPTION
when no_data_found THEN
dbms_output.put_line('employee not found');
end;



-- Write a PL/SQL block to delete an employee with E_ID = 100 from the employee
-- table. Use the SQL%NOTFOUND attribute to check whether any row was actually
-- deleted. (using implicit cursor)
BEGIN
DELETE from employee
where e_id=;

IF SQL%NOTFOUND THEN
        DBMS_OUTPUT.PUT_LINE('No employee found with ID 100');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Employee deleted successfully');
    END IF;
END;

select *
  from employee;