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
    
    
