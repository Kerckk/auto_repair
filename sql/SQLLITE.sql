import sqlite3

# Создание подключения к базе данных (создание файла БД, если он не существует)
conn = sqlite3.connect('database.db')

# Создание курсора для выполнения операций с базой данных
cur = conn.cursor()

# Создание таблицы Client
cur.execute('''CREATE TABLE IF NOT EXISTS Client (
               ClientID INTEGER PRIMARY KEY,
               FirstName VARCHAR(50),
               LastName VARCHAR(50),
               Address VARCHAR(100),
               Phone VARCHAR(15),
               Email VARCHAR(100)
               );''')

# Создание таблицы Car
cur.execute('''CREATE TABLE IF NOT EXISTS Car (
               CarID INTEGER PRIMARY KEY,
               Make VARCHAR(50),
               Model VARCHAR(50),
               Year INT,
               VIN VARCHAR(17)
               );''')

# Создание таблицы Employee
cur.execute('''CREATE TABLE IF NOT EXISTS Employee (
               EmployeeID INTEGER PRIMARY KEY,
               FirstName VARCHAR(50),
               LastName VARCHAR(50),
               Position VARCHAR(50),
               HireDate DATE,
               Salary DECIMAL(10, 2)
               );''')

# Создание таблицы Order
cur.execute('''CREATE TABLE IF NOT EXISTS `Order` (
               OrderID INTEGER PRIMARY KEY,
               ClientID INT,
               CarID INT,
               EmployeeID INT,
               OrderDate DATE,
               TotalPrice DECIMAL(10, 2),
               FOREIGN KEY (ClientID) REFERENCES Client(ClientID),
               FOREIGN KEY (CarID) REFERENCES Car(CarID),
               FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID)
               );''')

# Создание таблицы Service
cur.execute('''CREATE TABLE IF NOT EXISTS Service (
               ServiceID INTEGER PRIMARY KEY,
               ServiceName VARCHAR(100),
               Description TEXT,
               Price DECIMAL(10, 2)
               );''')

# Создание таблицы OrderService
cur.execute('''CREATE TABLE IF NOT EXISTS OrderService (
               OrderServiceID INTEGER PRIMARY KEY,
               OrderID INT,
               ServiceID INT,
               FOREIGN KEY (OrderID) REFERENCES `Order`(OrderID),
               FOREIGN KEY (ServiceID) REFERENCES Service(ServiceID)
               );''')

# Создание таблицы Part
cur.execute('''CREATE TABLE IF NOT EXISTS Part (
               PartID INTEGER PRIMARY KEY,
               PartName VARCHAR(100),
               Description TEXT,
               Price DECIMAL(10, 2),
               InStock INT
               );''')

# Создание таблицы OrderPart
cur.execute('''CREATE TABLE IF NOT EXISTS OrderPart (
               OrderPartID INTEGER PRIMARY KEY,
               OrderID INT,
               PartID INT,
               Quantity INT,
               FOREIGN KEY (OrderID) REFERENCES `Order`(OrderID),
               FOREIGN KEY (PartID) REFERENCES Part(PartID)
               );''')

# Создание таблицы Payment
cur.execute('''CREATE TABLE IF NOT EXISTS Payment (
               PaymentID INTEGER PRIMARY KEY,
               OrderID INT,
               PaymentDate DATE,
               Amount DECIMAL(10, 2),
               PaymentMethod VARCHAR(50),
               FOREIGN KEY (OrderID) REFERENCES `Order`(OrderID)
               );''')

# Создание таблицы Appointment
cur.execute('''CREATE TABLE IF NOT EXISTS Appointment (
               AppointmentID INTEGER PRIMARY KEY,
               ClientID INT,
               EmployeeID INT,
               AppointmentDate DATETIME,
               Notes TEXT,
               FOREIGN KEY (ClientID) REFERENCES Client(ClientID),
               FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID)
               );''')

# Сохранение изменений
conn.commit()

# Закрытие курсора и соединения с базой данных
cur.close()
conn.close()
