-- PROCEDURE FOR ACCOUNT DEPOSIT

create or replace procedure account_deposit (i_accnumber varchar,
i_branchifsc account.branchifsc%TYPE, i_amount account.account_balance%TYPE)
AS
v_accnumber number;
v_branchifsc number;
sysd date;
v_amount  decimal;
invalid_acc exception;
invalid_ifsc exception;
balance_exceed exception;
negative exception;

BEGIN
select count(*) into v_accnumber from account where accountnumber = i_accnumber;
select count(*) into v_branchifsc from account where branchifsc = i_branchifsc and  accountnumber = i_accnumber;
select sysdate into sysd from dual;

if is_number(i_accnumber) = 0  THEN
raise VALUE_ERROR;
end if;
if v_accnumber = 1 then
dbms_output.put_line('Account Number Validated Successfully');
select account_balance into v_amount from account where accountnumber = i_accnumber;
else
raise invalid_acc;
end if;
if v_branchifsc = 1 then
dbms_output.put_line('IFSC Code Validated Successfully');
else
raise invalid_ifsc;
end if;

if is_number(i_amount) = 0  THEN
raise VALUE_ERROR;
elsif (v_amount + i_amount > 99999999.99) then
raise balance_exceed;
elsif (i_amount < 0) then
raise negative;
else
dbms_output.put_line('All Validations Successful for Balance Update');
end if;

UPDATE account
SET account_balance = account_balance + i_amount
where accountnumber = i_accnumber;

INSERT INTO transactions (credit_account,ifsc_code_credit,amount,transaction_date,message,status)
VALUES (i_accnumber,i_branchifsc,i_amount,sysd,'Deposit','Pending');

dbms_output.put_line('DEPOSIT SUCCESSFUL');


EXCEPTION
when invalid_acc then
dbms_output.put_line('Account Number Does Not Exist');
when invalid_ifsc then
dbms_output.put_line('IFSC Code Incorrect or Does not Match Bank Account Number Entered');
when balance_exceed then
dbms_output.put_line('Total Deposit Value Exceeds Max Balance for Account');
when negative then
dbms_output.put_line('Negative amount can not be deposited!');
when VALUE_ERROR then
dbms_output.put_line('You have not entered a numeric value for deposit');
when OTHERS then 
dbms_output.put_line('You have not entered a numeric value for a numeric field');

END account_deposit;
/

-- PROCEDURE TO UPDATE ACCOUNT INTEREST

create or replace procedure account_interest_update 
AS
c number;
creation date;
p number;
chk number;
o_accnumber number;
sysd date;
cdate date;
month_add number;
temp_year date;
loopnum number;
BEGIN
select sysdate into sysd from dual;
for o in (select * from account left join account_status a on accountnumber = a.account_number)
  loop
    select created_date into cdate from account_status where account_number = o.accountnumber fetch first 1 rows only;
    
    select MONTHS_BETWEEN (sysd,cdate) into c from dual;
    p:=0;
    select trunc(c/12,0) into p from dual;
    chk:=0;
    select count(*) into chk from account_interest where account_number = o.account_number;
    loopnum := p-chk;
    if loopnum = 0 then null;
    else
    for i IN 1..loopnum LOOP
         month_add:=0;
         month_add := i*12;
         select add_months (cdate,month_add) into temp_year from dual;
         insert into account_interest (account_number,branchifsc,created_date) VALUES (o.accountnumber,o.branchifsc,temp_year);
         dbms_output.put_line ('Interest Added');
       end LOOP;
       end if;
  end loop;
end account_interest_update;
/
