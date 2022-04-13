DROP TABLE CUSTOMER;
CREATE TABLE CUSTOMER(
Customer_ID INT PRIMARY KEY,
First_Name VARCHAR(20) NOT NULL,
Last_Name VARCHAR(20) NOT NULL,
DOB Date,
Works_at VARCHAR(20),
Sex VARCHAR(1) CONSTRAINT Genders CHECK(Sex IN ('M','F')),
Apt_No VARCHAR(10),
Street VARCHAR(20),
City VARCHAR(10),
CState VARCHAR(2),
Zipcode int CONSTRAINT Zip_Length CHECK (LENGTH(Zipcode)=5),
Phone int CONSTRAINT Phone_Length CHECK(LENGTH(Phone)=10)
);

DROP TABLE WORKS_WITH;
CREATE TABLE WORKS_WITH(
Customer_ID INT NOT NULL,
Employee_ID INT NOT NULL,
Relationship varchar(20),
PRIMARY KEY (Customer_ID,Employee_ID)
);


INSERT INTO Customer values('100','Kiran','Kumar','12-05-1988','NE','M','14','Onestreet', 'Boston', 'MA', '12345', '9999999999');

INSERT INTO Customer values('101','Rahul','Mehta','11-04-1990','NE','M','14','Twostreet', 'Boston', 'MA', '12345', '9658365933');

INSERT INTO Customer values('102','Nandan', 'Mohan','11-04-1990','NE','M','15','Threestreet', 'Boston', 'MA', '12345', '8572212077');

INSERT INTO Customer values('103','Lakshana','Kolur','07-11-1985','SE','F','05','Fourstreet', 'Boston', 'MA', '12345', '7575838485');

INSERT INTO Customer values('104','Mohan','Kumar','21-07-1981','SE','F','03','Fivestreet', 'Boston', 'MA', '12345', '7863542435');

INSERT INTO Customer values('105','Meghana','Singh','01-11-1972','NE','M','14','Onestreet', 'Boston', 'MA', '12345', '8755235554');

INSERT INTO Customer values('106','Rajdeep','Mamtani','12-03-1979','SE','M','14','Twostreet', 'Allston', 'MA', '12345', '7843563450');

INSERT INTO Customer values('107','Sonal','Singh','18-01-1988','SE','F','23','Threestreet', 'Allston', 'MA', '12345', '8954398443');

INSERT INTO Customer values('108','Jayashree','Kumari','14-06-1984','SE','M','14','Fourstreet', 'Allston', 'MA', '12345', '9787837854');

INSERT INTO Customer values('109','Abhilasha','Somani','06-06-1966','SE','F','11','Fivestreet', 'Cambridge', 'MA', '12345', '9827354354');

INSERT INTO Customer values('109','Anukriti','Joshi','19-09-1981','NE','M','14','Onestreet', 'Cambridge', 'MA', '12345', '8754290454');

INSERT INTO Customer values('110','Amol', 'Srivatsav','09-05-1987','SE','M','08','Twostreet', 'Cambridge', 'MA', '12345', '9873455445');

INSERT INTO Customer values('111','Abhimanyu','Sarda','12-05-1990','NE','M','14','Threestreet', 'Cambridge', 'MA', '12345', '8754493433');

INSERT INTO Customer values('112','Nayanika', 'Hazarika','11-05-1987','NE','M','14','Fourstreet', 'Cambridge', 'MA', '12345', '9865489380');

INSERT INTO Customer values('113', 'Ritrisha' ,'Baruah','12-05-1988','SE','M','14','Fivestreet', 'Boston', 'MA', '12345', '7893548993');

INSERT INTO Customer values('114','Amol', 'Prakash','12-05-1988','SE','F','14','Onestreet', 'Boston', 'KA', '12345', '8889876543');

INSERT INTO Customer values('115','Kiran', 'Kumar','12-05-1988','NE','M','14','Twostreet', 'Amherst', 'MA', '12345', '7878676887');

