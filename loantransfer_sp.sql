set serveroutput on;

create or replace procedure loantransfer (
    i_branchifsc   loan_transactions.branchifsc%TYPE,
    i_loanifsc   loan_transactions.loanifsc%TYPE,
    i_loan_acc_no   loan_transactions.loanaccnumber%TYPE,
    i_amount loan_transactions.amount%TYPE
    
) AS
    e_length exception;
    insufficient_balance exception;
    e_ifsc exception;
    invalidacc exception;
    v_lacc number;
    v_cacc number;
    v_difsc varchar(20);
    v_cifsc varchar(20);
    v_amount account.account_balance%TYPE;
    tdate date;


BEGIN

select count(*) into v_lacc from loan where i_loan_acc_no=loanaccnumber;
select count(*) into v_cifsc from loan where loanaccnumber = i_loan_acc_no;
select count(*) into v_difsc from branch where branchifsc IN (select branchifsc from branch);
select outstanding into v_amount from loan where loanaccnumber = i_loan_acc_no;
select sysdate into tdate from dual;

if length(i_loan_acc_no) > 5 then
dbms_output.put_line('Length Validated');
else
raise e_length;
end if;

if  v_lacc=1 then
dbms_output.put_line('Account Numbers Have Sucessfully been Validated');
dbms_output.put_line('..');
dbms_output.put_line('......');
dbms_output.put_line('.............');
else
raise invalidacc;
end if;

if v_cifsc = 1 and v_difsc = 1 then
dbms_output.put_line('Both IFSC Codes are Correct and Validated');
dbms_output.put_line('..');
dbms_output.put_line('......');
dbms_output.put_line('.............');
else
raise e_ifsc;
end if;

if (v_amount > i_amount) then

INSERT INTO loan_transactions (
    branchifsc,
    loanifsc,
    loanaccnumber,
    amount,
    transaction_date
) VALUES (
    i_branchifsc,
    i_loanifsc,
    i_loan_acc_no,
    i_amount,
    tdate
);

commit;
dbms_output.put_line('Transaction Successful!');
dbms_output.put_line('...');
dbms_output.put_line('........');

if(v_amount - i_amount between 0 and 1) then

UPDATE loan
SET outstanding = outstanding - i_amount, status = 'Inactive'
WHERE loanaccnumber = i_loan_acc_no;
dbms_output.put_line('Balances Updated!');

else
UPDATE loan
SET outstanding = outstanding - i_amount, status = 'Active'
WHERE loanaccnumber = i_loan_acc_no;
dbms_output.put_line('Balances Updated!');

end if;

else
raise insufficient_balance;
end if;

exception
when e_length then
dbms_output.put_line('account number does not have enough digits');
when insufficient_balance then
dbms_output.put_line('You have insufficient balance to transfer money $');
when e_ifsc then
dbms_output.put_line('IFSC Code does not match bank account number');
when invalidacc then
dbms_output.put_line('Account Number is Invalid');
when no_data_found then
dbms_output.put_line('Invalid Bank Account Number/IFSC Entered');
end loantransfer;
/
