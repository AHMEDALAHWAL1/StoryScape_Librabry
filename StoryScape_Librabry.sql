Create Database StoryScape_Librabry
use StoryScape_Librabry

CREATE TABLE Members (
    memberID VARCHAR(50) PRIMARY KEY,
    firstName VARCHAR(50),
    lastName VARCHAR(50),
    email VARCHAR(100),
    password VARCHAR(50),
    address VARCHAR(200),
    contactNumber VARCHAR(15),
	Statues VARCHAR(20)
);

create table Category(
categoryID nvarchar(50) Primary key,
LoanPeriod nvarchar(50) not null,
[Description] nvarchar(50) not null,
[Fines] decimal(10,2) not null,
);

-- Publishers Table
CREATE TABLE Publishers (
    publisherID VARCHAR(50) PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    address VARCHAR(200),
    phoneNumber VARCHAR(15)
);



-- Books Table
CREATE TABLE Books (
    ISBN VARCHAR(13) PRIMARY KEY,
    title VARCHAR(200) NOT NULL,
    description TEXT,
    author VARCHAR(100) NOT NULL,
    genre VARCHAR(50),
    price DECIMAL(10, 2),
    stockQuantity INT,
    publisherID VARCHAR(50),
	categoryID nvarchar(50),
    FOREIGN KEY (publisherID) REFERENCES Publishers(publisherID),
	FOREIGN key (categoryID) references Category(categoryID)
);

-- BookstoreManager Table
CREATE TABLE BookstoreManager (
    managerID VARCHAR(50) PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    phoneNumber VARCHAR(15)
);



-- Review Table
CREATE TABLE Reviews (
    reviewID VARCHAR(50) PRIMARY KEY,
    rating INT CHECK (rating BETWEEN 1 AND 5),
    comment TEXT,
    reviewDate DATE,
    ISBN VARCHAR(13),
    memberID VARCHAR(50),
    FOREIGN KEY (ISBN) REFERENCES Books(ISBN),
    FOREIGN KEY (memberID) REFERENCES Members(memberID)
);

-- OrderTable Table
CREATE TABLE OrderTable (
    orderID VARCHAR(50) PRIMARY KEY,
    orderDate DATE,
    publisherID VARCHAR(50),
    memberID VARCHAR(50),
    managerID VARCHAR(50),
    FOREIGN KEY (publisherID) REFERENCES Publishers(publisherID),
    FOREIGN KEY (memberID) REFERENCES Members(memberID),
    FOREIGN KEY (managerID) REFERENCES BookstoreManager(managerID)
);

-- ShoppingCart Table
CREATE TABLE ShoppingCart (
    cartID VARCHAR(50) PRIMARY KEY,
    memberID VARCHAR(50),
    totalPrice DECIMAL(10, 2),
    FOREIGN KEY (memberID) REFERENCES Members(memberID)
);

-- Payment Table
CREATE TABLE Payments (
    paymentID VARCHAR(50) PRIMARY KEY,
    paymentMethod VARCHAR(50),
    amount DECIMAL(10, 2),
    paymentDate DATE,
    orderID VARCHAR(50),
    FOREIGN KEY (orderID) REFERENCES OrderTable(orderID)
);

-- Delivery Table
CREATE TABLE Delivery (
    deliveryID VARCHAR(50) PRIMARY KEY,
    status VARCHAR(50),
    deliveryDate DATE,
    orderID VARCHAR(50),
    FOREIGN KEY (orderID) REFERENCES OrderTable(orderID)
);

-- loan Table
CREATE TABLE Loan (
    LoanID VARCHAR(50) PRIMARY KEY,
    memberID VARCHAR(50),
    ISBN VARCHAR(13),
	categoryID nvarchar(50),
    LoanDate DATE,
    returnDate DATE,
    overdueCount INT,
    FOREIGN KEY (memberID) REFERENCES Members(memberID),
    FOREIGN KEY (ISBN) REFERENCES Books(ISBN),
	FOREIGN KEY (categoryID) REFERENCES Category(categoryID)
);

