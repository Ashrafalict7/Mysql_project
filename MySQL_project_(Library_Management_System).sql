# Mysql project (Library Management System) : --
#
# You are going to build a project based on Library Management System.
# It keeps track of all information about books in the library, their cost, status and total number of books available in the library.
#
# Create a database named library and create the following TABLES in the database: --
# 1. Branch
# 2. Employee
# 3. Customer
# 4. IssueStatus
# 5. ReturnStatus
# 6. Books
#
# Attributes for the tables: --
# 1. Branch
#  Branch_no - Set as PRIMARY KEY
#  Manager_Id
#  Branch_address
#  Contact_no
#
# 2. Employee
#  Emp_Id – Set as PRIMARY KEY
#  Emp_name
#  Position
#  Salary Please Note: Manager_Id from Branch table can be considered as Emp_Id in Employee table.
#
# 3. Customer
#  Customer_Id - Set as PRIMARY KEY
#  Customer_name
#  Customer_address
#  Reg_date
#
# 4. IssueStatus
#  Issue_Id - Set as PRIMARY KEY
#  Issued_cust – Set as FOREIGN KEY, and it refers customer_id in CUSTOMER table
#  Issued_book_name
#  Issue_date
#  Isbn_book – Set as FOREIGN KEY, and it should refer isbn in BOOKS table
#
# 5. ReturnStatus
#  Return_Id - Set as PRIMARY KEY
#  Return_cust
#  Return_book_name
#  Return_date
#  Isbn_book2 - Set as FOREIGN KEY, and it should refer isbn in BOOKS table
#
# 6. Books
#  ISBN - Set as PRIMARY KEY
#  Book_title
#  Category
#  Rental_Price
#  Status [Give yes if book available and no if book not available]
#  Author
#  Publisher
#
# Write the queries for the following: --
# 1. Retrieve the book title, category, and rental price of all available books.
# 2. List the employee names and their respective salaries in descending order of salary.
# 3. Retrieve the book titles and the corresponding customers who have issued those books.
# 4. Display the total count of books in each category.
# 5. Retrieve the employee names and their positions for the employees whose salaries are above Rs.50,000.
# 6. List the customer names who registered before 2022-01-01 and have not issued any books yet.
# 7. Display the branch numbers and the total count of employees in each branch.
# 8. Display the names of customers who have issued books in the month of June 2023.
# 9. Retrieve book_title from book table containing history.
# 10. Retrieve the branch numbers along with the count of employees for branches having more than 5 employees.
#
# ---------------------------------------------------------------------------------------------------------------------
# 
# Create a database named Library and create the following TABLES in the database: --
# 1. Branch
# 2. Employee
# 3. Customer
# 4. IssueStatus
# 5. ReturnStatus
# 6. Books
#
# Create "library" database --
#
CREATE DATABASE Library;
#
# Use "library" database --
#
USE Library;
#
# 1. Branch --
#  Branch_no - Set as PRIMARY KEY
#  Manager_Id
#  Branch_address
#  Contact_no
# Please Note: "Manager_Id" from "Branch" table can be considered as "Emp_Id" in "Employee" table
#
# Create "Branch" table --
#
CREATE TABLE Branch (
Branch_no INT PRIMARY KEY,
Manager_Id INT,
Branch_address VARCHAR(50),
Contact_no BIGINT,
FOREIGN KEY (Manager_Id) REFERENCES Employee(Emp_Id));
#
INSERT INTO Branch (Branch_no, Manager_Id, Branch_address, Contact_no) VALUES
(1, 71, 'Ernamkulam', 8567201445),
(2, 72, 'Kottayam', 9055479960),
(3, 73, 'Kannur', 9856200144),
(4, 74, 'kozhikkod', 8795670112),
(5, 75, 'Malappuram', 8550051703),
(6, 76, 'Alappuzha', 9158847641);
#
SELECT * FROM Branch;
#
# Output "Branch" table --
# Branch_no___Manager_Id___Branch_address___Contact_no
# 1___________71___________Ernamkulam_______8567201445
# 2___________72___________Kottayam_________9055479960
# 3___________73___________Kannur___________9856200144
# 4___________74___________kozhikkod________8795670112
# 5___________75___________Malappuram_______8550051703
# 6___________76___________Alappuzha________9158847641
#
# 2. Employee --
#  Emp_Id – Set as PRIMARY KEY
#  Emp_name
#  Position
#  Salary 
# Please Note: "Manager_Id" from "Branch" table can be considered as "Emp_Id" in "Employee" table.
#
# Create "Employee" table --
#
CREATE TABLE Employee (
Emp_Id INT PRIMARY KEY,
Emp_name VARCHAR(30),
Position VARCHAR(30),
Salary DECIMAL);
#
INSERT INTO Employee (Emp_Id, Emp_name, Position, Salary) VALUES
(71, 'Farhan', 'Manager', 70000.00),
(72, 'Joseph', 'Assistant', 52000.00),
(73, 'Maria', 'Cashier', 28000.00),
(74, 'Ramdas', 'Clerk', 24000.00),
(75, 'Mehrin', 'Bookseller', 25000.00),
(76, 'Veronica', 'Bookseller', 23500.00);
#
SELECT * FROM Employee;
#
# Output "Employee" table --
# Emp_Id___Emp_name___Position_____Salary
# 71_______Farhan_____Manager______70000.00
# 72_______Joseph_____Assistant____52000.00
# 73_______Maria______Cashier______28000.00
# 74_______Ramdas_____Clerk________24000.00
# 75_______Mehrin_____Bookseller___25000.00
# 76_______Veronica___Bookseller___23500.00
#
#
# 3. Customer --
#  Customer_Id - Set as PRIMARY KEY
#  Customer_name
#  Customer_address
#  Reg_date
#
# Create "Customer" table --
#
CREATE TABLE Customer (
Customer_Id INT PRIMARY KEY,
Customer_name VARCHAR(30),
Customer_address VARCHAR(50),
Reg_date DATE);
#
INSERT INTO Customer (Customer_id, Customer_name, Customer_address, Reg_date) VALUES
(11, 'Anil', 'Ernamkulam', '2023-02-02'),
(12, 'Sukanya', 'Kottayam', '2023-03-28'),
(13, 'Murali', 'Kannur', '2023-04-12'),
(14, 'Laila', 'kozhikkod', '2023-06-15'),
(15, 'Rahees', 'Malappuram', '2023-07-23'),
(16, 'Abin', 'Alappuzha', '2023-07-20');
#
SELECT * FROM Customer;
#
# Output "Customer" table --
# Customer_id___Customer_name___Customer_address___Reg_date
# 11____________Anil____________Ernamkulam_________2023-02-02
# 12____________Sukanya_________Kottayam___________2023-03-28
# 13____________Murali__________Kannur_____________2023-04-12
# 14____________Laila___________kozhikkod__________2023-06-15
# 15____________Rahees__________Malappuram_________2023-07-23
# 16____________Abin____________Alappuzha__________2023-07-20
#
#
# 4. IssueStatus --
#  Issue_Id - Set as PRIMARY KEY
#  Issued_cust – Set as FOREIGN KEY, and it refers "Customer_Id" in "Customer" table
#  Issued_book_name
#  Issue_date
#  ISBN_book – Set as FOREIGN KEY, and it should refer "ISBN" in "Books" table
#
# Create "Issue_Status" table --
#
CREATE TABLE Issue_Status (
Issue_Id INT PRIMARY KEY,
Issued_cust INT,
Issued_book_name VARCHAR(30),
Issue_date DATE,
ISBN_book VARCHAR(30),
FOREIGN KEY (Issued_cust) REFERENCES Customer(Customer_Id),
FOREIGN KEY (ISBN_book) REFERENCES Books(ISBN));
#
INSERT INTO Issue_Status (Issue_Id, Issued_cust, Issued_book_name, Issue_date, ISBN_book) VALUES
(11, 11, 'Book_aaa', '2023-02-05', 'ISBN_aaa'),
(12, 12, 'Book_bbb', '2023-04-02', 'ISBN_bbb'),
(13, 13, 'Book_ccc', '2023-04-16', 'ISBN_ccc'),
(14, 14, 'Book_ddd', '2023-06-18', 'ISBN_ddd'),
(15, 15, 'Book_eee', '2023-07-25', 'ISBN_eee'),
(16, 16, 'Book_fff', '2023-07-23', 'ISBN_fff');
#
SELECT * FROM Issue_Status;
#
# Output "Issue_Status" table --
# Issue_Id___Issued_cust___Issued_book_name___Issue_date____ISBN_book
# 11_________11____________Book_aaa___________2023-02-05____ISBN_aaa
# 12_________12____________Book_bbb___________2023-04-02____ISBN_bbb
# 13_________13____________Book_ccc___________2023-04-16____ISBN_ccc
# 14_________14____________Book_ddd___________2023-06-18____ISBN_ddd
# 15_________15____________Book_eee___________2023-07-25____ISBN_eee
# 16_________16____________Book_fff___________2023-07-23____ISBN_fff
#
#
# 5. ReturnStatus --
#  Return_Id - Set as PRIMARY KEY
#  Return_cust  - Set as FOREIGN KEY, and it should refer "ISBN" in "Customer" table
#  Return_book_name
#  Return_date
#  ISBN_book2 - Set as FOREIGN KEY, and it should refer "Customer_Id" in "Books" table
#
# Create "Return_Status" table --
#
CREATE TABLE Return_Status (
Return_Id INT PRIMARY KEY,
Return_cust INT,
Return_book_name VARCHAR(30),
Return_date DATE,
ISBN_book2 VARCHAR(30),
FOREIGN KEY (Return_cust) REFERENCES Customer(Customer_Id),
FOREIGN KEY (Isbn_book2) REFERENCES Books(ISBN));
#
INSERT INTO Return_Status (Return_Id, Return_cust, Return_book_name, Return_date, ISBN_book2) VALUES
(11, 11, 'Book_aaa', '2023-02-14', 'ISBN_aaa'),
(12, 12, 'Book_bbb', '2023-04-11', 'ISBN_bbb'),
(13, 13, 'Book_ccc', '2023-04-25', 'ISBN_ccc'),
(14, 14, 'Book_ddd', '2023-06-27', 'ISBN_ddd'),
(15, 15, 'Book_eee', '2023-08-01', 'ISBN_eee'),
(16, 16, 'Book_fff', '2023-08-03', 'ISBN_fff');
#
SELECT * FROM Return_Status;
#
# Output "Return_Status" table --
# Return_Id___Return_cust___Return_book_name___Return_date___ISBN_book2
# 11__________11____________Book_aaa___________2023-02-14____ISBN_aaa
# 12__________12____________Book_bbb___________2023-04-11____ISBN_bbb
# 13__________13____________Book_ccc___________2023-04-25____ISBN_ccc
# 14__________14____________Book_ddd___________2023-06-27____ISBN_ddd
# 15__________15____________Book_eee___________2023-08-01____ISBN_eee
# 16__________16____________Book_fff___________2023-08-03____ISBN_fff
#
#
# 6. Books
#  ISBN - Set as PRIMARY KEY
#  Book_title
#  Category
#  Rental_Price
#  Status [Give 'YES' if book available and 'NOT' if book not available]
#  Author
#  Publisher
#
# Create "Books" table --
#
CREATE TABLE Books (
ISBN VARCHAR(30) PRIMARY KEY,
Book_title VARCHAR(30),
Category VARCHAR(30),
Rental_Price DECIMAL(5, 2),
Status ENUM('yes', 'no'),
Author VARCHAR(30),
Publisher VARCHAR(30));
#
INSERT INTO Books (ISBN, Book_title, Category, Rental_Price, Status, Author, Publisher) VALUES
('ISBN_aaa', 'Title_aaa', 'Mystery', 109.50, 'yes', 'Author_aaa', 'Publisher_sss'),
('ISBN_bbb', 'Title_bbb', 'Romance', 144.99, 'yes', 'Author_bbb', 'Publisher_ttt'),
('ISBN_ccc', 'Title_ccc', 'History', 205.99, 'no', 'Author_ccc', 'Publisher_uuu'),
('ISBN_ddd', 'Title_ddd', 'Novel', 261.99, 'yes', 'Author_ddd', 'Publisher_xxx'),
('ISBN_eee', 'Title_eee', 'Fantasy', 185.50, 'no', 'Author_eee', 'Publisher_yyy'),
('ISBN_fff', 'Title_fff', 'Fantasy', 170.99, 'yes', 'Author_fff', 'Publisher_zzz');
#
SELECT * FROM Books;
#
# Output "Books" table --
# ISBN________Book_title___Category___Rental_Price___status___Author________Publisher
# ISBN_aaa____Title_aaa____Mystery____109.50________YES______Author_aaa____Publisher_sss
# ISBN_bbb____Title_bbb____Romance____144.99________YES______Author_bbb____Publisher_ttt
# ISBN_ccc____Title_ccc____History____205.99________NOT______Author_ccc____Publisher_uuu
# ISBN_ddd____Title_ddd____Novel______261.99________YES______Author_ddd____Publisher_xxx
# ISBN_eee____Title_eee____Fantasy____185.50________NOT______Author_eee____Publisher_yyy
# ISBN_fff____Title_fff____Fantasy____170.99________YES______Author_fff____Publisher_zzz
#
#
# 1. Retrieve the book title, category, and rental price of all 'available' books.
#
SELECT Book_title, Category, Rental_Price FROM Books WHERE status = 'YES';
#
# Output "Books" table --
# Book_title___Category___Rental_Price
# Title_aaa____Mystery____109.50
# Title_bbb____Romance____144.99
# Title_ddd____Novel______261.99
# Title_fff____Fantasy____170.99
#
#
# 2. List the employee names and their respective salaries in descending order of salary.
#
SELECT Emp_name, Salary FROM Employee ORDER BY Salary DESC;
#
# Output "Employee" table --
# Emp_name___Salary
# Farhan_____70000.00
# Joseph_____52000.00
# Maria______28000.00
# Mehrin_____25000.00
# Ramdas_____24000.00
# Veronica___23500.00
#
#
# 3. Retrieve the book titles and the corresponding customers who have issued those books.
#
SELECT I_S.Issued_book_name, I_S.Issued_cust, C_U.Customer_name FROM 
Issue_Status I_S JOIN Customer C_U 
ON I_S.Issued_cust = C_U.Customer_id;
#
# Output "Issue_Status" + "Customer" table --
# Book_title___Issued_cust___Customer_name
# Title_aaa____11____________Anil
# Title_bbb____12____________Sukanya
# Title_ccc____13____________Murali
# Title_ddd____14____________Laila
# Title_eee____15____________Rahees
# Title_fff____16____________Abin
#
#
# 4. Display the total count of books in each category.
#
SELECT Category, COUNT(*) AS Total_Count FROM Books GROUP BY Category;
#
# Output "Books" table --
# Category____count(Category)
# Mystery_____1
# Romance_____1
# History_____1
# Novel_______1
# Fantasy_____2
#
#
# 5. Retrieve the employee names and their positions for the employees whose salaries are above Rs.50,000.
#
SELECT Emp_name, Position FROM Employee WHERE Salary > 50000;
#
# Output "Employee" table --
# Emp_name___Position
# Farhan_____Manager
# Joseph_____Assistant
#
#
# 6. List the customer names who 'registered before' '2022-01-01' and have 'not issued' any books yet.
#
SELECT C_U.Customer_name FROM
Customer C_U JOIN Issue_Status I_S
ON C_U.Customer_id = I_S.Issued_cust
WHERE C_U.Reg_date < 2022-01-01 AND I_S.Issue_date IS NULL;
#
# Output "Customer" table --
# Customer_name
#
#
# 7. Display the branch numbers and the total count of employees in each branch.
#
SELECT BR.Branch_no, COUNT(*) AS Total_Employees FROM 
Branch BR JOIN Employee EMP 
ON BR.Manager_Id = EMP.Emp_Id
GROUP BY BR.Branch_no;
#
# Output "Branch" + "Employee" table --
# Branch_no___Total_Employees
# 1___________1
# 2___________2
# 3___________3
# 4___________4
# 5___________5
# 6___________6
#
#
# 8. Display the names of customers who have 'issued books' in the month of 'June 2023'.
#
SELECT C_U.Customer_name FROM
Customer C_U JOIN Issue_Status I_S
ON C_U.Customer_id = I_S.Issued_cust
WHERE I_S.Issue_date BETWEEN '2023-06-01' and '2023-06-30';
#
# Output "Customer" + "Issue_Status" table --
# Customer_name
# Laila
#
#
# 9. Retrieve 'book_title' from book table containing 'history'.
#
SELECT Book_title FROM Books WHERE Category = 'History';
#
# Output "Books" table --
# Book_title
# Title_ccc
#
#
# 10. Retrieve the 'branch numbers' along with the count of employees for branches having 'more than 5' employees.
#
SELECT BRC.Branch_no, count(*) AS Employee_Count FROM
Branch BRC join Employee EMP
ON BRC.Manager_Id = EMP.Emp_Id
GROUP BY BRC.Branch_no HAVING Employee_Count > 5;
#
# Output "Branch" + "Employee" table --
# Branch_no___Employee_Count
#
#
# ------------------------------------------------------------------------------------------------------------------
