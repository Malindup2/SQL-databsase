/*Table creation of Movie*/
CREATE TABLE Movie(
Movie_ID VARCHAR(5) NOT NULL,
ReleaseDate DATE NOT NULL,
Movie_Name VARCHAR(20) NOT NULL,
Genre VARCHAR(10) NOT NULL,
Rate INT NOT NULL,
Duration TIME NOT NULL,
CONSTRAINT Movie_PK PRIMARY KEY(Movie_ID)
);
/*create movie cast table*/
CREATE Table Movie_Cast(
Movie_ID VARCHAR(5) NOT NULL,
Movie_Cast_Names VARCHAR(70) NOT NULL,
CONSTRAINT Movie_Cast_PK PRIMARY KEY(Movie_ID),
CONSTRAINT Movie_cast_FK FOREIGN KEY(Movie_ID) References Movie(Movie_ID)
);
/*create customer table*/
CREATE TABLE Customer(
Customer_ID VARCHAR(20),
Email VARCHAR(40) NOT NULL,
First_Name VARCHAR(20) NOT NULL,
Last_Name VARCHAR(20) NOT NULL,
Password VARCHAR(12) NOT NULL,
DOB DATE NOT NULL,
Gender VARCHAR(10) NOT NULL,
CONSTRAINT Customer_PK PRIMARY KEY(Customer_ID));
/*create customer phone*/
CREATE TABLE Customer_Phone (
Customer_ID VARCHAR(20) NOT NULL,
Phone VARCHAR(10) NOT NULL,
CONSTRAINT Customer_Phone_PK PRIMARY KEY (Customer_ID),
CONSTRAINT Customer_Phone_FK FOREIGN KEY (Customer_ID) REFERENCES
Customer(Customer_ID)
);
/*customer care*/
CREATE TABLE Customer_Care(
Customer_Care_ID VARCHAR(5) NOT NULL,
Name VARCHAR(20) NOT NULL,
Email VARCHAR(50) NOT NULL,
CONSTRAINT Customer_Care_PK PRIMARY KEY (Customer_Care_ID));
/*theater*/
CREATE TABLE Theater(
Theater_ID VARCHAR(5) NOT NULL,
Theater_Name VARCHAR(50) NOT NULL,
Location VARCHAR(50) NOT NULL,
Street VARCHAR(50) NOT NULL,
Lane VARCHAR(50) NOT NULL,
Postal INT NOT NULL,
CONSTRAINT Theater_PK PRIMARY KEY(Theater_ID));
/*manager*/
CREATE TABLE Manager(
Manager_ID VARCHAR(10) NOT NULL,
Name VARCHAR(50) NOT NULL,
Gender VARCHAR(10) NOT NULL,
Email VARCHAR(50) NOT NULL,
Phone VARCHAR(10) NOT NULL,
CONSTRAINT Manager_PK PRIMARY KEY(Manager_ID)
);
/*Inqury*/
CREATE TABLE Inquiry(
Inquiry_ID VARCHAR(10) NOT NULL,
Subject VARCHAR(20) NOT NULL,
Response VARCHAR(70) NOT NULL,
Inquiry_Time TIME NOT NULL,
Inquiry_Date DATE NOT NULL,
Customer_ID VARCHAR(20) NOT NULL,
Customer_Care_ID VARCHAR(5) NOT NULL,
CONSTRAINT Inquiry_PK PRIMARY KEY(Inquiry_ID),
CONSTRAINT Inquiry_Customer_FK FOREIGN KEY (Customer_ID) REFERENCES
Customer(Customer_ID),
CONSTRAINT Inquiry_Customer_Care_FK FOREIGN KEY (Customer_Care_ID) REFERENCES
Customer_Care(Customer_Care_ID)
);
/*ticket*/
CREATE TABLE Ticket (
Ticket_ID VARCHAR(5) NOT NULL,
Show_time TIME NOT NULL,
Price INT NOT NULL,
Seat_No VARCHAR(10) NOT NULL,
Customer_ID VARCHAR(20) NOT NULL,
Movie_ID VARCHAR(5) NOT NULL,
CONSTRAINT Ticket_Customer_PK PRIMARY KEY (Ticket_ID),
CONSTRAINT Ticket_FK FOREIGN KEY (Customer_ID) REFERENCES customer(customer_ID),
CONSTRAINT Ticket_Movie_FK FOREIGN KEY (Movie_ID) REFERENCES Movie(Movie_ID)
);
/*theater_movie*/
CREATE TABLE Theater_Movie (
Theater_ID VARCHAR(5) NOT NULL,
Movie_ID VARCHAR(5) NOT NULL,
CONSTRAINT Theater_Movie_PK PRIMARY KEY (Movie_ID, Theater_ID),
CONSTRAINT Theater_Movie_Theater_FK FOREIGN KEY (Theater_ID) REFERENCES Theater
(Theater_ID),
CONSTRAINT Theater_Movie_Movie_FK FOREIGN KEY (Movie_ID) REFERENCES Movie (Movie_ID)
);
/*admin*/
CREATE TABLE Admin(
Admin_ID VARCHAR(5) NOT NULL,
Email VARCHAR(50) NOT NULL,
First_Name VARCHAR(50) NOT NULL,
Last_Name VARCHAR (50) NOT NULL,
DOB DATE NOT NULL,
Manager_ID VARCHAR(10) NOT NULL,
CONSTRAINT Admin_PK PRIMARY KEY(Admin_ID),
CONSTRAINT Admin_FK FOREIGN KEY(Manager_ID) REFERENCES Manager (Manager_ID)
);
/*admin phone*/
CREATE TABLE Admin_Phone(
Admin_ID VARCHAR(5) NOT NULL,
Phone VARCHAR(10) NOT NULL,
CONSTRAINT Admin_Phone_PK PRIMARY KEY(Admin_ID),
CONSTRAINT Admin_phone_FK FOREIGN KEY(Admin_ID) REFERENCES Admin(Admin_ID)
);
/*report*/
CREATE TABLE Report(
Report_ID VARCHAR(5) NOT NULL,
Name VARCHAR(20) NOT NULL,
Report_Date DATE NOT NULL,
Manager_ID VARCHAR(10) NOT NULL,
CONSTRAINT Report_PK PRIMARY KEY (Report_ID),
CONSTRAINT Report_FK FOREIGN KEY(Manager_ID) REFERENCES Manager(Manager_ID)
);
/*movie_show*/
CREATE Table Movie_Show(
Show_ID VARCHAR(10) NOT NULL,
Show_Date DATE NOT NULL,
Lanaguge VARCHAR(50) NOT NULL,
Loacation VARCHAR(50) NOT NULL,
Start_Time TIME NOT NULL,
End_Time TIME NOT NULL,
Movie_ID VARCHAR (5) NOT NULL,
Admin_ID VARCHAR(5) NOT NULL,
CONSTRAINT Movie_Show_PK PRIMARY KEY (Show_ID),
CONSTRAINT Movie_Show_M_FK FOREIGN KEY(Movie_ID) REFERENCES Movie(Movie_ID),
CONSTRAINT Movie_Show_A_FK FOREIGN KEY(Admin_ID) REFERENCES Admin(Admin_ID)
);
/*payment*/
CREATE Table Payment(
Payment_ID VARCHAR(10) NOT NULL,
Payment_Date DATE NOT NULL,
Payement_Time TIME NOT NULL,
Amount INT NOT NULL ,
Ticket_ID VARCHAR(5) NOT NULL,
Customer_ID VARCHAR(20) NOT NULL,
CONSTRAINT Payment_PK PRIMARY KEY (Payment_ID),
CONSTRAINT Payment_Ticket_FK FOREIGN KEY(Ticket_ID) REFERENCES Ticket(Ticket_ID),
CONSTRAINT Payment_Customer_FK FOREIGN KEY(Customer_ID) REFERENCES
Customer(Customer_ID)
);
/* Inserting data into the Movie table */
INSERT INTO Movie (Movie_ID, ReleaseDate, Movie_Name, Genre, Rate, Duration) 
VALUES 
('M001', '2023-05-15', 'Inception', 'Action', 8, '02:30:00'),
('M002', '2022-09-20', 'The Shawshank Redemp', 'Drama', 9, '02:22:00'),
('M003', '2024-02-10', 'The Godfather', 'Crime', 9, '02:55:00');
/* Inserting data into the Movie_Cast table */
INSERT INTO Movie_Cast (Movie_ID, Movie_Cast_Names) 
VALUES 
('M001', 'Leonardo DiCaprio, Joseph Gordon-Levitt, Ellen Page'),
('M002', 'Tim Robbins, Morgan Freeman, Bob Gunton'),
('M003', 'Marlon Brando, Al Pacino, James Caan');
/* Inserting data into the Customer table */
INSERT INTO Customer (Customer_ID, Email, First_Name, Last_Name, Password, DOB, Gender) 
VALUES 
('C001', 'john.doe@example.com', 'John', 'Doe', 'password123', '1990-05-15', 'Male'),
('C002', 'jane.smith@example.com', 'Jane', 'Smith', 'password456', '1985-09-20', 'Female');
/* Inserting data into the Customer_Phone table */
INSERT INTO Customer_Phone (Customer_ID, Phone) 
VALUES 
('C001', 1234567890),
('C002', 9876543210);
/* Inserting data into the Customer_Care table */
INSERT INTO Customer_Care (Customer_Care_ID, Name, Email) 
VALUES 
('CC001', 'Customer Care 1', 'customercare1@example.com'),
('CC002', 'Customer Care 2', 'customercare2@example.com');
/* Inserting data into the Theater table */
INSERT INTO Theater (Theater_ID, Theater_Name, Location, Street, Lane, Postal) 
VALUES 
('T001', 'Cineplex', 'Downtown', 'Main Street', 'Broadway Lane', 12345),
('T002', 'MegaPlex', 'Uptown', 'High Street', 'Park Avenue', 54321);
/* Inserting data into the Manager table */
INSERT INTO Manager (Manager_ID, Name, Gender, Email, Phone) 
VALUES 
('M001', 'Michael Scott', 'Male', 'michael.scott@example.com', 1234567890),
('M002', 'Leslie Knope', 'Female', 'leslie.knope@example.com', 9876543210);
/* Inserting data into the Inquiry table */
INSERT INTO Inquiry (Inquiry_ID, Subject, Response, Inquiry_Time, Inquiry_Date, Customer_ID, 
Customer_Care_ID) 
VALUES 
('I001', 'Ticket Booking', 'Your query has been resolved.', '10:00:00', '2024-05-01', 'C001', 'CC001'),
('I002', 'Movie Schedule', 'We will update you soon.', '12:30:00', '2024-05-02', 'C002', 'CC002');
/* Inserting data into the Ticket table */
INSERT INTO Ticket (Ticket_ID, Show_time, Price, Seat_No, Customer_ID, Movie_ID) 
VALUES 
('T001', '19:00:00', 15, 'A1', 'C001', 'M001'),
('T002', '21:00:00', 12, 'B2', 'C002', 'M002');
/* Inserting data into the Theater_Movie table */
INSERT INTO Theater_Movie (Theater_ID, Movie_ID) 
VALUES 
('T001', 'M001'),
('T002', 'M002');
/* Inserting data into the Admin table */
INSERT INTO Admin (Admin_ID, Email, First_Name, Last_Name, DOB, Manager_ID) 
VALUES 
('A001', 'admin1@example.com', 'Admin', 'One', '1980-01-01', 'M001'),
('A002', 'admin2@example.com', 'Admin', 'Two', '1975-02-02', 'M002');
/* Inserting data into the Admin_Phone table */
INSERT INTO Admin_Phone (Admin_ID, Phone) 
VALUES 
('A001', 1111111111),
('A002', 2222222222);
/* Inserting data into the Report table */
INSERT INTO Report (Report_ID, Name, Report_Date, Manager_ID) 
VALUES 
('R001', 'Financial Report', '2024-05-01', 'M001'),
('R002', 'Staff Report', '2024-05-02', 'M002');
/* Inserting data into the Movie_Show table */
INSERT INTO Movie_Show (Show_ID, Show_Date, Lanaguge, Loacation, Start_Time, End_Time, 
Movie_ID, Admin_ID) 
VALUES 
('MS001', '2024-05-10', 'English', 'Main Hall', '18:00:00', '21:00:00', 'M001', 'A001'),
('MS002', '2024-05-12', 'English', 'Second Hall', '20:00:00', '23:00:00', 'M002', 'A002');
/* Inserting data into the Payment table */
INSERT INTO Payment (Payment_ID, Payment_Date, Payement_Time, Amount, Ticket_ID, 
Customer_ID) 
VALUES 
('P001', '2024-05-01', '19:30:00', 15, 'T001', 'C001'),
('P002', '2024-05-02', '21:30:00', 12, 'T002', 'C002');