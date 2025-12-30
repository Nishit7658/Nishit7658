CREATE DATABASE NISHTI;
USE NISHTI;

-------------------
-------------------
----Practical 1----
-------------------
-------------------

-- DEPOSIT Table
CREATE TABLE DEPOSIT(
    ACTNO VARCHAR(5) PRIMARY KEY,
    CNAME VARCHAR(10),
    BNAME VARCHAR(15),
    AMOUNT NUMERIC(8,2),
    ADATE DATE
);

INSERT INTO DEPOSIT (ACTNO, CNAME, BNAME, AMOUNT, ADATE)
VALUES
('100', 'ANIL',    'VRCE',        1000.00, STR_TO_DATE('1-MAR-95', '%d-%b-%y')),
('101', 'SUNIL',   'AJNI',        5000.00, STR_TO_DATE('4-JAN-96', '%d-%b-%y')),
('102', 'MEHUL',   'KAROLBAGH',   3500.00, STR_TO_DATE('17-NOV-95', '%d-%b-%y')),
('104', 'MADHURI', 'CHANDI',      1200.00, STR_TO_DATE('17-DEC-95', '%d-%b-%y')),
('105', 'PRMOD',   'M.G.ROAD',    3000.00, STR_TO_DATE('27-MAR-96', '%d-%b-%y')),
('106', 'SANDIP',  'ANDHERI',     2000.00, STR_TO_DATE('31-MAR-96', '%d-%b-%y')),
('107', 'SHIVANI', 'VIRAR',       1000.00, STR_TO_DATE('5-SEP-95', '%d-%b-%y')),
('108', 'KRANTI',  'NEHRU PLACE', 5000.00, STR_TO_DATE('2-JUL-95', '%d-%b-%y')),
('109', 'MINU',    'POWAI',       7000.00, STR_TO_DATE('10-AUG-95', '%d-%b-%y'));

-- BRANCH Table
CREATE TABLE BRANCH (
    BNAME VARCHAR(18) PRIMARY KEY,
    CITY VARCHAR(18)
);

INSERT INTO BRANCH VALUES
('VRCE', 'NAGPUR'),
('AJNI', 'NAGPUR'),
('KAROLBAGH', 'DELHI'),
('CHANDI', 'DELHI'),
('DHARAMPETH', 'NAGPUR'),
('M.G.ROAD', 'BANGLORE'),
('ANDHERI', 'BOMBAY'),
('VIRAR', 'BOMBAY'),
('NEHRU PLACE', 'DELHI'),
('POWAI', 'BOMBAY');

-- CUSTOMERS Table
CREATE TABLE CUSTOMERS (
    CNAME VARCHAR(19) PRIMARY KEY,
    CITY VARCHAR(18)
);

INSERT INTO CUSTOMERS VALUES
('ANIL', 'CALCUTTA'),
('SUNIL', 'DELHI'),
('MEHUL', 'BARODA'),
('MANDAR', 'PATNA'),
('MADHURI', 'NAGPUR'),
('PRAMOD', 'NAGPUR'),
('SANDIP', 'SURAT'),
('SHIVANI', 'BOMBAY'),
('KRANTI', 'BOMBAY'),
('NAREN', 'BOMBAY');

-- BORROW Table
CREATE TABLE BORROW (
    LOANNO VARCHAR(5) PRIMARY KEY,
    CNAME VARCHAR(18),
    BNAME VARCHAR(18),
    AMOUNT NUMERIC(8,2)
);

INSERT INTO BORROW VALUES
('201', 'ANIL', 'VRCE', 1000.00),
('206', 'MEHUL', 'AJNI', 5000.00),
('311', 'SUNIL', 'DHARAMPETH', 3000.00),
('321', 'MADHURI', 'ANDHERI', 2000.00),
('375', 'PRMOD', 'VIRAR', 8000.00),
('481', 'KRANTI', 'NEHRU PLACE', 3000.00);

-- Describe Tables
DESCRIBE DEPOSIT;
DESCRIBE BRANCH;
DESCRIBE BORROW;
DESCRIBE CUSTOMERS;