INSERT INTO Customer values('116','Mrinal', 'Kumar','08-08-1991','NE','M','14','Threestreet', 'Amherst', 'MA', '12345', '7665687670');

INSERT INTO Customer values('117','Najuk', 'Pincha','12-05-1988','SE','F','21','Fourstreet', 'Amherst', 'MA', '12345', '8765432109');

INSERT INTO Customer values('118','Sowmya', 'Raghavan','12-05-1988','NE','M','14','Fivestreet', 'Amherst', 'MA', '12345', '8765409876');

SELECT * FROM CUSTOMER;

SELECT COUNT(*),Cstate FROM CUSTOMER GROUP BY Cstate;

INSERT INTO WORKS_WITH VALUES(100,100,'Loan_Approval');
INSERT INTO WORKS_WITH VALUES(101,100,'Loan_Approval');
INSERT INTO WORKS_WITH VALUES(102,100,'Loan_Approval');
INSERT INTO WORKS_WITH VALUES(103,100,'Loan_Approval');
INSERT INTO WORKS_WITH VALUES(104,100,'Loan_Approval');
INSERT INTO WORKS_WITH VALUES(105,100,'Loan_Approval');
INSERT INTO WORKS_WITH VALUES(106,101,'Loan_Approval');
INSERT INTO WORKS_WITH VALUES(107,101,'Loan_Approval');
INSERT INTO WORKS_WITH VALUES(108,101,'Loan_Approval');
INSERT INTO WORKS_WITH VALUES(109,101,'Loan_Approval');
INSERT INTO WORKS_WITH VALUES(110,102,'Loan_Approval');
INSERT INTO WORKS_WITH VALUES(111,102,'Loan_Approval');
INSERT INTO WORKS_WITH VALUES(112,102,'Loan_Approval');
INSERT INTO WORKS_WITH VALUES(113,102,'Loan_Approval');
INSERT INTO WORKS_WITH VALUES(114,103,'Loan_Approval');
INSERT INTO WORKS_WITH VALUES(115,103,'Loan_Approval');
INSERT INTO WORKS_WITH VALUES(116,103,'Loan_Approval');
INSERT INTO WORKS_WITH VALUES(117,103,'Loan_Approval');
INSERT INTO WORKS_WITH VALUES(118,104,'Loan_Approval');
INSERT INTO WORKS_WITH VALUES(119,104,'Loan_Approval');

SELECT * FROM WORKS_WITH;
SELECT * FROM CUSTOMER;

CREATE VIEW CUSTOMER_EMPLOYEE AS
SELECT CUSTOMER.Customer_ID,FIRST_NAME, LAST_NAME,RELATIONSHIP, Employee_ID, EMPLOYEE.FIRST_NAME, EMPLOYEE.LAST_NAME 
FROM CUSTOMER
INNER JOIN WORKS_WITH 
ON CUSTOMER.CUSTOMER_ID=WORKS_WITH.CUSTOMER_ID
INNER JOIN EMPLOYEE
ON EMPLOYEE.EMPLOYEE_ID= works_with.employee_id;

CREATE VIEW CUSTOMER_WORKSWITH AS
SELECT CUSTOMER.Customer_ID,FIRST_NAME, LAST_NAME,RELATIONSHIP, Employee_ID
FROM CUSTOMER
INNER JOIN WORKS_WITH 
ON CUSTOMER.CUSTOMER_ID=WORKS_WITH.CUSTOMER_ID;

SELECT * FROM CUSTOMER_WORKSWITH;

CREATE VIEW CUSTOMER_LOAN_DETAILS AS
SELECT CUSTOMER.CUSTOMER_ID, CUSTOMER.FIRST_NAME, CUSTOMER.LAST_NAME, LOAN.LOANACCNUMBER, OUTSTANDING
FROM CUSTOMER
INNER JOIN LOAN
ON CUSTOMER.CUSTOMER_ID= LOAN.CUSTOMER.ID ;





