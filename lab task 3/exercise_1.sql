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
-- select * from employee;



-- Write a PL/SQL block using a user-defined cursor to fetch the name and salary from  the employee table and print the total number of rows fetched. 

declare
   v_eid employee.e_id%type;
   v_name   employee.name%type;
   v_salary employee.salary%type;
cursor c_employee is
select e_id, name, salary from employee ;
BEGIN
open c_employee;
loop
fetch c_employee into v_eid, v_name, v_salary;
exit when c_employee%notfound;
dbms_output.put_line('E_ID: ' || v_eid || ' Name: '|| v_name || ' Salary: ' || v_salary);
end loop;
dbms_output.put_line('Total rows fetched: ' || c_employee%rowcount);
close c_employee;
end;



-- Write a PL/SQL program using an explicit cursor that retrieves all rows from the  EMPLOYEE table and checks each employee’s salary. If an employee's salary is less  than 7000, increase it by 500 using an UPDATE statement with a proper WHERE clause to ensure only the matching row is updated. For each row processed, display a  message using DBMS_OUTPUT.PUT_LINE indicating whether the salary was  updated or not, based on the condition. The program should use cursor control  statements (OPEN, FETCH, EXIT WHEN, CLOSE) and conditional logic inside a  loop to handle per-row processing. 
declare v_eid employee.e_id % type;
v_name employee.name % type;
v_salary employee.salary % type;
cursor c_employee is
select
    e_id,
    name,
    salary
from
    employee;
begin open c_employee;
loop fetch c_employee into v_eid,
v_name,
v_salary;
exit when c_employee % notfound;
if v_salary < 5500 then
update employee
set
    salary = salary + 500
where
    e_id = v_eid;
dbms_output.put_line (
    'E_ID: ' || v_eid || ' Name: ' || v_name || ' Salary: ' || v_salary || ' -> Updated Salary'
);
else dbms_output.put_line (
    'E_ID: ' || v_eid || ' Name: ' || v_name || ' Salary: ' || v_salary || ' -> No Update'
);
end if;
end
loop;
dbms_output.put_line ('Total rows processed: ' || c_employee % rowcount);
close c_employee;
end;

select * from employee;