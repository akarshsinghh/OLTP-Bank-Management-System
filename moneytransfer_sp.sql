--select * from transactions;
--select * from account;
--select * from transactions;
set serveroutput on;
--exec moneytransfer(89135767380499400,'DMDD0101022',12494980148173100,'DMDD0333100',1);
create or replace procedure moneytransfer (
    i_debit_acc   transactions.debit_account%TYPE,
    i_debit_ifsc   transactions.ifsc_code_debit%TYPE,
    i_credit_acc   transactions.credit_account%TYPE,
    i_credit_ifsc   transactions.ifsc_code_credit%TYPE,
    i_amount account.account_balance%TYPE
    
) AS
    e_length exception;
    insufficient_balance exception;
    e_ifsc exception;
    invalidacc exception;
    v_dacc number;
    v_cacc number;
    v_difsc varchar(20);
    v_cifsc varchar(20);
    v_amount account.account_balance%TYPE;
    tdate date;


BEGIN

select accountnumber into v_dacc from account where accountnumber=i_debit_acc;
select accountnumber into v_cacc from account where accountnumber=i_credit_acc;
select branchifsc into v_difsc from account where accountnumber = i_debit_acc;
select branchifsc into v_cifsc from account where accountnumber = i_credit_acc;
select account_balance into v_amount from account where accountnumber = i_debit_acc;
select sysdate into tdate from dual;
if length(i_debit_acc) = 17 and length(i_credit_acc) = 17 then
dbms_output.put_line('Length Validated');
else
raise e_length;
end if;

if  v_dacc=i_debit_acc and v_cacc=i_credit_acc then
dbms_output.put_line('Account Numbers Have Sucessfully been Validated');
dbms_output.put_line('..');
dbms_output.put_line('......');
dbms_output.put_line('.............');
else
raise invalidacc;
end if;

if (v_difsc=i_debit_ifsc and v_cifsc=i_credit_ifsc) then
dbms_output.put_line('Both IFSC Codes Match With The Respective Bank Accounts');
dbms_output.put_line('..');
dbms_output.put_line('......');
dbms_output.put_line('.............');
else
raise e_ifsc;
end if;

if(v_amount > i_amount) then

INSERT INTO transactions (
    debit_account,
    credit_account,
    ifsc_code_debit,
    ifsc_code_credit,
    amount,
    transaction_date,
    message,
    status
) VALUES (
    i_debit_acc,
    i_credit_acc,
    i_debit_ifsc,
    i_credit_ifsc,
    i_amount,
    tdate,
    'sent money $',
    'Pending'
);
commit;
dbms_output.put_line('Transaction Successful!');
dbms_output.put_line('...');
dbms_output.put_line('........');
UPDATE account
SET account_balance = account_balance - i_amount
WHERE accountnumber = i_debit_acc;

UPDATE account
SET account_balance = account_balance + i_amount
WHERE accountnumber = i_credit_acc;
dbms_output.put_line('Balances Updated!');



else
raise insufficient_balance;
end if;

exception
when e_length then
dbms_output.put_line('account number is not 13 digits');
when insufficient_balance then
dbms_output.put_line('You have insufficient balance to transfer money $');
when e_ifsc then
dbms_output.put_line('IFSC Code does not match bank account number');
when invalidacc then
dbms_output.put_line('Account Number is Invalid');
when no_data_found then null;
end moneytransfer;
/