-- Reservation Table
CREATE TABLE Reservation (
    reservationID VARCHAR(50) PRIMARY KEY,
    memberID VARCHAR(50),
    ISBN VARCHAR(13),
    reservationDate DATE,
    FOREIGN KEY (memberID) REFERENCES Members(memberID),
    FOREIGN KEY (ISBN) REFERENCES Books(ISBN)
);





-- Insert 20 records into Publisher Table
INSERT INTO Publishers (publisherID, name, address, phoneNumber) VALUES
('P001', 'Pearson Willam', '123 Pearson St, New York, NY', '1234567890'),
('P002', 'McGraw-Hill', '456 McGraw St, New York, NY', '2345678901'),
('P003', 'Penguin Random House', '789 Penguin St, New York, NY', '3456789012'),
('P004', 'HarperCollins', '101 Harper St, New York, NY', '4567890123'),
('P005', 'Simon & Schuster', '102 Simon St, New York, NY', '5678901234'),
('P006', 'Houghton Mifflin Harcourt', '103 Houghton St, New York, NY', '6789012345'),
('P007', 'Scholastic', '104 Scholastic St, New York, NY', '7890123456'),
('P008', 'Macmillan', '105 Macmillan St, New York, NY', '8901234567'),
('P009', 'Oxford University Press', '106 Oxford St, New York, NY', '9012345678'),
('P010', 'Cambridge University Press', '107 Cambridge St, New York, NY', '0123456789'),
('P011', 'Cengage', '108 Cengage St, New York, NY', '1234509876'),
('P012', 'Springer', '109 Springer St, New York, NY', '2345609876'),
('P013', 'John Wiley & Sons', '110 Wiley St, New York, NY', '3456709876'),
('P014', 'Elsevier', '111 Elsevier St, New York, NY', '4567809876'),
('P015', 'Taylor & Francis', '112 Taylor St, New York, NY', '5678909876'),
('P016', 'SAGE Publications', '113 SAGE St, New York, NY', '6789009876'),
('P017', 'Thomson Reuters', '114 Thomson St, New York, NY', '7890109876'),
('P018', 'Palgrave Macmillan', '115 Palgrave St, New York, NY', '8901209876'),
('P019', 'Routledge', '116 Routledge St, New York, NY', '9012309876'),
('P020', 'Faber & Faber', '117 Faber St, New York, NY', '0123409876');

Insert into Category values
('Red','0 days','Cannot be Loaned','0.00'),
('Yellow','4 days','Only be loaned by active members',3.00),
('Green','7 days','Can be loaned by all members',1.00);


