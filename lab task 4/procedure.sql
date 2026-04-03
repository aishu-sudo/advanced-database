
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


-- CREATE OR REPLACE PROCEDURE welcome
-- IS
-- BEGIN
--     DBMS_OUTPUT.PUT_LINE('Welcome to Oracle Database!');
-- END;

-- Procedure with Input Parameters
-- CREATE OR REPLACE PROCEDURE INSERT_EMPLOYEE
-- (E_ID IN NUMBER, NAME IN VARCHAR2, SALARY IN NUMBER)
-- IS
-- BEGIN
-- INSERT INTO EMPLOYEE VALUES(E_ID, NAME, SALARY);
-- END;

--Procedure with OUT Parameter
--Write a PL/SQL procedure update_emp that increases the salary of an
--employee and returns the updated salary using an OUT parameter.
CREATE or REPLACE PROCEDURE update_emp(
ID IN NUMBER, NEW_SALARY IN NUMBER, d out NUMBER)
IS
BEGIN
UPDATE EMPLOYEE
set salary= salary + amount;
where e_id = ID;
select salary into d
from employee
where e_id = ID;
dbms_output.put_line('Updated Salary: ' || d);
END update_emp;
)
/