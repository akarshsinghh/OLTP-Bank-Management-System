 CREATE or REPLACE VIEW employee_branch_count AS
SELECT BRANCH_ID,  count(EMPLOYEE_ID) AS EMPLOYEE_COUNT
  FROM Employee
  Group BY  BRANCH_ID;
  
  select * from employee_branch_count ;
  
  CREATE or REPLACE VIEW salary_range_dept AS
  SELECT MIN(SALARY) AS MIN_SALARY ,MAX(SALARY) AS MAX_SALARY, DEPARTMENT
  FROM EMPLOYEE
  GROUP BY  DEPARTMENT

SELECT * FROM salary_range_dept ;


CREATE or REPLACE VIEW branch_loan_count AS
  select  e.BRANCH_ID , count(l.LoanAccNumber) as Loan_count
  from Employee e inner join Loan l
  on e.employee_id = l.Approved_By_ID 
  GROUP BY e.BRANCH_ID;
  
  select * from branch_loan_count;
  
  CREATE or REPLACE VIEW Zip_Cust_Loan AS
    select Br.Zipcode as Zipcode, count(Cus.Count_C) as Customer_count, count(br.AccNum) as Loan_Acc_Count
    from
    (
        select b.Zipcode as Zipcode,count(bl.AccNum) as AccNum
        from 
                Branch b inner join
                ( 
                    select lt.BranchIFSC as BranchIFSC, count(l.LoanAccNumber) as AccNum
                    from LOAN_TRANSACTIONS lt 
                    inner join Loan l
                    on lt.LoanAccNumber = l.LoanAccNumber
                    group by lt.BranchIFSC) bl
                    
        on b.BranchIFSC = bl.BranchIFSC
        group by b.Zipcode) Br 
        
        inner join
    (
        select C.Zipcode as Zipcode, count(C.Customer_ID) as Count_C
        from Customer C
        group by C.Zipcode ) Cus
        
    on Br.Zipcode = Cus.Zipcode
    group by Br.Zipcode;
    
    Select * from Zip_Cust_Loan;
    
     view for customer _account _status
    
      CREATE or REPLACE VIEW cust_account_stat AS
  select c.Customer_ID, c.First_Name ,c.Last_Name ,a.AccountNumber, A.Status
  from Customer c
  inner join Account a
  on c.Customer_ID = a.AccountNumber
  inner join Account_Status A
  on a.AccountNumber = A.Account_Number ;
  
  
  select * from cust_account_stat;
  
  
  view to check account status with just account number 
  
  CREATE or REPLACE VIEW account_stat AS
  select a.AccountNumber,Status
  from Account_Status A
  inner join Account a
  on A.Account_Number = a.AccountNumber ;
  
  select * from account_stat ;
  
  
  
    CREATE or REPLACE VIEW customer_account_count AS
  select c.Customer_ID ,c.First_Name , c.Last_Name, count(AccountNumber)as account_count
  from Customer c
  inner join Account a
  on c.Customer_ID = a.Customer_ID
  Group by c.Customer_ID,c.First_Name,c.Last_Name
  
  select * from customer_account_count ;
  
  
  added some extra values to tha account table so that the count for customer should show more than one account , so repeated a few customer ids
  
 INSERT INTO Account VALUES (37197131588356700, 'Cheking', 'DMDD0454500', 100009, 1400);
INSERT INTO Account VALUES (37197131588356800, 'Cheking', 'DMDD0454500', 100020, 1400);
INSERT INTO Account VALUES (37197131588356900, 'Saving', 'DMDD0454500', 100009, 1400);
INSERT INTO Account VALUES (37197131588355400, 'Saving', 'DMDD0454500', 100009, 1300);
INSERT INTO Account VALUES (37197131588355600, 'Checking', 'DMDD0333100',100003 , 1300);
INSERT INTO Account VALUES (37197131588355610, 'Saving', 'DMDD0333100',100003 , 1300);
    
    
    
    
inserting data for customer 