-- Insert 20 records into Book Table
INSERT INTO Books (ISBN, title, description, author, genre, price, stockQuantity, publisherID, categoryID) VALUES
('9780000000011', 'Imaginative Journeys', 'A fascinating book on topic one.', 'Alice Johnson', 'Fiction', 45.99, 10, 'P001','Yellow'),
('9780000000028', 'Real-Life Insights', 'An insightful book on topic two.', 'David Smith', 'Non-Fiction', 55.99, 20, 'P002','Yellow'),
('9780000000035', 'Scientific Exploration', 'A detailed book on topic three.', 'Emily White', 'Science', 65.99, 15, 'P003','Green'),
('9780000000042', 'Historical Perspectives', 'A comprehensive book on topic four.', 'David Smith', 'History', 75.99, 5, 'P004','Yellow'),
('9780000000059', 'Magical Adventures', 'An engaging book on topic five.', 'Sarah Davis', 'Fantasy', 85.99, 25, 'P005','Green'),
('9780000000066', 'Thrilling Tales', 'An exciting book on topic six.', 'James Wilson', 'Fiction', 95.99, 30, 'P006', 'Green'),
('9780000000073', 'Depth of Reality', 'A captivating book on topic seven.', 'Jessica Martinez', 'Non-Fiction', 105.99, 40, 'P007', 'Yellow'),
('9780000000080', 'Knowledge Horizons', 'An informative book on topic eight.', 'Thomas Lee', 'Science', 47.99, 50, 'P008', 'Green'),
('9780000000097', 'Secrets of the Past', 'An intriguing book on topic nine.', 'Laura Taylor', 'History', 125.99, 60, 'P009', 'Yellow'),
('9780000000103', 'Imaginative Realms', 'A thought-provoking book on topic ten.', 'William Anderson', 'Fantasy', 135.99, 70, 'P010', 'Green'),
('9780000000110', 'Fictional Brilliance', 'An excellent book on topic eleven.', 'David Smith', 'Fiction', 40.99, 00, 'P011', 'Green'),
('9780000000127', 'Non-Fiction Essentials', 'A must-read book on topic twelve.', 'James Wilson', 'Non-Fiction', 155.99, 90, 'P012', 'Yellow'),
('9780000000134', 'Scientific Breakthroughs', 'A brilliant book on topic thirteen.', 'Sophia Hernandez', 'Science', 165.99, 100, 'P013', 'Red'),
('9780000000141', 'Historical Significance', 'A valuable book on topic fourteen.', 'Daniel Robinson', 'History', 175.99, 110, 'P014', 'Red'),
('9780000000158', 'Enchanted Worlds', 'A significant book on topic fifteen.', 'David Smith', 'Fantasy', 42.20, 120, 'P015', 'Green'),
('9780000000165', 'Engaging Fiction', 'An exceptional book on topic sixteen.', 'James Wilson', 'Fiction', 195.99, 130, 'P016', 'Yellow'),
('9780000000172', 'World Insights', 'An outstanding book on topic seventeen.', 'Mia Clark', 'Non-Fiction', 205.99, 140, 'P017', 'Red'),
('9780000000189', 'Advances in Science', 'A remarkable book on topic eighteen.', 'James Wilson', 'Science', 215.99, 150, 'P018', 'Red'),
('9780000000196', 'Living History', 'An inspiring book on topic nineteen.', 'David Smith', 'History', 225.99, 160, 'P019', 'Green'),
('9780000000202', 'Fantasy Chronicles', 'An impressive book on topic twenty.', 'Alexander Hall', 'Fantasy', 23.99, 170, 'P020', 'Red');




-- Insert 20 records into BookstoreManager Table
INSERT INTO BookstoreManager (managerID, name, email, phoneNumber) VALUES
('M001', 'Manager One', 'manager1@example.com', '1111111111'),
('M002', 'Manager Two', 'manager2@example.com', '2222222222'),
('M003', 'Manager Three', 'manager3@example.com', '3333333333'),
('M004', 'Manager Four', 'manager4@example.com', '4444444444'),
('M005', 'Manager Five', 'manager5@example.com', '5555555555'),
('M006', 'Manager Six', 'manager6@example.com', '6666666666'),
('M007', 'Manager Seven', 'manager7@example.com', '7777777777'),
('M008', 'Manager Eight', 'manager8@example.com', '8888888888'),
('M009', 'Manager Nine', 'manager9@example.com', '9999999999'),
('M010', 'Manager Ten', 'manager10@example.com', '1010101010'),
('M011', 'Manager Eleven', 'manager11@example.com', '1110101010'),
('M012', 'Manager Twelve', 'manager12@example.com', '1212121212'),
('M013', 'Manager Thirteen', 'manager13@example.com', '1313131313'),
('M014', 'Manager Fourteen', 'manager14@example.com', '1414141414'),
('M015', 'Manager Fifteen', 'manager15@example.com', '1515151515'),
('M016', 'Manager Sixteen', 'manager16@example.com', '1616161616'),
('M017', 'Manager Seventeen', 'manager17@example.com', '1717171717'),
('M018', 'Manager Eighteen', 'manager18@example.com', '1818181818'),
('M019', 'Manager Nineteen', 'manager19@example.com', '1919191919'),
('M020', 'Manager Twenty', 'manager20@example.com', '2020202020');

