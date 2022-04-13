SET SERVEROUTPUT ON;
begin 
for rec in (
           select table_name from user_tables 
           where  not   
           regexp_like(table_name, 'keep_tab1|keep_tab2|^ASB')  
           ) 
loop  
    begin  
    execute immediate 'drop table '||rec.table_name;  
    exception when others then   
    dbms_output.put_line(rec.table_name||':'||sqlerrm);  
    end;  
end loop;               
end;  
/

CREATE TABLE LOAN 
(LoanAccNumber number NOT NULL PRIMARY KEY,
Customer_ID int CONSTRAINT positive_customer_id CHECK (Customer_ID > 0),
LOANIFSC Char(11),
Principal decimal (10,2) CONSTRAINT positive_principal CHECK (Principal > 0) ,
Outstanding Decimal (10,2)  CONSTRAINT positive_outstanding CHECK (Outstanding > 0),
Loan_Type number(1) CHECK (Loan_Type > 0),
Status Varchar (20),
Approved_By_ID int,
Sanction_Date date,
Duration decimal (2,2),
CONSTRAINT check_loan_period
  CHECK (Duration between 0 and 50)
);


CREATE TABLE LOAN_TYPE
( Loan_Type number(1) NOT NULL PRIMARY KEY CHECK (Loan_Type > 0),
Interest_Rate decimal (2,2) CONSTRAINT positive_interest_rate CHECK (Interest_Rate > 0),
Category varchar (20) NOT NULL
);

CREATE TABLE LOAN_TRANSACTIONS
(LOAN_TRANS_ID number generated by default as identity NOT NULL PRIMARY KEY,
 BRANCHIFSC CHAR (11) NOT NULL,
 LOANIFSC CHAR (11) NOT NULL,
 LoanAccNumber number NOT NULL,
 Amount Decimal (10,2) NOT NULL CONSTRAINT positive_amount CHECK (Amount > 0),
 Transaction_Date Date NOT NULL
);

CREATE TABLE LOAN_INTEREST
( INTEREST_ID number generated by default as identity NOT NULL PRIMARY KEY,
 LoanAccNumber number not null,
 BRANCHIFSC char (11) NOT NULL,
 Deposit_Date Date NOT NULL
 );
 
CREATE TABLE Account(
AccountNumber NUMBER NOT NULL,
Account_Type VARCHAR(20) NOT NULL,
BranchIFSC CHAR(11) NOT NULL,
Account_Balance DECIMAL NOT NULL CONSTRAINT Balance_Positive CHECK (Account_Balance > 0),
PRIMARY KEY (AccountNumber)
);


CREATE TABLE Account_Interest(
Interest_ID INT GENERATED BY DEFAULT AS IDENTITY,
Account_Number Number NOT NULL,
BranchIFSC VARCHAR(11) NOT NULL,
Created_Date DATE NOT NULL,
PRIMARY KEY (Interest_ID)
);

CREATE TABLE Account_Status(
Status_ID INT GENERATED BY DEFAULT AS IDENTITY,
Account_Number NUMBER NOT NULL,
Status VARCHAR(20) NOT NULL,
Created_Date DATE NOT NULL,
PRIMARY KEY (Status_ID)
);

CREATE TABLE CUSTOMER(
Customer_ID INT PRIMARY KEY,
First_Name VARCHAR(20) NOT NULL,
Last_Name VARCHAR(20) NOT NULL,
DOB Date,
Works_at VARCHAR(20),
Sex VARCHAR(1) CONSTRAINT Genders CHECK(Sex IN ('M','F')),
Apt_No VARCHAR(10),
Street VARCHAR(10),
City VARCHAR(10),
CState VARCHAR(2),
Zipcode int CONSTRAINT Zip_Length CHECK (LENGTH(Zipcode)=5),
Phone int CONSTRAINT Phone_Length CHECK(LENGTH(Phone)=10)
);

CREATE TABLE WORKS_WITH(
Customer_ID INT NOT NULL,
Employee_ID INT NOT NULL,
Relationship varchar(20)
);

CREATE TABLE Branch_Supplier (
Supplier_ID int PRIMARY KEY,
Supplier_Name  VARCHAR(20) NOT NULL,
Supplier_Type  VARCHAR(20),
Branch_ID NUMBER
);


CREATE TABLE Branch (
BranchIFSC Char(11) PRIMARY KEY ,
Branch_ID   int UNIQUE,
Address  VARCHAR(20) NOT NULL,
Street  VARCHAR(20)NOT NULL,
City   VARCHAR(20) NOT NULL,
State Char(2) NOT NULL,
Zipcode int,
Manager_ID int CONSTRAINT Positive_Manager_ID CHECK(Manager_ID>0)
);


--ALTER TABLE Branch_Supplier ADD CONSTRAINT FK_Branch_ID FOREIGN KEY (Branch_ID) REFERENCES Branch(Branch_ID);


CREATE TABLE EMPLOYEE 
   (
    EMPLOYEE_ID NUMBER(10,0) NOT NULL, 
	BRANCH_ID NUMBER(10,0) NOT NULL, 
	DEPARTMENT VARCHAR2(20 BYTE) NOT NULL, 
	FIRST_NAME VARCHAR2(20 BYTE) NOT NULL, 
	LAST_NAME VARCHAR2(20 BYTE), 
	SEX VARCHAR2(1 BYTE), 
	DOB DATE, 
	SALARY NUMBER(10,2), 
	EMP_ROLE VARCHAR2(20 BYTE), 
	EMAIL_ID VARCHAR2(20 BYTE) NOT NULL, 
	CONTACT_NO NUMBER(10,0), 
	SUPERVISOR_ID NUMBER(10,0), 
	 CONSTRAINT "EMP_EMPLOYEE_ID" CHECK ( Employee_Id > 0 ), 
	 CONSTRAINT "EMP_BRANCH_ID" CHECK (Branch_Id > 0 ), 
	 CONSTRAINT "GENDER_CHECK" CHECK (Sex IN ('F','M','Other')), 
	 CONSTRAINT "SAL_CHECK" CHECK (Salary > 0 ), 
	 CONSTRAINT "CONTACT_CHECK" CHECK ( LENGTH(CONTACT_NO) = 10 ), 
	 PRIMARY KEY ("EMPLOYEE_ID")
    ); 
    

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


 