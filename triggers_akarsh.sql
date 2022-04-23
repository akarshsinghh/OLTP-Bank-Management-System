CREATE OR REPLACE TRIGGER trans_update 
AFTER INSERT OR UPDATE ON transactions
BEGIN
  UPDATE transactions 
  SET status = 'Sucess'
  WHERE (select sysdate from dual)-transaction_date  > 2;
END;
/

select * from transactions;




