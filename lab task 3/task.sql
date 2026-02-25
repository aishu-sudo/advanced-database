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

-- select * from instructor_your_student_id;
-- 1. Write a PL/SQL block using an implicit cursor to update the salary of the instructor with id =  15151 by increasing it by 500. Use SQL%ROWCOUNT to print how many rows were  updated. 
begin
update instructor_your_student_id
set salary=salary+500
where id=15151;
dbms_output.put_line('Rows updated: ' || SQL%ROWCOUNT);
end;

-- 2. Declare variables for name and salary using %TYPE. Write a PL/SQL block to select the  details of the instructor with id = 22222 into these variables and print them
DECLARE
v_name instructor_your_student_id.name%TYPE;
v_salary instructor_your_student_id.salary%TYPE;
BEGIN
SELECT name, salary INTO v_name, v_salary
FROM instructor_your_student_id
WHERE id = 22222;
DBMS_OUTPUT.PUT_LINE('Name: ' || v_name || ' Salary: ' || v_salary);
END;

--  3. Write a PL/SQL block using exception handling to select instructor details for id = 99999.  If no data is found, print “Instructor not found”.
DECLARE
v_name instructor_your_student_id.name%TYPE;
v_salary instructor_your_student_id.salary%TYPE;
BEGIN
SELECT name, salary INTO v_name, v_salary
FROM instructor_your_student_id
WHERE id = 99999;
DBMS_OUTPUT.PUT_LINE('Name: ' || v_name || ' Salary: ' || v_salary);
EXCEPTION
WHEN NO_DATA_FOUND THEN
DBMS_OUTPUT.PUT_LINE('Instructor not found');
END; 

-- 4. Write a PL/SQL block using an explicit cursor to fetch and print the details of all  instructors from the table. Include steps for declaring, opening, fetching in a loop, and  closing the cursor.
DECLARE
v_id instructor_your_student_id.id%TYPE;
v_name instructor_your_student_id.name%TYPE;
v_dept instructor_your_student_id.dept_name%TYPE;
v_salary instructor_your_student_id.salary%TYPE;
CURSOR c_instructors IS
SELECT id, name, dept_name, salary FROM instructor_your_student_id;
BEGIN
OPEN c_instructors;
LOOP
FETCH c_instructors INTO v_id, v_name, v_dept, v_salary;
EXIT WHEN c_instructors%NOTFOUND;
DBMS_OUTPUT.PUT_LINE('ID: ' || v_id || ' Name: ' || v_name || ' Dept: ' || v_dept || ' Salary: ' || v_salary);
END LOOP;
CLOSE c_instructors;
-- END;

-- 5. Write a PL/SQL block using an explicit cursor to delete an instructor with id = 12345. Use SQL%NOTFOUND to  print “Instructor not found” if no record was deleted, otherwise print “Instructor deleted  successfully”.
DECLARE
v_id instructor_your_student_id.id%TYPE;
CURSOR c_delete IS
SELECT id FROM instructor_your_student_id WHERE id = 12345;
BEGIN
OPEN c_delete;
loop
FETCH c_delete INTO v_id;
if c_delete%NOTFOUND THEN
dbms_output.put_line('Instructor not found');
else
DELETE FROM instructor_your_student_id WHERE id = v_id;
dbms_output.put_line('Instructor deleted successfully');
END IF;
end loop;
CLOSE c_delete;
END;
/
