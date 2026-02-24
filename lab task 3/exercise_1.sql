
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