-------------------
-------------------
----Practical 2----
-------------------
-------------------

SELECT * FROM DEPOSIT;
SELECT * FROM BORROW;
SELECT * FROM CUSTOMERS;
SELECT * FROM BRANCH;

-- Account number and amount of depositors
SELECT ACTNO, AMOUNT FROM DEPOSIT;

-- Names of depositors with amount > 4000
SELECT CNAME FROM DEPOSIT WHERE AMOUNT > 4000;

-- Names of customers who opened account after 1-Dec-1995
SELECT CNAME FROM DEPOSIT WHERE ADATE > '1995-12-01';

SHOW COLUMNS FROM CUSTOMERS;

SELECT CNAME, AMOUNT FROM BORROW;

SELECT BNAME, CITY FROM BRANCH;

SELECT DISTINCT D.CNAME
FROM DEPOSIT D
JOIN BORROW B ON D.CNAME = B.CNAME;

-------------------
-------------------
----Practical 3----
-------------------
-------------------

-- JOB Table
CREATE TABLE JOB (
  JOB_ID VARCHAR(10) PRIMARY KEY,
  JOB_NAME VARCHAR(30),
  MIN_SAL NUMERIC(8,2),
  MAX_SAL NUMERIC(8,2)
);

INSERT INTO JOB (JOB_ID, JOB_NAME, MIN_SAL, MAX_SAL) VALUES
('IT_PROG', 'Programmer', 4000, NULL),
('MK-MGR', 'Marketing Manager', 9000, 15000),
('FI-MGR', 'Finance Manager', 8200, 12000),
('FI-ACC', 'Account', 4200, NULL),
('LEC', 'Lecturer', 6000, NULL),
('COMP OP', 'Computer Operator', 1500, 3000);

-- DEPT Table
CREATE TABLE DEPT (
  DEPTNO INT PRIMARY KEY,
  DEPT_NAME VARCHAR(30),
  DEPT_LOC VARCHAR(30),
  JOB_ID VARCHAR(10),
  FOREIGN KEY (JOB_ID) REFERENCES JOB(JOB_ID)
);

INSERT INTO DEPT (DEPTNO, DEPT_NAME, DEPT_LOC, JOB_ID) VALUES
(10, 'Account', 'New York', 'IT_PROG'),
(20, 'Research', 'Delhi', 'MK MGR'),
(30, 'Sales', 'Chicago', 'FI MGR'),
(40, 'Operations', 'Boston', 'FI ACC');

-- EMP Table
CREATE TABLE EMP (
  EMPNO INT PRIMARY KEY,
  DEPTNO INT,
  EMPNAME VARCHAR(30),
  ROLE VARCHAR(30),
  ROLE_ID INT,
  HIREDATE DATE,
  MGRNO INT,
  FOREIGN KEY (DEPTNO) REFERENCES DEPT(DEPTNO)
);

INSERT INTO EMP (EMPNO, DEPTNO, EMPNAME, ROLE, ROLE_ID, HIREDATE, MGRNO) VALUES
(101, 20, 'Ward', 'Salesman', 7697, '1995-02-22', 102),
(102, 20, 'Jones', 'Manager', 7839, '1990-06-15', 103),
(103, 20, 'Martin', 'Salesman', 7697, '1993-04-23', 102),
(104, 40, 'Blake', 'Manager', 7839, '1992-05-01', 105),
(105, 10, 'Clark', 'Manager', 7839, '1995-10-02', 106),
(106, 10, 'Scott', 'Analyst', 7565, '1991-12-09', 105),
(107, 30, 'King', 'President', 7000, '1994-01-17', NULL);

-- 1. Add emp_address column
ALTER TABLE EMP ADD EMP_ADDRESS VARCHAR(50);

-- 2. Drop emp_address column
ALTER TABLE EMP DROP COLUMN EMP_ADDRESS;

-- 3. Modify ACTNO in DEPOSIT table
ALTER TABLE DEPOSIT MODIFY ACTNO CHAR(5);

-- 4. Update min_sal where it's blank
UPDATE JOB SET MIN_SAL = 0 WHERE MIN_SAL IS NULL;