-- Insert 20 records into Member Table
INSERT INTO Members (memberID, firstName, lastName, email, password, address, contactNumber, Statues) VALUES
('MEM001', 'John', 'Doe', 'john.doe@example.com', 'password1', '123 Main St', '1234567890','Active'),
('MEM002', 'Jane', 'Doe', 'jane.doe@example.com', 'password2', '124 Main St', '1234567891', 'Active'),
('MEM003', 'Alice', 'Smith', 'alice.smith@example.com', 'password3', '125 Main St', '1234567892',''),
('MEM004', 'Bob', 'Johnson', 'bob.johnson@example.com', 'password4', '126 Main St', '1234567893', 'Active'),
('MEM005', 'Charlie', 'Brown', 'charlie.brown@example.com', 'password5', '127 Main St', '1234567894', ''),
('MEM006', 'David', 'Williams', 'david.williams@example.com', 'password6', '128 Main St', '1234567895', ''),
('MEM007', 'Eve', 'Davis', 'eve.davis@example.com', 'password7', '129 Main St', '1234567896','Active'),
('MEM008', 'Frank', 'Miller', 'frank.miller@example.com', 'password8', '130 Main St', '1234567897',''),
('MEM009', 'Grace', 'Wilson', 'grace.wilson@example.com', 'password9', '131 Main St', '1234567898', 'Active'),
('MEM010', 'Hank', 'Moore', 'hank.moore@example.com', 'password10', '132 Main St', '1234567899', ''),
('MEM011', 'Ivy', 'Taylor', 'ivy.taylor@example.com', 'password11', '133 Main St', '1234567800', ''),
('MEM012', 'Jack', 'Anderson', 'jack.anderson@example.com', 'password12', '134 Main St', '1234567801', 'Active'),
('MEM013', 'Kim', 'Thomas', 'kim.thomas@example.com', 'password13', '135 Main St', '1234567802', ''),
('MEM014', 'Leo', 'Jackson', 'leo.jackson@example.com', 'password14', '136 Main St', '1234567803', ''),
('MEM015', 'Mia', 'White', 'mia.white@example.com', 'password15', '137 Main St', '1234567804', 'Active'),
('MEM016', 'Noah', 'Harris', 'noah.harris@example.com', 'password16', '138 Main St', '1234567805', ''),
('MEM017', 'Olivia', 'Martin', 'olivia.martin@example.com', 'password17', '139 Main St', '1234567806', 'Active'),
('MEM018', 'Paul', 'Thompson', 'paul.thompson@example.com', 'password18', '140 Main St', '1234567807', 'Active'),
('MEM019', 'Quinn', 'Garcia', 'quinn.garcia@example.com', 'password19', '141 Main St', '1234567808', ''),
('MEM020', 'Ruth', 'Martinez', 'ruth.martinez@example.com', 'password20', '142 Main St', '1234567809', 'Active');

