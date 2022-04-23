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
                                      
                       
                                      
                                      
                                      
                                      
                                      
                                      
                                      
