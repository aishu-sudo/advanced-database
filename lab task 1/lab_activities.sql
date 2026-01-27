--Begin
--FOR counter IN reverse 1..10 LOOP
   --DBMS_OUTPUT.PUT_LINE('Counter value: ' || counter);
--END LOOP;
--END;


--Declare
--i NUMBER := 1;
--Begin
--While i<=10 LOOP
   --DBMS_OUTPUT.PUT_LINE('Value of i: ' || i);
   --i:=i+1;
--END LOOP;
--END;


--Declare
--i NUMBER := 2;
--Begin
--LOOP
--Exit when i >20 ;
   --DBMS_OUTPUT.PUT_LINE(i);
   --i:=i+2;
--END LOOP;
--END;


--BEGIN
  -- IF 5 > 2 THEN
    --  DBMS_OUTPUT.PUT_LINE('5 is greater than 2');
   --ELSIF 5 = 2 THEN
      --DBMS_OUTPUT.PUT_LINE('5 is equal to 2');
   --ELSE
     -- DBMS_OUTPUT.PUT_LINE('2 is greater than 5');
   --END IF;
--END;


--BEGIN
  -- case 1
   --when 1 then
     -- DBMS_OUTPUT.PUT_LINE('Value is 1');
   --when 2 then
     -- DBMS_OUTPUT.PUT_LINE('Value is 2');
   --else
     -- DBMS_OUTPUT.PUT_LINE('Value is other than 1,2 or 3');
   --end case;
--END;



declare
   num         number;
   temp        number;
   digit_count number := 0;
begin
   num := &enter_number;
   temp := num;
   while temp > 0 loop
      digit_count := digit_count + 1;
      temp := trunc(temp / 10);
   end loop;

   dbms_output.put_line('The entered number is: ' || num);
   dbms_output.put_line('Total number of digits: ' || digit_count);
end;
/