-- Insert 20 records into Review Table
INSERT INTO Reviews (reviewID, rating, comment, reviewDate, ISBN, memberID) VALUES
('R001', 5, 'Excellent book!', '2024-01-01', '9780000000011', 'MEM001'),
('R002', 4, 'Great read.', '2024-01-02', '9780000000028', 'MEM002'),
('R003', 3, 'Good book.', '2024-01-03', '9780000000035', 'MEM003'),
('R004', 2, 'Okay book.', '2024-01-04', '9780000000042', 'MEM004'),
('R005', 1, 'Not my type.', '2024-01-05', '9780000000059', 'MEM005'),
('R006', 5, 'Loved it!', '2024-01-06', '9780000000066', 'MEM006'),
('R007', 4, 'Very good.', '2024-01-07', '9780000000073', 'MEM007'),
('R008', 3, 'Decent read.', '2024-01-08', '9780000000080', 'MEM008'),
('R009', 2, 'Could be better.', '2024-01-09', '9780000000097', 'MEM009'),
('R010', 1, 'Not enjoyable.', '2024-01-10', '9780000000103', 'MEM010'),
('R011', 5, 'Highly recommend!', '2024-01-11', '9780000000110', 'MEM011'),
('R012', 4, 'Quite interesting.', '2024-01-12', '9780000000127', 'MEM012'),
('R013', 3, 'Fairly good.', '2024-01-13', '9780000000134', 'MEM013'),
('R014', 2, 'Mediocre.', '2024-01-14', '9780000000141', 'MEM014'),
('R015', 1, 'Disappointing.', '2024-01-15', '9780000000158', 'MEM015'),
('R016', 5, 'Fantastic!', '2024-01-16', '9780000000165', 'MEM016'),
('R017', 4, 'Really good.', '2024-01-17', '9780000000172', 'MEM017'),
('R018', 3, 'Worth a read.', '2024-01-18', '9780000000189', 'MEM018'),
('R019', 2, 'So-so.', '2024-01-19', '9780000000196', 'MEM019'),
('R020', 1, 'Terrible.', '2024-01-20', '9780000000202', 'MEM020');

-- Insert 20 records into OrderTable
INSERT INTO OrderTable (orderID, orderDate, publisherID, memberID, managerID) VALUES
('O001', '2024-01-01', 'P001', 'MEM001', 'M001'),
('O002', '2024-01-02', 'P002', 'MEM002', 'M002'),
('O003', '2024-01-03', 'P003', 'MEM003', 'M003'),
('O004', '2024-01-04', 'P004', 'MEM004', 'M004'),
('O005', '2024-01-05', 'P005', 'MEM005', 'M005'),
('O006', '2024-01-06', 'P006', 'MEM006', 'M006'),
('O007', '2024-01-07', 'P007', 'MEM007', 'M007'),
('O008', '2024-01-08', 'P008', 'MEM008', 'M008'),
('O009', '2024-01-09', 'P009', 'MEM009', 'M009'),
('O010', '2024-01-10', 'P010', 'MEM010', 'M010'),
('O011', '2024-01-11', 'P011', 'MEM011', 'M011'),
('O012', '2024-01-12', 'P012', 'MEM012', 'M012'),
('O013', '2024-01-13', 'P013', 'MEM013', 'M013'),
('O014', '2024-01-14', 'P014', 'MEM014', 'M014'),
('O015', '2024-01-15', 'P015', 'MEM015', 'M015'),
('O016', '2024-01-16', 'P016', 'MEM016', 'M016'),
('O017', '2024-01-17', 'P017', 'MEM017', 'M017'),
('O018', '2024-01-18', 'P018', 'MEM018', 'M018'),
('O019', '2024-01-19', 'P019', 'MEM019', 'M019'),
('O020', '2024-01-20', 'P020', 'MEM020', 'M020');

-- Insert 20 records into ShoppingCart Table
INSERT INTO ShoppingCart (cartID, memberID, totalPrice) VALUES
('C001', 'MEM001', 150.00),
('C002', 'MEM002', 200.00),
('C003', 'MEM003', 250.00),
('C004', 'MEM004', 300.00),
('C005', 'MEM005', 350.00),
('C006', 'MEM006', 400.00),
('C007', 'MEM007', 450.00),
('C008', 'MEM008', 500.00),
('C009', 'MEM009', 550.00),
('C010', 'MEM010', 600.00),
('C011', 'MEM011', 650.00),
('C012', 'MEM012', 700.00),
('C013', 'MEM013', 750.00),
('C014', 'MEM014', 800.00),
('C015', 'MEM015', 850.00),
('C016', 'MEM016', 900.00),
('C017', 'MEM017', 950.00),
('C018', 'MEM018', 1000.00),
('C019', 'MEM019', 1050.00),
('C020', 'MEM020', 1100.00);

