DROP TABLE EMPLOYEE;



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
    
    INSERT INTO Employee values(100, 1,'Insurance','Ayushi','Patel', 'F',DATE '1980-11-08',25000,'Accountant','ayushipatel@gmail.com',7856912345, 200);

INSERT INTO Employee values(101, 1,'Insurance','Ruchika','Sinha', 'F',DATE '1983-10-08',25000,'Accountant','ruchika19gmail.com',7856912389, 201);

INSERT INTO Employee values(102, 2, 'Credit cards','Akshit','Arora', 'M',DATE '1990-10-08',60000,'clerk','akshit20arora@gmail.com',7856912333, 201);

INSERT INTO Employee values(103, 3,'Credit cards','Eddy','Sharma', 'M',DATE '1980-05-08',50000,'Provisionary Officer','eddysharma@gmail.com',7856912345, 202);

INSERT INTO Employee values(104, 1,'Insurance','Aditya','Tilak', 'M',DATE '19660-10-08',50000,'Banker','adityatilak@gmail.com',7856912322, 203);

INSERT INTO Employee values(105, 3,'Private banking','Megshi','Thakur', 'F',DATE '1980-11-08',50000,'Clerk','megshithakur@gmail.com',7856912344, 200);

INSERT INTO Employee values(106, 2,'Credit cards','Rinita','Srivastva', 'F',DATE '1967-10-08',50000,'Provisionary Officer','rini@yahoo.com',7856913214, 207);

INSERT INTO Employee values(107, 3,'Credit cards','Sneha','Mohan', 'F',DATE '1999-10-08',90000,'Accountant','sneha@yahoo.com',7856913213, 201);

INSERT INTO Employee values(108, 2,'Insurance','Aditya','Kundlia', 'M',DATE '1956-10-08',90000,'LIC','aditya@yahoo.com',7856913213, 201);

INSERT INTO Employee values(109, 2,'Insurance','Sidhant','Kohli', 'M',DATE '1995-10-04',30000,'LIC','sid@yahoo.com',7856913220, 202);

INSERT INTO Employee values(110, 3,'Private banking','Yash','Navadiya', 'M',DATE '1989-10-08',30000,'Accountant','yash@yahoo.com',7856913221, 203);

INSERT INTO Employee values(111, 1,'Private banking','Virendra','Singh', 'M',DATE '1986-10-08',70000,'Clerk','viv@yahoo.com',7856913229, 209);

INSERT INTO Employee values(112, 1,'Insurance','Viv','Singh', 'M',DATE '1980-10-07',70000,'Clerk','vivrik@yahoo.com',7856913229, 209);

INSERT INTO Employee values(113, 2,'Insurance','Radhika','Madan', 'F',DATE '1981-10-08',70000,'LIC','radhika@yahoo.com',7856913005, 202);

INSERT INTO Employee values(114, 1,'Private banking','Boney','Singh', 'M',DATE '1980-10-08',70000,'LIC','bon@yahoo.com',7856913008, 202);

INSERT INTO Employee values(115, 3,'Private banking','Disha','Parmar', 'F',DATE '1968-10-07',70000,'LIC','disha@yahoo.com',7856913007, 204);

INSERT INTO Employee values(116, 1,'Insurance','Vaishnavi','Singh', 'F',DATE '1969-12-09',70000,'LIC','vaish@yahoo.com',7856913005, 203);

INSERT INTO Employee values(117, 2,'Insurance','Kartik','Sharma', 'M',DATE '1967-12-08',70000,'Banker','kk@yahoo.com',7856913007, 201);


INSERT INTO Employee values(118, 2,'Private banking','Barkha','Duta', 'F',DATE '1966-11-08',70000,'Banker','barkha@yahoo.com',7856913007, 201);


INSERT INTO Employee values(119, 1,'Private banking','Mrinal','Sharma', 'F',DATE '1967-10-08',70000,'Banker','mrinal@yahoo.com',7856914007, 201);

INSERT INTO Employee values(120, 1,'Private banking','Apsara','Sharma', 'F',DATE '1964-10-08',70000,'Banker','mrinal@yahoo.com',7856914003, 201);


select *  from employee ;