INSERT INTO Customer values(100021,'Greg','Mathew',TO_DATE('1988-03-15','YYYY-MM-DD'),'NE','M','14','Darling St', 'Amherst', 'MA', '12345', '8754290454');
INSERT INTO Customer values(100022,'Jhon','Mat',TO_DATE('1988-03-15','YYYY-MM-DD'),'NE','M','14','Darling St', 'Amherst', 'MA', '12345', '8754290454');
INSERT INTO Customer values(100023,'Charlie','Chap',TO_DATE('1988-05-15','YYYY-MM-DD'),'NE','M','14','Darling St', 'Boston', 'MA', '12345', '8754290454');
INSERT INTO Customer values(100024,'Samiksha','Bhatnagar',TO_DATE('1999-05-19','YYYY-MM-DD'),'NE','M','14','Darling St', 'Boston', 'MA', '12345', '8754290454');
INSERT INTO Customer values(100025,'Bardia','Moem',TO_DATE('1979-08-15','YYYY-MM-DD'),'NE','M','14','Darling St', 'Amherst', 'MA', '12345', '8754290454');
INSERT INTO Customer values(100026,'Veer','Singh',TO_DATE('1993-08-16','YYYY-MM-DD'),'NE','M','14','Darling St', 'Amherst', 'MA', '12345', '8754290454');
INSERT INTO Customer values(100027,'Akansha','Tarun',TO_DATE('1990-08-20','YYYY-MM-DD'),'NE','M','14','Darling St', 'Boston', 'MA', '12345', '8754290454');
INSERT INTO Customer values(100028,'James','Adam',TO_DATE('1990-09-20','YYYY-MM-DD'),'NE','M','14','Darling St', 'Boston', 'MA', '12345', '8754290454');
INSERT INTO Customer values(100029,'Kendall','Jen',TO_DATE('1996-04-21','YYYY-MM-DD'),'NE','M','14','Darling St', 'Boston', 'MA', '12345', '8754290454');
INSERT INTO Customer values(100030,'Kris','Brown',TO_DATE('1995-04-21','YYYY-MM-DD'),'NE','M','14','Darling St', 'Cambridge', 'MA', '12345', '8754290454');
INSERT INTO Customer values(100031,'Cam','Cristopher',TO_DATE('1992-03-21','YYYY-MM-DD'),'NE','M','14','Darling St', 'Cambridge', 'MA', '12345', '8754290454');
INSERT INTO Customer values(100032,'Cam','Cristopher',TO_DATE('1992-03-21','YYYY-MM-DD'),'NE','M','14','Darling St', 'Cambridge', 'MA', '12345', '8754290454');
INSERT INTO Customer values(100033,'Emily','Swan',TO_DATE('1990-03-23','YYYY-MM-DD'),'NE','M','14','Roxbury St', 'Cambridge', 'MA', '12345', '8754290454');
INSERT INTO Customer values(100034,'Rose','Melott',TO_DATE('1967-01-23','YYYY-MM-DD'),'NE','M','14','Roxbury St', 'Boston', 'MA', '12345', '8754290454');
INSERT INTO Customer values(100035,'Billy','Adam',TO_DATE('1966-01-27','YYYY-MM-DD'),'NE','M','14','Roxbury St', 'Cambridge', 'MA', '12345', '8754290454');
INSERT INTO Customer values(100036,'Hunter','Rodrigo',TO_DATE('1963-04-23','YYYY-MM-DD'),'NE','M','14','Roxbury St', 'Cambridge', 'MA', '12345', '8754290454');
INSERT INTO Customer values(100037,'Eddy','Rodrigo',TO_DATE('1960-04-23','YYYY-MM-DD'),'NE','M','14','Roxbury St', 'Cambridge', 'MA', '12345', '8754290454');
INSERT INTO Customer values(100038,'Anumeha','Jain',TO_DATE('1968-04-25','YYYY-MM-DD'),'NE','M','14','Tremont St', 'Cambridge', 'MA', '12345', '8754290454');
INSERT INTO Customer values(100039,'Saurav','Ganguly',TO_DATE('1956-04-29','YYYY-MM-DD'),'NE','M','14','Tremont St', 'Boston', 'MA', '12345', '8754290454');
INSERT INTO Customer values(100040,'Maddy','Adam',TO_DATE('1998-04-29','YYYY-MM-DD'),'NE','M','14','Tremont St', 'Boston', 'MA', '12345', '8754290454');
INSERT INTO Customer values(100041,'Vasu','Gupta',TO_DATE('1994-04-18','YYYY-MM-DD'),'NE','M','14','Tremont St', 'Amherst', 'MA', '12345', '8754290454');
INSERT INTO Customer values(100042,'Jain','Malik',TO_DATE('1994-04-12','YYYY-MM-DD'),'NE','M','14','Tremont St', 'Amherst', 'MA', '12345', '8754290454');
INSERT INTO Customer values(100043,'Daniel','Rick',TO_DATE('1992-04-14','YYYY-MM-DD'),'NE','M','14','Tremont St', 'Boston', 'MA', '12345', '8754290454');
INSERT INTO Customer values(100044,'Ranbir','Sohni',TO_DATE('1986-04-14','YYYY-MM-DD'),'NE','M','14','Tremont St', 'Cambridge', 'MA', '12345', '8754290454');
INSERT INTO Customer values(100045,'Dwanye','Jhon',TO_DATE('1985-04-15','YYYY-MM-DD'),'NE','M','14','Tremont St', 'Cambridge', 'MA', '12345', '8754290454');
INSERT INTO Customer values(100046,'Dipika','Sharma',TO_DATE('1983-03-17','YYYY-MM-DD'),'NE','M','14','Darling St', 'Cambridge', 'MA', '12345', '8754290454');
INSERT INTO Customer values(100047,'Ariana','James',TO_DATE('1991-03-17','YYYY-MM-DD'),'NE','M','14','Darling St', 'Boston', 'MA', '12345', '8754290454');
INSERT INTO Customer values(100048,'Emma','Rhodes',TO_DATE('1995-02-10','YYYY-MM-DD'),'NE','M','14','Roxbury St', 'Boston', 'MA', '12345', '8754290454');
INSERT INTO Customer values(100049,'Eva','Reeds',TO_DATE('1998-02-10','YYYY-MM-DD'),'NE','M','14','Roxbury St', 'Amherst', 'MA', '12345', '8754290454');
INSERT INTO Customer values(100050,'Nick','Brown',TO_DATE('1998-06-10','YYYY-MM-DD'),'NE','M','14','Roxbury St', 'Cambridge', 'MA', '12345', '8754290454');