-- Insert 20 records into Payment Table
INSERT INTO Payments (paymentID, paymentMethod, amount, paymentDate, orderID) VALUES
('PAY001', 'Credit Card', 150.00, '2024-01-01', 'O001'),
('PAY002', 'PayPal', 200.00, '2024-01-02', 'O002'),
('PAY003', 'Debit Card', 250.00, '2024-01-03', 'O003'),
('PAY004', 'Credit Card', 300.00, '2024-01-04', 'O004'),
('PAY005', 'PayPal', 350.00, '2024-01-05', 'O005'),
('PAY006', 'Debit Card', 400.00, '2024-01-06', 'O006'),
('PAY007', 'Credit Card', 450.00, '2024-01-07', 'O007'),
('PAY008', 'PayPal', 500.00, '2024-01-08', 'O008'),
('PAY009', 'Debit Card', 550.00, '2024-01-09', 'O009'),
('PAY010', 'Credit Card', 600.00, '2024-01-10', 'O010'),
('PAY011', 'PayPal', 650.00, '2024-01-11', 'O011'),
('PAY012', 'Debit Card', 700.00, '2024-01-12', 'O012'),
('PAY013', 'Credit Card', 750.00, '2024-01-13', 'O013'),
('PAY014', 'PayPal', 800.00, '2024-01-14', 'O014'),
('PAY015', 'Debit Card', 850.00, '2024-01-15', 'O015'),
('PAY016', 'Credit Card', 900.00, '2024-01-16', 'O016'),
('PAY017', 'PayPal', 950.00, '2024-01-17', 'O017'),
('PAY018', 'Debit Card', 1000.00, '2024-01-18', 'O018'),
('PAY019', 'Credit Card', 1050.00, '2024-01-19', 'O019'),
('PAY020', 'PayPal', 1100.00, '2024-01-20', 'O020');

-- Insert 20 records into Delivery Table
INSERT INTO Delivery (deliveryID, status, deliveryDate, orderID) VALUES
('D001', 'Delivered', '2024-01-02', 'O001'),
('D002', 'Shipped', '2024-01-03', 'O002'),
('D003', 'Processing', '2024-01-04', 'O003'),
('D004', 'Delivered', '2024-01-05', 'O004'),
('D005', 'Shipped', '2024-01-06', 'O005'),
('D006', 'Processing', '2024-01-07', 'O006'),
('D007', 'Delivered', '2024-01-08', 'O007'),
('D008', 'Shipped', '2024-01-09', 'O008'),
('D009', 'Processing', '2024-01-10', 'O009'),
('D010', 'Delivered', '2024-01-11', 'O010'),
('D011', 'Shipped', '2024-01-12', 'O011'),
('D012', 'Processing', '2024-01-13', 'O012'),
('D013', 'Delivered', '2024-01-14', 'O013'),
('D014', 'Shipped', '2024-01-15', 'O014'),
('D015', 'Processing', '2024-01-16', 'O015'),
('D016', 'Delivered', '2024-01-17', 'O016'),
('D017', 'Shipped', '2024-01-18', 'O017'),
('D018', 'Processing', '2024-01-19', 'O018'),
('D019', 'Delivered', '2024-01-20', 'O019'),
('D020', 'Shipped', '2024-01-21', 'O020');