-- 5. Retrieve all data
SELECT * FROM EMP;
SELECT * FROM JOB;
SELECT * FROM DEPOSIT;

-- 6. Account details between two dates
SELECT ACTNO, AMOUNT FROM DEPOSIT
WHERE ADATE BETWEEN '1996-01-01' AND '1996-08-31';

-- 7. Jobs with min salary > 4000
SELECT * FROM JOB WHERE MIN_SAL > 4000;

-- 8. Employee name & salary from dept 20 with alias
SELECT EMPNAME AS "Employee Name", ROLE_ID AS "Salary"
FROM EMP WHERE DEPTNO = 20;

-- 9. Employee details from dept 10 or 20
SELECT EMPNO, EMPNAME, DEPTNO FROM EMP
WHERE DEPTNO IN (10, 20);

-------------------
-------------------
----Practical 4----
-------------------
-------------------

-- 1. employee whose name start with ‘A’
SELECT * FROM EMP
WHERE EMPNAME LIKE 'A_a%';

-- 2. ame, number and salary of those employees whose name is 5 characters long and first three characters are ‘Ani’.
SELECT EMPNAME, EMPNO, ROLE_ID AS Salary
FROM EMP
WHERE EMPNAME LIKE 'Ani__';

-- 3. on-null values of employees emp name sec char n and string 5 char long
SELECT * FROM EMP
WHERE EMPNAME IS NOT NULL
AND EMPNAME LIKE '_n___';

-- 4. null value of emp and emp name third char a
SELECT * FROM EMP
WHERE EMPNAME IS NULL
OR EMPNAME LIKE '__a%';

-- 5. if you are giving LIKE predicate as ‘%\_%’ ESCAPE ‘\’
SELECT EMPNAME
FROM EMP
WHERE EMPNAME LIKE '%\\_%';


-------------------
-------------------
----Practical 5----
-------------------
-------------------

-- 1. Total deposit
SELECT SUM(AMOUNT) AS Total_Deposit FROM DEPOSIT;

-- 2. Total loan from Karolbagh branch
SELECT SUM(AMOUNT) AS Total_Loan FROM BORROW WHERE BNAME = 'KAROLBAGH';

-- 3. Maximum loan from VRCE branch
SELECT MAX(AMOUNT) AS Max_Loan FROM BORROW WHERE BNAME = 'VRCE';

-- 4. Total number of customers
SELECT COUNT(*) AS Total_Customers FROM CUSTOMERS;

-- 5. Total number of customer cities
SELECT COUNT(DISTINCT CITY) AS Unique_Cities FROM CUSTOMERS;

-- 6. Create supplier from employee (all columns)
CREATE TABLE SUPPLIER AS SELECT * FROM EMP;

-- 7. Create sup1 from employee (first two columns)
CREATE TABLE SUP1 AS SELECT EMPNO, DEPTNO FROM EMP;

-- 8. Create sup2 from employee with no data
CREATE TABLE SUP2 AS SELECT * FROM EMP WHERE 1=0;

-- 9. Insert into sup2 where second char is 'n' and length is 5
INSERT INTO SUP2
SELECT * FROM EMP
WHERE EMPNAME LIKE '_n___';

-- 10. (continued from 9) — already included above

-- 11. Delete all rows from sup1
DELETE FROM SUP1;

-- 12. Delete supplier with sup_no = 103
DELETE FROM SUPPLIER WHERE EMPNO = 103;

-- 13. Rename sup2
RENAME TABLE SUP2 TO SUP2_RENAMED;

-- 14. Drop sup1
DROP TABLE SUP1;

-- 15. Update dept_no to 10 where second char of name is 'm'
UPDATE EMP SET DEPTNO = 10 WHERE EMPNAME LIKE '_m%';

-- 16. Update employee name where empno = 103
UPDATE EMP SET EMPNAME = 'UpdatedName' WHERE EMPNO = 103;

-- Display current date
SELECT CURRENT_DATE() AS Date;

