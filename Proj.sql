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


INSERT INTO Customer values('100000','Kiran','Kumar','12-05-1988','NE','M','14','Onestreet', 'Boston', 'MA', '12345', '9999999999');

INSERT INTO Customer values('100001','Rahul','Mehta','11-04-1990','NE','M','14','Twostreet', 'Boston', 'MA', '12345', '9658365933');

INSERT INTO Customer values('100002','Nandan', 'Mohan','11-04-1990','NE','M','15','Threestreet', 'Boston', 'MA', '12345', '8572212077');

INSERT INTO Customer values('100003','Lakshana','Kolur','07-11-1985','SE','F','05','Fourstreet', 'Boston', 'MA', '12345', '7575838485');

INSERT INTO Customer values('100004','Mohan','Kumar','21-07-1981','SE','F','03','Fivestreet', 'Boston', 'MA', '12345', '7863542435');

INSERT INTO Customer values('100005','Meghana','Singh','01-11-1972','NE','M','14','Onestreet', 'Boston', 'MA', '12345', '8755235554');

INSERT INTO Customer values('100006','Rajdeep','Mamtani','12-03-1979','SE','M','14','Twostreet', 'Allston', 'MA', '12345', '7843563450');

INSERT INTO Customer values('100007','Sonal','Singh','18-01-1988','SE','F','23','Threestreet', 'Allston', 'MA', '12345', '8954398443');

INSERT INTO Customer values('100008','Jayashree','Kumari','14-06-1984','SE','M','14','Fourstreet', 'Allston', 'MA', '12345', '9787837854');

INSERT INTO Customer values('100009','Abhilasha','Somani','06-06-1966','SE','F','11','Fivestreet', 'Cambridge', 'MA', '12345', '9827354354');



INSERT INTO Customer values('100010','Amol', 'Srivatsav','09-05-1987','SE','M','08','Twostreet', 'Cambridge', 'MA', '12345', '9873455445');

INSERT INTO Customer values('100011','Abhimanyu','Sarda','12-05-1990','NE','M','14','Threestreet', 'Cambridge', 'MA', '12345', '8754493433');

INSERT INTO Customer values('100012','Nayanika', 'Hazarika','11-05-1987','NE','M','14','Fourstreet', 'Cambridge', 'MA', '12345', '9865489380');

INSERT INTO Customer values('100013', 'Ritrisha' ,'Baruah','12-05-1988','SE','M','14','Fivestreet', 'Boston', 'MA', '12345', '7893548993');

INSERT INTO Customer values('100014','Amol', 'Prakash','12-05-1988','SE','F','14','Onestreet', 'Boston', 'KA', '12345', '8889876543');

INSERT INTO Customer values('100015','Kiran', 'Kumar','12-05-1988','NE','M','14','Twostreet', 'Amherst', 'MA', '12345', '7878676887');

INSERT INTO Customer values('100016','Mrinal', 'Kumar','08-08-1991','NE','M','14','Threestreet', 'Amherst', 'MA', '12345', '7665687670');

INSERT INTO Customer values('100017','Najuk', 'Pincha','12-05-1988','SE','F','21','Fourstreet', 'Amherst', 'MA', '12345', '8765432109');

INSERT INTO Customer values('100018','Sowmya', 'Raghavan','12-05-1988','NE','M','14','Fivestreet', 'Amherst', 'MA', '12345', '8765409876');
INSERT INTO Customer values('100019','Anukriti','Joshi','19-09-1981','NE','M','14','Onestreet', 'Cambridge', 'MA', '12345', '8754290454');

SELECT * FROM CUSTOMER;

SELECT COUNT(*),Cstate FROM CUSTOMER GROUP BY Cstate;

INSERT INTO WORKS_WITH VALUES(100000,100000,'Loan_Approval');
INSERT INTO WORKS_WITH VALUES(100001,100000,'Loan_Approval');
INSERT INTO WORKS_WITH VALUES(100002,100000,'Loan_Approval');
INSERT INTO WORKS_WITH VALUES(100003,100000,'Loan_Approval');
INSERT INTO WORKS_WITH VALUES(100004,100000,'Loan_Approval');
INSERT INTO WORKS_WITH VALUES(100005,100000,'Loan_Approval');
INSERT INTO WORKS_WITH VALUES(100006,100001,'Loan_Approval');
INSERT INTO WORKS_WITH VALUES(100007,100001,'Loan_Approval');
INSERT INTO WORKS_WITH VALUES(100008,100001,'Loan_Approval');
INSERT INTO WORKS_WITH VALUES(100009,100001,'Loan_Approval');
INSERT INTO WORKS_WITH VALUES(100010,100002,'Loan_Approval');
INSERT INTO WORKS_WITH VALUES(100011,100002,'Loan_Approval');
INSERT INTO WORKS_WITH VALUES(100012,100002,'Loan_Approval');
INSERT INTO WORKS_WITH VALUES(100013,100002,'Loan_Approval');
INSERT INTO WORKS_WITH VALUES(100014,100003,'Loan_Approval');
INSERT INTO WORKS_WITH VALUES(100015,100003,'Loan_Approval');
INSERT INTO WORKS_WITH VALUES(100016,100003,'Loan_Approval');
INSERT INTO WORKS_WITH VALUES(100017,100003,'Loan_Approval');
INSERT INTO WORKS_WITH VALUES(100018,100004,'Loan_Approval');
INSERT INTO WORKS_WITH VALUES(100019,100004,'Loan_Approval');

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