drop table Loan;
-- Insert 20 records into Loans Table
INSERT INTO Loan (LoanID, memberID, ISBN, categoryID, LoanDate, returnDate, overdueCount) VALUES
('B001', 'MEM020', '9780000000028','Green', '2022-01-01', '2022-01-11', 3),
('B002', 'MEM003', '9780000000042','Yellow', '2022-02-05', '2022-02-12', 3),	
('B003', 'MEM011', '9780000000035','Green', '2022-03-10', '2022-03-22', 5),
('B004', 'MEM019', '9780000000066','Yellow', '2022-04-15', '2022-04-20', 1),
('B005', 'MEM009', '9780000000080','Green', '2022-05-20', '2022-05-31', 4),
('B006', 'MEM006', '9780000000073','Yellow', '2022-06-25', '2022-07-02', 3),
('B007', 'MEM017', '9780000000103','Green', '2022-07-30', '2022-08-08', 2),
('B008', 'MEM002', '9780000000110','Green', '2022-09-03', '2022-09-14', 4),
('B009', 'MEM017', '9780000000127','Yellow', '2022-10-08', '2022-10-13', 1),
('B010', 'MEM004', '9780000000158','Green', '2022-11-12', '2022-11-22', 3),
('B011', 'MEM016', '9780000000165','Yellow', '2022-12-17', '2022-12-24', 3),
('B012', 'MEM009', '9780000000196','Green', '2023-01-21', '2023-01-29', 1),
('B013', 'MEM010', '9780000000202','Yellow', '2023-02-25', '2023-03-02', 1),
('B014', 'MEM004', '9780000000080','Green', '2023-04-02', '2023-04-14', 5),
('B015', 'MEM012', '9780000000066','Yellow', '2023-05-07', '2023-05-14', 3),
('B016', 'MEM017', '9780000000158','Green', '2023-06-11', '2023-06-22', 4),
('B017', 'MEM003', '9780000000165','Yellow', '2023-07-16', '2023-07-22', 2),
('B018', 'MEM001', '9780000000080','Green', '2023-08-20', '2023-08-31', 4),
('B019', 'MEM016', '9780000000042','Yellow', '2023-09-24', '2023-09-29', 1),
('B020', 'MEM007', '9780000000196','Green', '2023-10-29', '2023-11-07', 2);


-- Insert 20 records into Reservation Table
INSERT INTO Reservation (reservationID, memberID, ISBN, reservationDate) VALUES
('RES001', 'MEM001', '9780000000011', '2023-01-01'),
('RES002', 'MEM002', '9780000000028', '2023-01-01'),
('RES003', 'MEM003', '9780000000035', '2023-01-05'),
('RES004', 'MEM004', '9780000000042', '2023-01-07'),
('RES005', 'MEM005', '9780000000059', '2023-01-02'),
('RES006', 'MEM006', '9780000000066', '2023-02-08'),
('RES007', 'MEM007', '9780000000073', '2023-02-04'),
('RES008', 'MEM008', '9780000000080', '2023-02-15'),
('RES009', 'MEM009', '9780000000097', '2023-02-28'),
('RES010', 'MEM010', '9780000000103', '2023-01-18'),
('RES011', 'MEM011', '9780000000110', '2023-03-02'), 
('RES012', 'MEM012', '9780000000127', '2023-03-13'),
('RES013', 'MEM013', '9780000000134', '2024-03-01'),
('RES014', 'MEM014', '9780000000141', '2024-03-10'),
('RES015', 'MEM015', '9780000000158', '2024-01-25'),
('RES016', 'MEM016', '9780000000165', '2024-01-28'),
('RES017', 'MEM017', '9780000000172', '2024-01-30'),
('RES018', 'MEM018', '9780000000189', '2024-04-03'),
('RES019', 'MEM019', '9780000000196', '2024-07-07'), 
('RES020', 'MEM020', '9780000000202', '2024-09-11');









--Q1
SELECT 
    b.title AS BookName, 
    b.description AS Description, 
    c.CategoryID AS CategoryName, 
    c.Description AS CategoryDescription
FROM 
    (SELECT DISTINCT b.title, b.ISBN
     FROM Books b) b_distinct
JOIN 
    Books b ON b_distinct.ISBN = b.ISBN