-- 17. Salary increased by 15%
SELECT EMPNO, ROLE, ROLE_ID AS Salary,
ROUND(ROLE_ID * 1.15) AS New_Salary
FROM EMP;

-- 18. Add Increase column
SELECT EMPNO, ROLE, ROLE_ID AS Salary,
ROUND(ROLE_ID * 1.15) AS New_Salary,
ROUND(ROLE_ID * 0.15) AS Increase
FROM EMP;

-- 19. Capitalize first letter, show length, filter by J, A, M
SELECT CONCAT(UCASE(LEFT(EMPNAME,1)), LCASE(SUBSTRING(EMPNAME,2))) AS Formatted_Name,
LENGTH(EMPNAME) AS Name_Length
FROM EMP
WHERE EMPNAME LIKE 'J%' OR EMPNAME LIKE 'A%' OR EMPNAME LIKE 'M%'
ORDER BY EMPNAME;

-- 20. "<last name> earns <salary> monthly"
SELECT CONCAT(EMPNAME, ' earns ', ROLE_ID, ' monthly') AS Statement FROM EMP;

-- 21. Name, hire date, months employed, weekday
SELECT EMPNAME, HIREDATE,
TIMESTAMPDIFF(MONTH, HIREDATE, CURRENT_DATE()) AS Months_Employed,
DAYNAME(HIREDATE) AS Start_Day
FROM EMP
ORDER BY FIELD(DAYNAME(HIREDATE), 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday');

-- 22. Hiredate formatted as "7th of June 1994 12:00:00 AM"
SELECT DATE_FORMAT(HIREDATE, '%D of %M %Y %r') AS Formatted_Hiredate FROM EMP;

-- 23. Annual compensation (salary + commission)
-- Assuming COMM column exists; if not, use 0
SELECT EMPNAME, (ROLE_ID + IFNULL(COMM, 0)) * 12 AS Annual_Compensation FROM EMP;

---------------------
--Manipulating Data--
---------------------

-- 1. Add 10% interest to all depositors
UPDATE DEPOSIT
SET AMOUNT = AMOUNT * 1.10;

-- 2. Add 10% interest to depositors in branch 'VRCE'
UPDATE DEPOSIT
SET AMOUNT = AMOUNT * 1.10
WHERE BNAME = 'VRCE';

-- 3. Add 10% interest to depositors living in Nagpur and branch city is Bombay
UPDATE DEPOSIT
SET AMOUNT = AMOUNT * 1.10
WHERE CNAME IN (
  SELECT CNAME FROM CUSTOMER
  WHERE CITY = 'NAGPUR'
)
AND BNAME = 'BOMBAY';

-- 4. Change dept_no of employees with job of empno 7788 to dept_no of empno 7844
UPDATE EMP
SET DEPTNO = (
  SELECT DEPTNO FROM EMP WHERE EMPNO = 7844
)
WHERE JOB = (
  SELECT JOB FROM EMP WHERE EMPNO = 7788
);

-- 5. Transfer ₹10 from Anil to Sunil if both are in same branch
UPDATE DEPOSIT
SET AMOUNT = AMOUNT - 10
WHERE CNAME = 'ANIL'
AND BNAME = (
  SELECT BNAME FROM DEPOSIT WHERE CNAME = 'SUNIL'
);

UPDATE DEPOSIT
SET AMOUNT = AMOUNT + 10
WHERE CNAME = 'SUNIL'
AND BNAME = (
  SELECT BNAME FROM DEPOSIT WHERE CNAME = 'ANIL'
);

-- 6. Add ₹100 to depositors who are max depositors in their branch
UPDATE DEPOSIT
SET AMOUNT = AMOUNT + 100
WHERE (BNAME, AMOUNT) IN (
  SELECT BNAME, MAX(AMOUNT)
  FROM DEPOSIT
  GROUP BY BNAME
);

-- 7. Delete depositors from branches with 1 to 3 customers
DELETE FROM DEPOSIT
WHERE BNAME IN (
  SELECT BNAME FROM CUSTOMER
  GROUP BY BNAME
  HAVING COUNT(*) BETWEEN 1 AND 3
);

-- 8. Delete deposit of Vijay
DELETE FROM DEPOSIT WHERE CNAME = 'VIJAY';

-- 9. Delete borrowers from branches with avg loan < 1000
DELETE FROM BORROW
WHERE BNAME IN (
  SELECT BNAME FROM BORROW
  GROUP BY BNAME
  HAVING AVG(AMOUNT) < 1000
);

-------------------
-------------------
----Practical 6----
-------------------
-------------------

-- 1. Total deposit of customers with account date after 1-Jan-96
SELECT SUM(AMOUNT) AS Total_Deposit
FROM DEPOSIT
WHERE ACDATE > '1996-01-01';

-- 2. Total deposit of customers living in Nagpur
SELECT SUM(D.AMOUNT) AS Total_Deposit
FROM DEPOSIT D
JOIN CUSTOMER C ON D.CNAME = C.CNAME
WHERE C.CITY = 'NAGPUR';

-- 3. Maximum deposit of customers living in Bombay
SELECT MAX(D.AMOUNT) AS Max_Deposit
FROM DEPOSIT D
JOIN CUSTOMER C ON D.CNAME = C.CNAME
WHERE C.CITY = 'BOMBAY';

-- 4. Highest, lowest, sum, and average salary (rounded)
SELECT 
  ROUND(MAX(SAL)) AS Maximum,
  ROUND(MIN(SAL)) AS Minimum,
  ROUND(SUM(SAL)) AS Sum,
  ROUND(AVG(SAL)) AS Average
FROM EMP;

-- 5. Difference between highest and lowest salaries
SELECT 
  MAX(SAL) - MIN(SAL) AS DIFFERENCE
FROM EMP;

-- 6. Total employees and count hired in 1995–1998
SELECT 
  COUNT(*) AS Total_Employees,
  SUM(YEAR(HIREDATE) = 1995) AS Hired_1995,
  SUM(YEAR(HIREDATE) = 1996) AS Hired_1996,
  SUM(YEAR(HIREDATE) = 1997) AS Hired_1997,
  SUM(YEAR(HIREDATE) = 1998) AS Hired_1998
FROM EMP;

-- 7. Average salary per department (without showing dept_no)
SELECT ROUND(AVG(SAL)) AS Avg_Salary
FROM EMP
GROUP BY DEPTNO;

-- 8. Total salary per job title within each department
SELECT DEPTNO, JOB, SUM(SAL) AS Total_Salary
FROM EMP
GROUP BY DEPTNO, JOB;

-- 9. Average salaries > 2000 per department (without showing dept_no)
SELECT ROUND(AVG(SAL)) AS Avg_Salary
FROM EMP
GROUP BY DEPTNO
HAVING AVG(SAL) > 2000;

-- 10. Job and total salary > 3000, excluding 'PRESIDENT', sorted by total salary
SELECT JOB, SUM(SAL) AS Total_Salary
FROM EMP
WHERE JOB <> 'PRESIDENT'
GROUP BY JOB
HAVING SUM(SAL) > 3000
ORDER BY Total_Salary;

-- 11. Branches with deposit sum > 5000 and located in Bombay
SELECT D.BNAME, SUM(D.AMOUNT) AS Total_Deposit
FROM DEPOSIT D
JOIN BRANCH B ON D.BNAME = B.BNAME
WHERE B.CITY = 'BOMBAY'
GROUP BY D.BNAME
HAVING SUM(D.AMOUNT) > 5000;

-------------------
-------------------
----Practical 7----
-------------------
-------------------

-- 1. Employees in same department as SCOTT (excluding SCOTT)
SELECT EMPNAME, HIREDATE
FROM EMP
WHERE DEPTNO = (
  SELECT DEPTNO FROM EMP WHERE EMPNAME = 'SCOTT'
)
AND EMPNAME <> 'SCOTT';  -- Exclude SCOTT from result

-- 2. Customers who are depositors in same branch city as SUNIL
SELECT DISTINCT D.CNAME
FROM DEPOSIT D
JOIN BRANCH B ON D.BNAME = B.BNAME
WHERE B.CITY = (
  SELECT CITY FROM CUSTOMERS WHERE CNAME = 'SUNIL'
);  -- Match branch city with SUNIL's city

-- 3. Deposit and loan details of customers in same city as PRAMOD
-- Deposit details
SELECT D.*
FROM DEPOSIT D
JOIN CUSTOMERS C ON D.CNAME = C.CNAME
WHERE C.CITY = (
  SELECT CITY FROM CUSTOMERS WHERE CNAME = 'PRAMOD'
);

-- Loan details
SELECT B.*
FROM BORROW B
JOIN CUSTOMERS C ON B.CNAME = C.CNAME
WHERE C.CITY = (
  SELECT CITY FROM CUSTOMERS WHERE CNAME = 'PRAMOD'
);

-- 4. Employees earning more than average salary
SELECT EMPNO, EMPNAME, ROLE_ID AS Salary
FROM EMP
WHERE ROLE_ID > (
  SELECT AVG(ROLE_ID) FROM EMP
)
ORDER BY ROLE_ID ASC;  -- Sorted by salary

-- 5. Depositors from same city as ANIL with deposit > 2000
SELECT D.CNAME
FROM DEPOSIT D
JOIN CUSTOMERS C ON D.CNAME = C.CNAME
WHERE C.CITY = (
  SELECT CITY FROM CUSTOMERS WHERE CNAME = 'ANIL'
)
AND D.AMOUNT > 2000;

-- 6. Employees reporting to FORD
SELECT E.EMPNAME, E.ROLE_ID AS Salary
FROM EMP E
WHERE E.MGRNO = (
  SELECT EMPNO FROM EMP WHERE EMPNAME = 'FORD'
);  -- Match manager number with FORD's employee number

-- 7. Employees in the Accounting department
SELECT E.DEPTNO, D.DEPT_NAME, E.ROLE
FROM EMP E
JOIN DEPT D ON E.DEPTNO = D.DEPTNO
WHERE D.DEPT_NAME = 'Account';

-- 8. Branch with highest number of depositors
SELECT BNAME
FROM DEPOSIT
GROUP BY BNAME
ORDER BY COUNT(*) DESC
LIMIT 1;  -- Top branch by depositor count

-- 9. City with maximum number of branches
SELECT CITY
FROM BRANCH
GROUP BY CITY
ORDER BY COUNT(*) DESC
LIMIT 1;

-- 10. Customers living in city with most depositors
SELECT C.CNAME
FROM CUSTOMERS C
WHERE C.CITY = (
  SELECT C2.CITY
  FROM DEPOSIT D
  JOIN CUSTOMERS C2 ON D.CNAME = C2.CNAME
  GROUP BY C2.CITY
  ORDER BY COUNT(*) DESC
  LIMIT 1
);

-------------------
-------------------
----Practical 8----
-------------------
-------------------

-- 1. Details of customer ANIL
SELECT * FROM CUSTOMERS
WHERE CNAME = 'ANIL';  -- Fetch full record for ANIL

-- 2. Customers who are both borrowers and depositors and live in Nagpur
SELECT DISTINCT C.CNAME
FROM CUSTOMERS C
JOIN DEPOSIT D ON C.CNAME = D.CNAME
JOIN BORROW B ON C.CNAME = B.CNAME
WHERE C.CITY = 'NAGPUR';

-- 3. City name of customers having same living branch
SELECT DISTINCT C.CITY
FROM CUSTOMERS C
JOIN DEPOSIT D ON C.CNAME = D.CNAME
JOIN BRANCH B ON D.BNAME = B.BNAME
WHERE C.CITY = B.CITY;  -- Match customer city with branch city

-- 4. Employee last name, department number, and department name
SELECT E.EMPNAME AS Last_Name, E.DEPTNO, D.DEPT_NAME
FROM EMP E
JOIN DEPT D ON E.DEPTNO = D.DEPTNO;

-- 5. Unique jobs in department 30 with department location
SELECT DISTINCT E.ROLE AS Job_Title, D.DEPT_LOC AS Location
FROM EMP E
JOIN DEPT D ON E.DEPTNO = D.DEPTNO
WHERE E.DEPTNO = 30;

-- 6. Employees working in NEW YORK
SELECT E.EMPNAME, E.DEPTNO, D.DEPT_NAME
FROM EMP E
JOIN DEPT D ON E.DEPTNO = D.DEPTNO
WHERE D.DEPT_LOC = 'New York';

-- 7. Employee and manager details
SELECT E.EMPNAME AS Employee, E.EMPNO AS Emp#,
       M.EMPNAME AS Manager, M.EMPNO AS Mgr#
FROM EMP E
JOIN EMP M ON E.MGRNO = M.EMPNO;

-- 8. Employees hired after SCOTT
SELECT EMPNAME, HIREDATE
FROM EMP
WHERE HIREDATE > (
  SELECT HIREDATE FROM EMP WHERE EMPNAME = 'SCOTT'
);

-------------------
-------------------
----Practical 9----
-------------------
-------------------

-- Create a sample table for demonstration
CREATE TABLE TRANSACTIONS (
  ID INT PRIMARY KEY,
  NAME VARCHAR(20),
  AMOUNT NUMERIC(8,2)
);

-- Insert initial data
INSERT INTO TRANSACTIONS VALUES (1, 'Anil', 1000);
INSERT INTO TRANSACTIONS VALUES (2, 'Sunil', 1500);
INSERT INTO TRANSACTIONS VALUES (3, 'Mehul', 2000);

-- Start transaction (implicit in most DBMS)
-- Make some changes
UPDATE TRANSACTIONS SET AMOUNT = AMOUNT + 500 WHERE NAME = 'Anil';

-- Create a savepoint
SAVEPOINT sp1;

-- More changes
UPDATE TRANSACTIONS SET AMOUNT = AMOUNT - 300 WHERE NAME = 'Sunil';

-- Create another savepoint
SAVEPOINT sp2;

-- Undo changes after sp2
ROLLBACK TO sp2;

-- Commit all changes before sp2
COMMIT;

-- Start transaction
UPDATE TRANSACTIONS SET AMOUNT = AMOUNT + 100 WHERE NAME = 'Mehul';

-- Oops! Something went wrong
ROLLBACK;  -- Undo all uncommitted changes

-- Update and finalize
UPDATE TRANSACTIONS SET AMOUNT = AMOUNT + 200 WHERE NAME = 'Sunil';
COMMIT;  -- Save changes permanently

--------------------
--------------------
----Practical 10----
--------------------
--------------------

-- Cursor Implementation
DECLARE
  CURSOR emp_cursor IS
    SELECT EMPNAME, ROLE_ID FROM EMP;

  v_name EMP.EMPNAME%TYPE;
  v_salary EMP.ROLE_ID%TYPE;
BEGIN
  OPEN emp_cursor;
  LOOP
    FETCH emp_cursor INTO v_name, v_salary;
    EXIT WHEN emp_cursor%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE('Name: ' || v_name || ', Salary: ' || v_salary);
  END LOOP;
  CLOSE emp_cursor;
END;
/

-- Trigger Implementation

CREATE TABLE EMP_LOG (
  LOG_ID INT PRIMARY KEY,
  EMPNAME VARCHAR(30),
  ACTION_DATE DATE
);

CREATE SEQUENCE EMP_LOG_SEQ START WITH 1 INCREMENT BY 1;

CREATE OR REPLACE TRIGGER trg_emp_insert
AFTER INSERT ON EMP
FOR EACH ROW
BEGIN
  INSERT INTO EMP_LOG (LOG_ID, EMPNAME, ACTION_DATE)
  VALUES (
    EMP_LOG_SEQ.NEXTVAL,
    :NEW.EMPNAME,
    SYSDATE
  );
END;
/





DELIMITER //
CREATE FUNCTION total_marks(m1 INT, m2 INT, m3 INT)
RETURNS INT
DETERMINISTIC
BEGIN
   RETURN (m1 + m2 + m3);
END //
DELIMITER ;

SELECT total_marks(80, 75, 90) AS Total;