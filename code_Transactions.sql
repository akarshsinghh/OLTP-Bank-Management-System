drop table TRANSACTIONS;
CREATE TABLE TRANSACTIONS(

    Tansaction_ID   int not null primary key,
    Debit_Account   number,
    Credit_Account  number,
    IFSC_Code_Debit char(11),
    IFSC_Code_Credit char (11),
    Amount          Decimal(10,2) not null constraint amt_check check( Amount > 0),
    Transaction_date date,
    Message         varchar(100),
    Status          varchar(20)

);
    
    
    
    