JOIN 
    Category c ON b.CategoryID = c.CategoryID
WHERE 	
    c.CategoryID != 'Red'
ORDER BY 
    b.title ASC;

--Q2
	SELECT 
    m.firstName, 
    m.lastName, 
    b.title AS BookName, 
    l.LoanDate AS BorrowDate
FROM 
    Members m
JOIN 
    Loan l ON m.memberID = l.memberID
JOIN 
    Books b ON l.ISBN = b.ISBN
WHERE 
    m.Statues = 'Active' AND l.LoanDate BETWEEN '2023-01-01' AND '2023-12-31'
ORDER BY 
    l.LoanDate ASC;

--Q3
SELECT 
	M.memberID,
    M.firstName, 
    M.lastName, 
    M.contactNumber, 
    COUNT(L.LoanID) AS numberOfOverdue, 
    SUM(L.overdueCount * C.Fines) AS totalDueAmount
FROM 
    Loan L
JOIN 
    Members M ON L.memberID = M.memberID
JOIN 
    Category C ON L.categoryID = C.categoryID
WHERE 
    L.overdueCount > 0
GROUP BY 
	M.memberID,
    M.firstName, 
    M.lastName, 
    M.contactNumber
HAVING 
    COUNT(L.LoanID) > 2;

--Q4
WITH BookLoanCounts AS (
    SELECT 
        b.title AS BookName,
        CAST(b.description AS VARCHAR(MAX)) AS BookDescription,
        COUNT(l.LoanID) AS LoanCount,
        c.categoryID AS TagColor,
        ROW_NUMBER() OVER (PARTITION BY c.categoryID ORDER BY COUNT(l.LoanID) DESC) AS RowNum
    FROM 
        Books b
    JOIN 
        Loan l ON b.ISBN = l.ISBN
    JOIN 
        Category c ON b.categoryID = c.categoryID
    WHERE 
        c.categoryID IN ('Yellow', 'Green')
    GROUP BY 
        b.title, CAST(b.description AS VARCHAR(MAX)), c.categoryID
)
SELECT 
    TagColor, 
    BookName, 
    BookDescription, 
    LoanCount AS BorrowCount
FROM 
    BookLoanCounts
WHERE 
    RowNum = 1
ORDER BY 
    TagColor DESC;



--Q5
select Top 1 genre , count (*) As FigureOfBooks
From Books
Group By genre
order By FigureOfBooks Desc;

--Q6
SELECT COUNT(*) AS Total_of_Books_Reserved
FROM Reservation
WHERE YEAR(reservationDate) = 2023;

--Q7
SELECT 
    p.name AS PublisherName, 
    SUM(b.stockQuantity) AS TotalStockQuantity
FROM 
    Books b
JOIN 
    Publishers p ON b.publisherID = p.publisherID
JOIN 
    Category c ON b.categoryID = c.categoryID
WHERE 
    c.categoryID = 'Yellow'
GROUP BY 
    p.name
ORDER BY 
    TotalStockQuantity ASC
OFFSET 0 ROWS FETCH NEXT 1 ROWS ONLY;

--Q8
SELECT 
    author, 
    COUNT(*) AS NumberOfBooks
FROM 
    Books
GROUP BY 
    author
ORDER BY 
    NumberOfBooks DESC;



	--Q9
SELECT DISTINCT m.firstName, m.lastName, m.contactNumber
FROM Members m
JOIN Loan br ON m.memberID = br.memberID
JOIN Books b ON br.ISBN = b.ISBN
WHERE b.genre = 'Fantasy';

--Q10
SELECT 
    b.title AS BookName, 
    b.description AS BookDescription, 
    p.name AS PublisherName, 
    p.address AS PublisherAddress
FROM 
    Books b
JOIN w
    Publishers p ON b.publisherID = p.publisherID
WHERE 
    b.price > 50.00;


