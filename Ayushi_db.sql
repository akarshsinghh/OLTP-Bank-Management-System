
CREATE TABLE Branch (
BranchIFSC Char(11) PRIMARY KEY ,
Branch_ID   int UNIQUE,
Address  VARCHAR(20) NOT NULL,
Street  VARCHAR(20)NOT NULL,
City   VARCHAR(20) NOT NULL,
State Char(2) NOT NULL,
Zipcode int,
Manager_ID int CONSTRAINTS Positive_Manager_ID CHECK(Manager_ID>0)
);

DESC Branch;

CREATE TABLE Branch_Supplier (
Supplier_ID int PRIMARY KEY,
Supplier_Name  VARCHAR(20) NOT NULL,
Supplier_Type  VARCHAR(20),
Branch_ID NUMBER,
CONSTRAINT FK_Branch_ID FOREIGN KEY (Branch_ID) REFERENCES Branch(Branch_ID));
