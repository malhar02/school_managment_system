CREATE DATABASE SchoolManagementSystem;
USE SchoolManagementSystem;
CREATE TABLE Students (
    StudentID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    DOB DATE NOT NULL,
    Gender ENUM('Male', 'Female', 'Other') NOT NULL,
    Address VARCHAR(255),
    PhoneNumber VARCHAR(15)
);
CREATE TABLE Teachers (
    TeacherID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    SubjectSpecialization VARCHAR(50) NOT NULL,
    Email VARCHAR(100),
    PhoneNumber VARCHAR(15)
);
CREATE TABLE Classes (
    ClassID INT AUTO_INCREMENT PRIMARY KEY,
    ClassName VARCHAR(50) NOT NULL,
    ClassTeacherID INT,
    FOREIGN KEY (ClassTeacherID) REFERENCES Teachers(TeacherID)
);
CREATE TABLE Subjects (
    SubjectID INT AUTO_INCREMENT PRIMARY KEY,
    SubjectName VARCHAR(100) NOT NULL,
    TeacherID INT,
    FOREIGN KEY (TeacherID) REFERENCES Teachers(TeacherID)
);
CREATE TABLE Enrollments (
    EnrollmentID INT AUTO_INCREMENT PRIMARY KEY,
    StudentID INT,
    ClassID INT,
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (ClassID) REFERENCES Classes(ClassID)
);
CREATE TABLE Attendance (
    AttendanceID INT AUTO_INCREMENT PRIMARY KEY,
    StudentID INT,
    ClassID INT,
    Date DATE NOT NULL,
    Status ENUM('Present', 'Absent') NOT NULL,
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (ClassID) REFERENCES Classes(ClassID)
);
CREATE TABLE Grades (
    GradeID INT AUTO_INCREMENT PRIMARY KEY,
    StudentID INT,
    SubjectID INT,
    Marks INT CHECK (Marks >= 0 AND Marks <= 100),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (SubjectID) REFERENCES Subjects(SubjectID)
);
INSERT INTO Students (FirstName, LastName, DOB, Gender, Address, PhoneNumber) VALUES
('John', 'Doe', '2010-05-15', 'Male', '123 Elm Street', '9876543210'),
('Jane', 'Smith', '2012-09-21', 'Female', '456 Maple Avenue', '9876543221'),
('sahitya', 'kumar', '2012-09-21', 'Female', '456 Maple Avenue', '9876543221');
INSERT INTO Teachers (FirstName, LastName, SubjectSpecialization, Email, PhoneNumber) VALUES
('Alice', 'Johnson', 'Mathematics', 'alice.johnson@example.com', '9876543232'),
('Bob', 'Brown', 'Physics', 'bob.brown@example.com', '9876543243');

-- Insert Sample Data into Classes Table
INSERT INTO Classes (ClassName, ClassTeacherID) VALUES
('Grade 10', 1),
('Grade 11', 2);

-- Insert Sample Data into Subjects Table
INSERT INTO Subjects (SubjectName, TeacherID) VALUES
('Algebra', 1),
('Mechanics', 2);

-- Insert Sample Data into Enrollments Table
INSERT INTO Enrollments (StudentID, ClassID) VALUES
(1, 1),
(2, 2);

-- Insert Sample Data into Attendance Table
INSERT INTO Attendance (StudentID, ClassID, Date, Status) VALUES
(1, 1, '2024-11-01', 'Present'),
(2, 2, '2024-11-01', 'Absent');

-- Insert Sample Data into Grades Table
INSERT INTO Grades (StudentID, SubjectID, Marks) VALUES
(1, 1, 85),
(2, 2, 90);
-- Query Example: Retrieve all students and their respective classes
SELECT 
    Students.FirstName AS StudentName,
    Classes.ClassName AS ClassName
FROM 
    Students
JOIN 
    Enrollments ON Students.StudentID = Enrollments.StudentID
JOIN 
    Classes ON Enrollments.ClassID = Classes.ClassID;
-- Query Example: Get Attendance Summary
SELECT 
    Students.FirstName AS StudentName,
    Attendance.Date,
    Attendance.Status
FROM 
    Attendance
JOIN 
    Students ON Attendance.StudentID = Students.StudentID;
    
-- Query Example: Get Grades of Students
SELECT 
    Students.FirstName AS StudentName,
    Subjects.SubjectName,
    Grades.Marks
FROM 
    Grades
JOIN 
    Students ON Grades.StudentID = Students.StudentID
JOIN 
    Subjects ON Grades.SubjectID = Subjects.SubjectID;

-- Query Example: ROLL NUMBER OF STUDENT
SELECT 
    StudentID AS RollNumber, 
    CONCAT(FirstName, ' ', LastName) AS FullName 
FROM 
    Students
WHERE 
    FirstName = 'John' AND LastName = 'Doe';
