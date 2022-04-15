
-----------------------------------Loan-------------------------------------------------------------

CREATE TABLE LOAN 
(LoanAccNumber number NOT NULL PRIMARY KEY,
Customer_ID int CONSTRAINT positive_customer_id CHECK (Customer_ID > 0),
LOANIFSC VARCHAR(11),
Principal decimal (20,2) CONSTRAINT positive_principal CHECK (Principal > 0) ,
Outstanding Decimal (20,2)  CONSTRAINT positive_outstanding CHECK (Outstanding > 0),
Loan_Type number(1) CHECK (Loan_Type > 0),
Status Varchar (20),
Approved_By_ID int,
Sanction_Date date,
Duration decimal (20,2),
CONSTRAINT check_loan_period
  CHECK (Duration between 0 and 50)
);

INSERT INTO LOAN values(44689319,100000,'DMDD0333100',500.00,399.06, 1,'Active',1,TO_DATE('2021-04-09','YYYY-MM-DD'),5.50);
INSERT INTO LOAN values(77489838,100001,'DMDD0101022',2000.00,8000.00, 2,'Active',2,TO_DATE('1999-03-11','YYYY-MM-DD'),10.00);
INSERT INTO LOAN values(63892734,100002,'DMDD0454500',690.00,0.90, 3,'Inactive',3,TO_DATE('2015-05-20','YYYY-MM-DD'),15.00);
INSERT INTO LOAN values(63234734,100003,'DMDD0101022',1190.00,5070.90, 4,'Active',4,TO_DATE('2005-10-10','YYYY-MM-DD'),25.00);
INSERT INTO LOAN values(18467484,100004,'DMDD0454500',5000.00,0.05, 5,'Inactive',5,TO_DATE('2021-11-20','YYYY-MM-DD'),10.00);
INSERT INTO LOAN values(13892736,100005,'DMDD0333100',200.00,800.20, 6,'Active',6,TO_DATE('2010-09-20','YYYY-MM-DD'),19.00);
INSERT INTO LOAN values(53892734,100006,'DMDD0101022',600,700.90, 7,'Active',7,TO_DATE('2000-06-02','YYYY-MM-DD'),30.00);
INSERT INTO LOAN values(61292734,100007,'DMDD0454500',10000.00,20000.90, 8,'Active',8,TO_DATE('1991-05-10','YYYY-MM-DD'),15.00);



select * from loan;