INSERT INTO  LOAN_INTEREST values(1,44689319,'DMDD0333100',1,TO_DATE('2021-05-09','YYYY-MM-DD');
  
 INSERT INTO  LOAN_INTEREST values(2,77489838,'DMDD0101022',2,TO_DATE('1999-09-12','YYYY-MM-DD');
  INSERT INTO  LOAN_INTEREST values(3,63892734,'DMDD0454500',3,TO_DATE('2015-11-20','YYYY-MM-DD');
    INSERT INTO  LOAN_INTEREST values(4,63234734,'DMDD0101022',1,TO_DATE('2006-06-10','YYYY-MM-DD');
    NSERT INTO LOAN values(5,18467484,'DMDD0454500', 2,TO_DATE('2021-11-20','YYYY-MM-DD'));
INSERT INTO LOAN values(6,13892736,'DMDD0333100',3,TO_DATE('2011-01-02','YYYY-MM-DD'));
INSERT INTO LOAN values(7,53892734,'DMDD0101022',4,TO_DATE('2000-10-11','YYYY-MM-DD'));
INSERT INTO LOAN values(8,61292734,'DMDD0454500',2,TO_DATE('1991-11-10','YYYY-MM-DD'));
INSERT INTO LOAN values(9,18467484,'DMDD0454500',2,TO_DATE('2021-12-20','YYYY-MM-DD'));
INSERT INTO LOAN values(10,13892736,'DMDD0333100',3,TO_DATE('2011-03-22','YYYY-MM-DD'));                                      
                                      
         
                                      
                                      
                                      
                                      
-----------------------------------------------------------------------------------------------------
             ----------------------- promotion SP -------------------------------------------------------------------


CREATE OR REPLACE PROCEDURE PROMOTION(EMP IN NUMBER, POST IN VARCHAR)
AS

EMP_COUNT NUMBER := 0;
PREV_SALARY NUMBER := 0;
SAL NUMBER := 0;
CUR_POS VARCHAR(20);


BEGIN 

SELECT COUNT(*)
INTO EMP_COUNT 
FROM EMPLOYEE
WHERE EMPLOYEE_ID = EMP;

IF EMP_COUNT > 0 THEN

    SELECT SALARY INTO
    PREV_SALARY
    FROM EMPLOYEE
    WHERE EMPLOYEE_ID = EMP;
    
    SELECT EMP_ROLE INTO
    CUR_POS
    FROM EMPLOYEE
    WHERE EMPLOYEE_ID = EMP;
    
        IF LOWER(POST) = 'accountant' AND LOWER(CUR_POS) NOT IN ('banker','lic','provisionary officer')  THEN
            
            SAL := (PREV_SALARY + 5000);
            
            UPDATE EMPLOYEE 
            SET EMP_ROLE = POST,
            SALARY = SAL
            WHERE EMPLOYEE_ID=EMP;
            
            ELSIF  LOWER(POST) = 'provisionary officer' AND LOWER(CUR_POS) NOT IN ('banker','lic')  THEN
            
            SAL := (PREV_SALARY + 15000);
            
            UPDATE EMPLOYEE 
            SET EMP_ROLE = POST,
            SALARY = SAL
            WHERE EMPLOYEE_ID=EMP;
            
            ELSIF LOWER(POST) = 'banker' AND LOWER(CUR_POS) NOT IN ('banker')  THEN
            
            SAL := (PREV_SALARY + 25000);
            
            UPDATE EMPLOYEE 
            SET EMP_ROLE = POST,
            SALARY = SAL
            WHERE EMPLOYEE_ID=EMP;
            
             ELSIF LOWER(POST) = 'lic' AND LOWER(CUR_POS) NOT IN ('banker', 'provisionary officer')  THEN
            
            SAL := (PREV_SALARY + 10000);
            
            UPDATE EMPLOYEE 
            SET EMP_ROLE = POST,
            SALARY = SAL
            WHERE EMPLOYEE_ID=EMP;
             
        END IF;
        
END IF;      

EXCEPTION 

    WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('INVALID ERROR');
   
END;
/
                                      
                                      
----------------------how to run this ---------------------------
                                      
                                      
exec promotion(36940,'provisionary officer');   /// do not copy this in code
                                      
 -------------------------------------------------------------------
                                      
                                      
                                      
                                      
                                      
                  ----------------------------------------------------------------
CREATE OR REPLACE TRIGGER TRANSACTION_TRIG 
BEFORE INSERT ON  LOAN_TRANSACTIONS
FOR EACH ROW
DECLARE 
LOAN_TYPE NUMBER := 0;
Loan_COUNT number := 0;
AMT NUMBER := 0;
HIGH_LIMIT EXCEPTION;

BEGIN 

SELECT COUNT(*)
INTO LOAN_COUNT 
FROM LOAN
WHERE LoanAccNumber = :NEW.LoanAccNumber;

DBMS_OUTPUT.PUT_LINE(LOAN_COUNT);
IF LOAN_COUNT > 0 THEN

    SELECT Loan_Type 
    INTO LOAN_TYPE 
    FROM LOAN
    WHERE (LoanAccNumber = :NEW.LoanAccNumber) ;
    
    AMT := :NEW.AMOUNT;
    
    IF LOAN_TYPE = 1 THEN 
        
        IF AMT > 5000 THEN
            RAISE HIGH_LIMIT;
        END IF;
        
    ELSIF LOAN_TYPE = 3 THEN
    
         IF AMT > 10000 THEN
            RAISE HIGH_LIMIT;
         END IF;
    
    ELSIF LOAN_TYPE = 4 THEN 
        
         IF AMT > 7000 THEN
            RAISE HIGH_LIMIT;
         END IF;
    
    ELSE 
        DBMS_OUTPUT.PUT_LINE('WITHIN LIMIT');
    END IF;
    
END IF;

EXCEPTION 
    WHEN HIGH_LIMIT THEN
    RAISE_APPLICATION_ERROR(-20100,'PLEASE FOLLOW AMOUNT TRANSACTION LIMIT AS PER YOUR LOAN TYPE');

END;
/

----------------- procedure for loan transaction----------


CREATE OR REPLACE PROCEDURE LOAN_TRANSACTION(LID IN NUMBER, BIFSC IN VARCHAR, LIFSC IN VARCHAR, LOAN_ACC IN NUMBER, AMT IN NUMBER, DT IN DATE)
AS
TRIG_ERROR EXCEPTION;
PRAGMA EXCEPTION_INIT(TRIG_ERROR,-20100);

BEGIN

INSERT INTO LOAN_TRANSACTIONS
VALUES (LID,BIFSC,LIFSC,LOAN_ACC,AMT,DT);

EXCEPTION
    
    WHEN TRIG_ERROR THEN
    DBMS_OUTPUT.PUT_LINE('PLEASE FOLLOW AMOUNT TRANSACTION LIMIT AS PER YOUR LOAN TYPE');
    
     WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('INVALID ERROR');

END;
/                    
                                     
-------------------------------------------------------------------------------------------------
                                      
                                      INSERT INTO EMPLOYEE VALUES (012324, 1, 'Research', 'Akarsh', 'Singh', 'M',TO_DATE('1999-03-09','YYYY-MM-DD'), 120000, 'Accountant', 'akarshsinghh@gmail.com', 7710037766, '');
INSERT INTO EMPLOYEE VALUES (055564, 2, 'Sales', 'Alex', 'ONeil', 'M',TO_DATE('1997-10-06','YYYY-MM-DD'), 115000, 'Accountant', 'neilalex32@gmail.com', 8910037766, '');
INSERT INTO EMPLOYEE VALUES (037567, 3, 'Sales', 'Kylie', 'James', 'F',TO_DATE('1992-11-01','YYYY-MM-DD'), 130000, 'Accountant', 'thekyliejames@outlook.com', 8910032459, '');
INSERT INTO EMPLOYEE VALUES (036940, 3, 'Sales', 'Megan', 'Smith', 'F',TO_DATE('1999-06-30','YYYY-MM-DD'), 67000, 'Accountant', 'megans30@outlook.com', 8910076403, 037567);
INSERT INTO EMPLOYEE VALUES (036113, 3, 'Software', 'Ravi', 'Teja', 'M',TO_DATE('1998-06-13','YYYY-MM-DD'), 90000, 'Developer', 'tejaravi_tv@gmail.com', 8570076403, '');
INSERT INTO EMPLOYEE VALUES (036999, 3, 'Sales', 'Charlottee', 'Malik', 'F',TO_DATE('1997-02-12','YYYY-MM-DD'), 75000, 'Provisionary Officer', 'mcharlottee@outlook.com', 8579076403, 037567);
INSERT INTO EMPLOYEE VALUES (036941, 3, 'Marketing', 'Chang', 'Cho', 'O',TO_DATE('1995-03-24','YYYY-MM-DD'), 77000, 'Provisionary Officer', 'chochangg@outlook.com', 8910076507, '');
INSERT INTO EMPLOYEE VALUES (036942, 3, 'Operations', 'John', 'Ledger', 'M',TO_DATE('1998-06-17','YYYY-MM-DD'), 85000, 'Provisionary Officer', 'johnl@yahoo.com', 8910071122, 011818);
INSERT INTO EMPLOYEE VALUES (036933, 3, 'Operations', 'Mark', 'Benetton', 'M',TO_DATE('1997-10-30','YYYY-MM-DD'), 84000, 'Accountant', 'markbene@outlook.com', 8910072241, 011818);
INSERT INTO EMPLOYEE VALUES (011818, 3, 'Operations', 'Grace', 'Fernandes', 'F',TO_DATE('1982-09-27','YYYY-MM-DD'), 93000, 'Accountant', 'gracefernandes30@gmail.com', 8910078979, 037567);
INSERT INTO EMPLOYEE VALUES (056940, 2, 'Sales', 'Josh', 'Jacobs', 'M',TO_DATE('1987-07-18','YYYY-MM-DD'), 69000, 'Accountant', 'srjjacobs@outlook.com', 7120076403,055564);
INSERT INTO EMPLOYEE VALUES (056941, 2, 'Sales', 'Megan', 'Smith', 'F',TO_DATE('1999-06-30','YYYY-MM-DD'), 67000, 'Accountant', 'megansmithh@yahoo.com', 7770076403,055564);
INSERT INTO EMPLOYEE VALUES (056942, 2, 'Operations', 'Elle', 'Bridge', 'F',TO_DATE('1996-08-29','YYYY-MM-DD'), 72000, 'Associate', 'bridgeelle101@outlook.com', 8880072403, 059999);
INSERT INTO EMPLOYEE VALUES (056943, 2, 'Operations', 'Blake', 'Springer', 'M',TO_DATE('1994-06-30','YYYY-MM-DD'), 87000, 'LIC', 'springer.blake@gmail.com', 8999076403, 059999);
INSERT INTO EMPLOYEE VALUES (059999, 2, 'Operations', 'Ajit', 'Poonawala','O',TO_DATE('1975-10-21','YYYY-MM-DD'), 105000, 'LIC', 'poonawal.ajit1@gmail.com', 8999076400, 055564);
INSERT INTO EMPLOYEE VALUES (016940, 1, 'Sales', 'Ram', 'Charan', 'M',TO_DATE('1986-04-18','YYYY-MM-DD'), 69000, 'Accountant', 'rcharan@outlook.com', 8120076403,012324);
INSERT INTO EMPLOYEE VALUES (016941, 1, 'Sales', 'Sharvi', 'Jaffery', 'F',TO_DATE('1999-04-17','YYYY-MM-DD'), 67000, 'Accountant', 'sharvijj@gmail.com', 8770076403,012324);
INSERT INTO EMPLOYEE VALUES (016942, 1, 'Operations', 'Darren', 'Franco', 'M',TO_DATE('1993-08-29','YYYY-MM-DD'), 77000, 'LIC', 'd.franco@outlook.com', 8780076403, 019999);
INSERT INTO EMPLOYEE VALUES (016943, 1, 'Operations', 'Cherry', 'Chan', 'O',TO_DATE('1997-01-05','YYYY-MM-DD'), 72000, 'LIC', 'chancherry05@gmail.com', 7699076403, 019999);
INSERT INTO EMPLOYEE VALUES (019999, 1, 'Operations', 'Nick', 'Bilzerian','M',TO_DATE('1971-11-22','YYYY-MM-DD'), 107000, 'LIC', 'bilznick71@gmail.com', 8000076403, 012324);

INSERT INTO Employee values(100101, 1,'Insurance','Ayushi','Patel', 'F',DATE '1980-11-08',25000,'Accountant','ayushipatel@gmail.com',7856912345, 012324);
INSERT INTO Employee values(101101, 1,'Insurance','Ruchika','Sinha', 'F',DATE '1983-10-08',25000,'Accountant','ruchika19gmail.com',7856912389, 012324);
INSERT INTO Employee values(102101, 2, 'Credit cards','Akshit','Arora', 'M',DATE '1990-10-08',60000,'clerk','akshit20arora@gmail.com',7856912333,055564);
INSERT INTO Employee values(199111, 3,'Credit cards','Eddy','Sharma', 'M',DATE '1980-05-08',50000,'Provisionary Officer','eddysharma123@gmail.com',9999988889, 037567);
INSERT INTO Employee values(104131, 1,'Insurance','Aditya','Tilak', 'M',DATE '1989-10-08',50000,'Banker','adityatilak@gmail.com',7856912322, 012324);
INSERT INTO Employee values(105534, 3,'Private banking','Megshi','Thakur', 'F',DATE '1980-11-08',50000,'Clerk','megshithakur@gmail.com',7856912344, 037567);
INSERT INTO Employee values(105745, 2,'Credit cards','Rinita','Srivastva', 'F',DATE '1967-10-08',50000,'Provisionary Officer','rini@yahoo.com',7856913214, 055564);
INSERT INTO Employee values(107310, 3,'Credit cards','Sneha','Mohan', 'F',DATE '1999-10-08',90000,'Accountant','sneha@yahoo.com',7856913213, 037567);
INSERT INTO Employee values(109557, 2,'Insurance','Sidhant','Kohli', 'M',DATE '1995-10-04',30000,'LIC','sid@yahoo.com',7856913220, 055564);
INSERT INTO Employee values(110644, 3,'Private banking','Yash','Navadiya', 'M',DATE '1989-10-08',30000,'Accountant','yash@yahoo.com',7856913221, 037567);
INSERT INTO Employee values(111101, 1,'Private banking','Virendra','Singh', 'M',DATE '1986-10-08',70000,'Clerk','viv@yahoo.com',7856913229, 012324);
INSERT INTO Employee values(113104, 2,'Insurance','Radhika','Madan', 'F',DATE '1981-10-08',70000,'LIC','radhika@yahoo.com',7856913005, 055564);
INSERT INTO Employee values(114107, 1,'Private banking','Boney','Singh', 'M',DATE '1980-10-08',70000,'LIC','bon@yahoo.com',7856913008, 02324);
INSERT INTO Employee values(115005, 3,'Private banking','Disha','Parmar', 'F',DATE '1968-10-07',70000,'LIC','disha@yahoo.com',7856913007, 037567);
INSERT INTO Employee values(118202, 2,'Private banking','Barkha','Duta', 'F',DATE '1966-11-08',70000,'Banker','barkhadutt@yahoo.com',7856913777, 055564);
INSERT INTO Employee values(119324, 1,'Private banking','Mrinal','Sharma', 'F',DATE '1967-10-08',70000,'Banker','mrinal42@yahoo.com',7856914007, 012324);
INSERT INTO Employee values(120424, 1,'Private banking','Apsara','Sharma', 'F',DATE '1964-10-08',70000,'Banker','mrinal@yahoo.com',7856914003, 012324);

