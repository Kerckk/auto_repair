CREATE TABLE Client ( 
    ClientID INT PRIMARY KEY AUTO_INCREMENT, 
    FirstName VARCHAR(50), 
    LastName VARCHAR(50), 
    Address VARCHAR(100), 
    Phone VARCHAR(15), 
    Email VARCHAR(100) 
); 
 
CREATE TABLE Car ( 
    CarID INT PRIMARY KEY AUTO_INCREMENT, 
    Make VARCHAR(50), 
    Model VARCHAR(50), 
    Year INT, 
    VIN VARCHAR(17) 
); 
 
CREATE TABLE Employee ( 
    EmployeeID INT PRIMARY KEY AUTO_INCREMENT, 
    FirstName VARCHAR(50), 
    LastName VARCHAR(50), 
    Position VARCHAR(50), 
    HireDate DATE, 
    Salary DECIMAL(10, 2) 
); 
 
CREATE TABLE `Order` ( 
    OrderID INT PRIMARY KEY AUTO_INCREMENT, 
    ClientID INT, 
    CarID INT, 
    EmployeeID INT, 
    OrderDate DATE, 
    TotalPrice DECIMAL(10, 2), 
    FOREIGN KEY (ClientID) REFERENCES Client(ClientID), 
    FOREIGN KEY (CarID) REFERENCES Car(CarID), 
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID) 
); 
 
CREATE TABLE Service ( 
    ServiceID INT PRIMARY KEY AUTO_INCREMENT, 
    ServiceName VARCHAR(100), 
    Description TEXT, 
    Price DECIMAL(10, 2) 
); 
 
CREATE TABLE OrderService ( 
    OrderServiceID INT PRIMARY KEY AUTO_INCREMENT, 
    OrderID INT, 
    ServiceID INT, 
    FOREIGN KEY (OrderID) REFERENCES `Order`(OrderID), 
    FOREIGN KEY (ServiceID) REFERENCES Service(ServiceID) 
); 
 
CREATE TABLE Part ( 
    PartID INT PRIMARY KEY AUTO_INCREMENT, 
    PartName VARCHAR(100), 
    Description TEXT, 
    Price DECIMAL(10, 2), 
    InStock INT 
); 
 
CREATE TABLE OrderPart ( 
    OrderPartID INT PRIMARY KEY AUTO_INCREMENT, 
    OrderID INT, 
    PartID INT, 
    Quantity INT, 
    FOREIGN KEY (OrderID) REFERENCES `Order`(OrderID), 
    FOREIGN KEY (PartID) REFERENCES Part(PartID) 
); 
 
CREATE TABLE Payment ( 
    PaymentID INT PRIMARY KEY AUTO_INCREMENT, 
    OrderID INT, 
    PaymentDate DATE, 
    Amount DECIMAL(10, 2), 
    PaymentMethod VARCHAR(50), 
    FOREIGN KEY (OrderID) REFERENCES `Order`(OrderID) 
); 
 
CREATE TABLE Appointment ( 
    AppointmentID INT PRIMARY KEY AUTO_INCREMENT, 
    ClientID INT, 
    EmployeeID INT, 
    AppointmentDate DATETIME, 
    Notes TEXT, 
    FOREIGN KEY (ClientID) REFERENCES Client(ClientID), 
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID) 
);
