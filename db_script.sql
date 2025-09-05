
-- Smart Leave Management System SQL script (SQL Server)
CREATE DATABASE SmartLeaveDB;
GO
USE SmartLeaveDB;
GO

CREATE TABLE Departments (
    DeptID INT IDENTITY(1,1) PRIMARY KEY,
    DeptName NVARCHAR(100) NOT NULL
);

CREATE TABLE Users (
    UserID INT IDENTITY(1,1) PRIMARY KEY,
    FullName NVARCHAR(150) NOT NULL,
    Email NVARCHAR(150) NOT NULL,
    PasswordHash NVARCHAR(256) NOT NULL,
    Role NVARCHAR(50) NOT NULL, -- Admin, Manager, Employee
    DeptID INT NULL,
    CONSTRAINT FK_Users_Dept FOREIGN KEY (DeptID) REFERENCES Departments(DeptID)
);

CREATE TABLE LeaveTypes (
    LeaveTypeID INT IDENTITY(1,1) PRIMARY KEY,
    TypeName NVARCHAR(50) NOT NULL,
    MaxDays INT NOT NULL
);

CREATE TABLE LeaveRequests (
    RequestID INT IDENTITY(1,1) PRIMARY KEY,
    UserID INT NOT NULL,
    LeaveTypeID INT NOT NULL,
    StartDate DATE NOT NULL,
    EndDate DATE NOT NULL,
    Reason NVARCHAR(500),
    Status NVARCHAR(50) NOT NULL, -- Pending, Approved, Rejected
    AppliedOn DATETIME DEFAULT GETDATE(),
    ManagerID INT NULL,
    CONSTRAINT FK_LeaveRequests_User FOREIGN KEY (UserID) REFERENCES Users(UserID),
    CONSTRAINT FK_LeaveRequests_LeaveType FOREIGN KEY (LeaveTypeID) REFERENCES LeaveTypes(LeaveTypeID)
);

-- Sample data
INSERT INTO Departments (DeptName) VALUES ('HR'), ('IT'), ('Finance');

INSERT INTO Users (FullName, Email, PasswordHash, Role, DeptID) VALUES
('Admin User', 'admin@example.com', 'admin123', 'Admin', 1),
('Manager One', 'manager1@example.com', 'manager123', 'Manager', 2),
('Employee One', 'employee1@example.com', 'emp123', 'Employee', 2);

INSERT INTO LeaveTypes (TypeName, MaxDays) VALUES ('Casual', 12), ('Sick', 10), ('Earned', 15);
