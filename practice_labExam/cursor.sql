-- Create a table named STUDENTS with appropriate fields.
-- Insert at least 3 records into the table.
-- Write a PL/SQL block that:
-- Uses a cursor to select students with semester fee greater than 50,000
-- Reduce their fee by 2000
-- Count how many students were updated
-- Display the total updated count-----------explicit cursor



-- CREATE TABLE STUDENTS( 
--     STUDENT_ID NUMBER, 
--     NAME VARCHAR2(20), 
--     DEPT_NAME VARCHAR2(3), 
--     SEMESTER_FEE NUMBER 
-- ); 

-- INSERT INTO STUDENTS VALUES(1, 'John', 'CSE', 5000);
-- INSERT INTO STUDENTS VALUES(2, 'Alice', 'ECE', 4500);
-- INSERT INTO STUDENTS VALUES(3, 'Bob', 'ME', 4000);
-- INSERT INTO STUDENTS VALUES(4, 'Eve', 'CSE', 55000);
-- INSERT INTO STUDENTS VALUES(5, 'Charlie', 'ECE', 60000);


-- DECLARE
--   sid   STUDENTS.STUDENT_ID%TYPE;
--   sname STUDENTS.NAME%TYPE;
--   sdept STUDENTS.DEPT_NAME%TYPE;
--   sfee  STUDENTS.SEMESTER_FEE%TYPE;
--   v_count NUMBER := 0;

--   CURSOR c_stu IS
--     SELECT STUDENT_ID, NAME, DEPT_NAME, SEMESTER_FEE 
--     FROM STUDENTS;

-- BEGIN
--   OPEN c_stu;

--   LOOP
--     FETCH c_stu INTO sid, sname, sdept, sfee;
--     EXIT WHEN c_stu%NOTFOUND;

--     IF sfee > 50000 THEN
--       UPDATE STUDENTS
--       SET SEMESTER_FEE = SEMESTER_FEE - 200
--       WHERE STUDENT_ID = sid;
--       v_count := v_count + 1;
--     END IF;
--   END LOOP;

--   CLOSE c_stu;

--   DBMS_OUTPUT.PUT_LINE('Total students updated: ' || v_count);
-- END;
-- /

-- select * from students;



-- 2. Declare variables for name and salary using %TYPE. Write a PL/SQL block to select the  details of the instructor with id = 22222 into these variables and print them

-- create table instructor_your_student_id (
--    id        number primary key,
--    name      varchar2(100),
--    dept_name varchar2(100),
--    salary    number
-- );

-- INSERT INTO instructor_your_student_id VALUES (10101, 'Srinivasan', 'Comp. Sci.', 65000);

-- INSERT INTO instructor_your_student_id VALUES (12121, 'Wasif', 'Finance', 90000);

-- INSERT INTO instructor_your_student_id VALUES (15151, 'Mozart', 'Music', 40000);

-- INSERT INTO instructor_your_student_id VALUES (22222, 'Einstein', 'Physics', 95000);

-- INSERT INTO instructor_your_student_id VALUES (32343, 'El Said', 'History', 60000);

-- INSERT INTO instructor_your_student_id VALUES (33456, 'Goblin', 'Physics', 87000);

-- INSERT INTO instructor_your_student_id VALUES (45565, 'Katz', 'Comp. Sci.', 75000);

-- INSERT INTO instructor_your_student_id VALUES (58583, 'Califieri', 'History', 62000);


-- DECLARE
-- v_name instructor_your_student_id.name%TYPE;
-- v_salary instructor_your_student_id.salary%TYPE;
-- begin
--   select name ,salary into v_name, v_salary
--   from instructor_your_student_id
--   where id=22222;
--     dbms_output.put_line('Name: ' || v_name || ' Salary: ' || v_salary);
-- end;
-- /



-- 5. Write a PL/SQL block to delete an instructor with id = 12345. Use SQL%NOTFOUND to
-- print “Instructor not found” if no record was deleted, otherwise print “Instructor deleted
-- successfully”.    

-- DECLARE
-- v_id instructor_your_student_id.id%TYPE;
-- CURSOR c_delete IS
-- SELECT id FROM instructor_your_student_id WHERE id = 15151;
-- BEGIN
-- OPEN c_delete;
-- loop
-- FETCH c_delete INTO v_id;
-- if c_delete%NOTFOUND THEN
-- dbms_output.put_line('Instructor not found');
-- else
-- DELETE FROM instructor_your_student_id WHERE id = v_id;
-- dbms_output.put_line('Instructor deleted successfully');
-- END IF;
-- end loop;
-- CLOSE c_delete;
-- END;
-- /


-- Write a PL/SQL block using an explicit cursor to fetch all instructors whose salary is less
-- than 60000, update their salary by adding 1000, and count how many instructors were
-- updated. Print the total count after processing.

DECLARE
v_salary instructor_your_student_id.salary%TYPE;
v_id instructor_your_student_id.id%TYPE;
v_count NUMBER :=0;

CURSOR c_update IS
select id, salary FROM instructor_your_student_id ;

begin
  OPEN c_update;
  loop
    FETCH c_update INTO v_id, v_salary;
    EXIT when c_update%notfound;
    IF v_salary < 70000 THEN
    update instructor_your_student_id set salary = v_salary+1000
    WHERE id=v_id;
    v_count := v_count + 1;
    END IF;
  end loop;
  CLOSE c_update;
  DBMS_OUTPUT.PUT_LINE('Total instructors updated: ' || v_count);
end;


-- select * from instructor_your_student_id;
