-- Question 1 (Based on PL/SQL Loop)
-- Write a PL/SQL program to:
-- Calculate the sum of numbers from 1 to N
-- Use a WHILE loop
-- Display the result using DBMS_OUTPUT.PUT_LINE


DECLARE
i NUMBER :=0;
n NUMBER;
sum_Number NUMBER :=0;
begin
  n:=&n;
  while i<=n loop
    sum_Number:=sum_Number+i;
    i:=i+1;
  end loop;
  dbms_output.put_line('sum of 1 to ' ||n|| ' is '||sum_Number);
end;
