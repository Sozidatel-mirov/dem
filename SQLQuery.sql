CREATE DATABASE TechnoServis;
GO

USE TechnoServis;

CREATE TABLE RoleEmployes(
id INT PRIMARY KEY IDENTITY(1, 1) NOT NULL,
Role Varchar(50) NOT NULL
);

CREATE TABLE Employes(
id INT PRIMARY KEY IDENTITY(1, 1) NOT NULL,
FirstName Varchar(50) NOT NULL,
SurName Varchar(50) NOT NULL,
RoleEmploy INT NOT NULL,
FOREIGN KEY(RoleEmploy) REFERENCES RoleEmployes(id),
Login Varchar(50) NOT NULL,
Password Varchar(50) NOT NULL
);

CREATE TABLE Client(
id INT PRIMARY KEY IDENTITY(1, 1) NOT NULL,
FirstName Varchar(50) NOT NULL,
SurName Varchar(50) NOT NULL
);

CREATE TABLE StatusRequests(
id INT PRIMARY KEY IDENTITY(1, 1) NOT NULL,
StatusR Varchar(25) NOT NULL
);

CREATE TABLE TypeEquipments(
id INT PRIMARY KEY IDENTITY(1, 1) NOT NULL,
TypeEquipment Varchar(25) NOT NULL
);

CREATE TABLE Request(
id INT PRIMARY KEY IDENTITY(1, 1) NOT NULL,
SerialNumber VARCHAR(50),
TypeEquipment INT,
FOREIGN KEY(TypeEquipment) REFERENCES TypeEquipments(id),
Equipment Varchar(100) NOT NULL,
DateOfAdd Date NOT NULL,
TypeFaults Text,
DescriptionFaults Text,
Client INT NOT NULL,
FOREIGN KEY(Client) REFERENCES Client(id),
StatusRequest INT NOT NULL,
FOREIGN KEY(StatusRequest) REFERENCES StatusRequests(id),
Executor INT,
FOREIGN KEY(Executor) REFERENCES Employes(id),
Comment Text,
TimeStart Time NOT NULL,
TimeEnd Time NOT NULL,
DescriptionRepair TEXT,
PriorityRequest int NOT NULL
);

CREATE TABLE Warehouse(
id INT PRIMARY KEY IDENTITY(1, 1) NOT NULL,
NameDetail Varchar(50) NOT NULL,
Price Float NOT NULL
);

CREATE TABLE DetailFromWarehouse(
IDDetail INT NOT NULL,
IDRequest INT NOT NULL,
FOREIGN KEY(IDDetail) REFERENCES Warehouse(id),
FOREIGN KEY(IDRequest) REFERENCES Request(id),
);

CREATE TABLE Reviews(
id INT PRIMARY KEY IDENTITY(1, 1) NOT NULL,
Evaluation Bit NOT NULL,
TextReview Text NOT NULL,
Client INT NOT NULL,
FOREIGN KEY(Client) REFERENCES Client(id)
);


