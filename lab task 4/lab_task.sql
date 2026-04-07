

-- CREATE TABLE students (
--     student_id NUMBER,
--     name VARCHAR2(50),
--     semester_fee NUMBER,
--     current_semester NUMBER,
--     dept_name VARCHAR2(50)
-- );
-- DROP TABLE students;
-- 1. Write a PL/SQL procedure named insert_student that inserts a new student record into the students table using IN parameters for all columns. 

-- CREATE OR REPLACE procedure insert_student(
--     p_id IN NUMBER,
--     p_name IN VARCHAR2,
--     p_fee IN NUMBER,
--     p_sem IN NUMBER,
--     p_dept IN VARCHAR2
-- )
-- IS
-- BEGIN
--   INSERT INTO students(student_id, name, semester_fee, current_semester, dept_name)
--     VALUES (p_id, p_name, p_fee, p_sem, p_dept);
-- END;
-- /
-- select * from students;

-- delete from students;


--Write a PL/SQL procedure named update_fee that updates the semester_fee of a student by a given amount. The procedure should use an OUT parameter to return the updated fee. 
-- CREATE OR REPLACE PROCEDURE update_fee(
--     p_id IN NUMBER,
--     p_amount IN NUMBER,
--     p_new_fee OUT NUMBER
-- )
-- IS
-- BEGIN
--     UPDATE students
--     SET semester_fee = semester_fee + p_amount
--     WHERE student_id = p_id;

--     SELECT semester_fee INTO p_new_fee
--     FROM students
--     WHERE student_id = p_id;
-- END;
-- /

-- 3. Write a PL/SQL function named calculate_scholarship that takes a semester fee as input and returns 15% of it as the scholarship amount. 
-- CREATE or  REPLACE FUNCTION calculate_scholarship(
--     p_id NUMBER,
--     p_fee NUMBER
-- )
-- RETURN NUMBER
-- IS
-- begin
--   RETURN p_fee * 0.15;
-- end;
-- /

--Create a table named backup_students with the same structure as the students table, but include two additional columns: 
-- CREATE TABLE backup_students (
--     student_id NUMBER,
--     name VARCHAR2(100),
--     semester_fee NUMBER,
--     current_semester NUMBER,
--     dept_name VARCHAR2(100),
--     deleted_at DATE,
--     deleted_by VARCHAR2(50)
-- );


--5. Write a row-level BEFORE DELETE trigger on the students table that inserts the deleted row into the backup_students table along with the current date (SYSDATE) and the username of the person who performed the delete (USER). 
-- CREATE or REPLACE  TRIGGER t1
-- BEFORE delete ON students
-- for each ROW
-- BEGIN
-- INSERT INTO backup_students VALUES(:OLD.student_id, :OLD.name, :OLD.semester_fee, :OLD.current_semester, :OLD.dept_name, SYSDATE, USER);
-- END t1;
-- /
-- ALTER TRIGGER backup_before_delete COMPILE;
-- DELETE FROM students
-- WHERE student_id = 1;

-- select * from backup_students;


-- CREATE or REPLACE TRIGGER t2
-- BEFORE update ON students
-- for each ROW
-- begin
--   insert into backup_students values(:OLD.student_id, :OLD.name, :OLD.semester_fee, :OLD.current_semester, :OLD.dept_name, SYSDATE, USER);
-- end t2;
-- /

-- DROP TRIGGER t2;
-- insert into students values (1, 'Aishu', 50000, 4, 'Computer Science');

-- update students
-- set semester_fee = 20000
-- where student_id = 1;





--6. Create a trigger named backup_student_before_update on the students table that takes a backup of the old row into the backup_students table before an UPDATE operation.
-- CREATE or REPLACE TRIGGER backup_student_before_update
-- BEFORE update ON students
-- for each ROW
-- begin
--     insert into backup_students values(:OLD.student_id, :OLD.name, :OLD.semester_fee, :OLD.current_semester, :OLD.dept_name, SYSDATE, USER);
-- END backup_student_before_update;
-- /

-- UPDATE students
-- SET semester_fee = 6000
-- WHERE student_id = 1;

-- SELECT * FROM backup_students;
-- SELECT * FROM students;
-- INSERT INTO students VALUES (1, 'Rahim', 5000, 2, 'CSE');

--7. Create a trigger named backup_student_after_insert on the students table that inserts the newly inserted row into the backup_students table after an INSERT operation.
-- CREATE or REPLACE TRIGGER backup_student_after_insert
-- AFTER insert ON students
-- for each ROW
-- begin
--     insert into backup_students values(:NEW.student_id, :NEW.name, :NEW.semester_fee, :NEW.current_semester, :NEW.dept_name, NULL, NULL);
-- END backup_student_after_insert;
-- /

-- INSERT INTO students VALUES (2, 'Karim', 7000, 3, 'CSE');

-- SELECT * FROM backup_students;

-- 8. Write a code in PL/SQL to create a trigger that validates the availability of items before allowing an order to be placed, considering stock levels and pending orders.

-- CREATE TABLE Products (
--     product_id NUMBER PRIMARY KEY,
--     product_name VARCHAR2(100),
--     stock_quantity NUMBER
-- );


-- CREATE TABLE Orders (
--     order_id NUMBER PRIMARY KEY,
--     product_id NUMBER,
--     order_quantity NUMBER
-- );

-- INSERT INTO Products VALUES (1, 'Laptop', 10);
-- INSERT INTO Products VALUES (2, 'Mouse', 20);

-- CREATE OR REPLACE TRIGGER validate_order_availability
-- BEFORE INSERT ON Orders
-- FOR EACH ROW
-- DECLARE
--     v_current_stock NUMBER;
--     v_pending_orders NUMBER;
-- BEGIN
--     SELECT stock_quantity
--     INTO v_current_stock
--     FROM Products
--     WHERE product_id = :NEW.product_id;

--     SELECT NVL(SUM(order_quantity), 0)
--     INTO v_pending_orders
--     FROM Orders
--     WHERE product_id = :NEW.product_id;

--     IF (v_current_stock - v_pending_orders < :NEW.order_quantity) THEN
--         RAISE_APPLICATION_ERROR(-20001, 'Insufficient stock');
--     END IF;
-- END;
-- /

-- INSERT INTO Orders VALUES (1, 1, 5);
INSERT INTO Orders VALUES (2, 1, 5);
