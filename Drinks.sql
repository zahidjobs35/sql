-----------------Database----------------------

CREATE TABLE lnkemployees (
    emp_no      INT             NOT NULL,
    birth_date  DATE            NOT NULL,
    first_name  VARCHAR(14)     NOT NULL,
    last_name   VARCHAR(16)     NOT NULL,
    gender      CHAR(1)  NOT NULL,    
    hire_date   DATE            NOT NULL,
    PRIMARY KEY (emp_no)
);


CREATE TABLE lnkCustomer (
    Customer_ID      INT             NOT NULL,
    birth_date  DATE            NOT NULL,
    first_name  VARCHAR(14)     NOT NULL,
    last_name   VARCHAR(16)     NOT NULL,
    gender      CHAR(1)  NOT NULL    
);


CREATE TABLE lnkdepartments (
    dept_no     CHAR(4)         NOT NULL,
    dept_name   VARCHAR(40)     NOT NULL,
    PRIMARY KEY (dept_no),
    UNIQUE  KEY (dept_name)
);

CREATE TABLE Drink_Category (
   Category_ID       INT             NOT NULL,
   Category_Name     VARCHAR(40)        NOT NULL
   ); 

CREATE TABLE Drinks (
    Drinks_ID      INT             NOT NULL,
    Category_ID     CHAR(4)         NOT NULL,
    Mixed_Item   CHAR(4)           NOT NULL,
    Expire_date     Date          NOT NULL,
    Drink_Type  CHAR(4)
);

CREATE TABLE lnkSales (
    Sales_ID      INT             NOT NULL,
    Drinks_ID       VARCHAR(50)     NOT NULL,
    Unit_Price   INT           NOT NULL,
    Quantity     INT,
    Amount       INT,
	Sales_Date   date
); 

CREATE TABLE lnkReceipt (
    Receipt_ID      INT             NOT NULL,
    Customer_ID       VARCHAR(50)     NOT NULL,
    Sales_ID   INT           NOT NULL,
    Amount       INT,
	Receipt_Date   Date
); 

CREATE TABLE lnksalaries (
    emp_no      INT             NOT NULL,
    salary      INT             NOT NULL,
    from_date   DATE            NOT NULL,
    to_date     DATE            NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES employees (emp_no) ON DELETE CASCADE,
    PRIMARY KEY (emp_no, from_date)
) 
; 
