
--trigger

-- CREATE TABLE backup_emp (
--     e_id NUMBER PRIMARY KEY,
--     name VARCHAR2(50),
--     salary NUMBER
-- );

-- DROP TABLE employee;
-- CREATE TABLE EMPLOYEE (
--   E_ID NUMBER PRIMARY KEY,
--   NAME VARCHAR2(50),
--   SALARY NUMBER
-- );

-- INSERT INTO EMPLOYEE VALUES (1, 'Aishu', 50000);
-- INSERT INTO EMPLOYEE VALUES (2, 'Rahim', 60000);
-- INSERT INTO EMPLOYEE VALUES (3, 'Sita', 55000);
-- INSERT INTO EMPLOYEE VALUES (4, 'Gopal', 45000);



-- DELETE FROM EMPLOYEE WHERE E_ID = 2;

--Create a trigger T1 on the EMPLOYEE table that takes a backup of the deleted row into the BACKUP_EMP table before a DELETE operation. 
-- CREATE or REPLACE  TRIGGER t1
-- BEFORE delete ON EMPLOYEE
-- for each ROW
-- BEGIN
-- INSERT INTO backup_emp VALUES(:OLD.e_id, :OLD.name, :OLD.salary);
-- END t1;


--Create a trigger t2 that inserts a row into the BACKUP_EMP table after a new row is inserted into the EMPLOYEE table.

-- DELETE FROM BACKUP_EMP;

-- CREATE or REPLACE TRIGGER t2
-- AFTER insert ON EMPLOYEE
-- for each ROW
-- begin
-- INSERT INTO backup_emp VALUES(:NEW.e_id, :NEW.name, :NEW.salary);
-- end;
-- /

-- insert into employee values (5, 'Mohan', 70000);

-- SELECT * FROM EMPLOYEE;
-- select * from backup_emp;

-- ALTER TABLE backup_emp ADD(
--     deleted_at DATE,
--     deleted_by VARCHAR2(50)
-- );

-- CREATE OR REPLACE TRIGGER T3
-- BEFORE DELETE ON EMPLOYEE
-- FOR EACH ROW
-- BEGIN
--  INSERT INTO BACKUP_EMP
--  VALUES (:OLD.E_ID, :OLD.NAME, :OLD.SALARY, SYSDATE, USER);
-- END;
-- /

-- DROP TRIGGER T1;

-- delete from employee where e_id = 3;
select * from backup_emp;