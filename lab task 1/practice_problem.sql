--1.Sum of First N Natural Numbers

Declare
n number;
i NUMBER := 1;
sum_number NUMBER := 0;
Begin
n:=&n;
LOOP
Exit when i >n ;
sum_number := sum_number + i;
i:=i+1;
END LOOP;
DBMS_OUTPUT.PUT_LINE('Sum of first ' || n || ' natural numbers is: ' || sum_number);
END;
/


--factorial calculation
--DECLARE
--n number;
--fact_number number:=1;
--Begin
--n:=&n;
--FOR i IN 1..n LOOP
--fact_number := fact_number * i;
--END LOOP;
--dbms_output.put_line('factorial of' || n || ' is: ' || fact_number);
--END;
--/

-- 3.Even or Odd Number Check
--declare
--n number;
--BEGIN
--n:=&n;
--IF mod(n,2)=0 THEN
--dbms_output.put_line(n || ' is an Even Number');
--ELSE
--dbms_output.put_line(n || ' is an Odd Number');
--END IF;
--END;
--  /


-- 4.Student Grade Calculation (IF-THEN-ELSIF)
   --SET SERVEROUTPUT ON
--declare
  -- marks number;
   --grade char(1);
--begin
   --marks := &marks;
   --if marks >= 90 then
      --grade := 'A';
  -- elsif marks >= 80 then
      --grade := 'B';
   --elsif marks >= 70 then
      --grade := 'C';
   --elsif marks >= 60 then
      --grade := 'D';
   --else
     -- grade := 'F';
   --end if;

   --dbms_output.put_line('The grade for marks ' || marks|| ' is: ' || grade);
--end;
--/



-- 5. Student Grade Calculation (CASE Statement)
--declare
  -- marks number;
   --grade char(1);
--begin
  -- marks := &marks;
  -- case
    --  when marks >= 90 then
      --   grade := 'A';
     -- when marks >= 80 then
      --   grade := 'B';
      --when marks >= 70 then
       --  grade := 'C';
      --when marks >= 60 then
        -- grade := 'D';
     -- else
      --   grade := 'F';
  -- end case;

 --  dbms_output.put_line('The grade for marks ' || marks || ' is: ' || grade);
--end;
--/

-- 6. Find the Largest of Three Numbers
--DECLARE
--a NUMBER;
--b NUMBER;
--c NUMBER;
--largest NUMBER;
--BEGIN
--a := &first_number;
--b := &second_number;
--c := &third_number;
--IF a >= b AND a >= c THEN
--largest := a;
--ELSIF b >= a AND b >= c THEN
--largest := b;
--ELSE
--largest := c;
--END IF;
--DBMS_OUTPUT.PUT_LINE('The largest number among '|| a || ', ' || b || ', and ' || c || ' is: ' || largest);
--END;
--/


-- 7. Count Digits in a Number
--declare
 --  num         number;
 --  temp        number;
 --  digit_count number := 0;
--begin
  -- num := &enter_number;
  -- temp := num;
   --while temp > 0 loop
    --  digit_count := digit_count + 1;
    --  temp := trunc(temp / 10);
   --end loop;

  -- dbms_output.put_line('The entered number is: ' || num);
   --dbms_output.put_line('Total number of digits: ' || digit_count);
--end;
--/