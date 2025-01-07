# school_managment_system
# School Management System Database

This project defines the database schema for a **School Management System**, facilitating the storage and management of essential information about students, teachers, classes, and subjects. The schema is designed to support efficient data handling for academic institutions.

## Features

1. **Student Management**:
    - Stores personal details such as name, date of birth, gender, address, and phone number.
    
2. **Teacher Management**:
    - Keeps track of teachers' details, including specialization, email, and contact information.

3. **Class Management**:
    - Defines classes and their assigned class teachers.

4. **Subject Management**:
    - Manages subjects and the teachers responsible for them.

5. **Enrollment Management**:
    - Allows tracking of student enrollments in specific classes or subjects.

## Database Structure

### Tables

#### 1. `Students`
| Column       | Type          | Description                         |
|--------------|---------------|-------------------------------------|
| `StudentID`  | INT (PK)      | Unique identifier for each student. |
| `FirstName`  | VARCHAR(50)   | First name of the student.          |
| `LastName`   | VARCHAR(50)   | Last name of the student.           |
| `DOB`        | DATE          | Date of birth of the student.       |
| `Gender`     | ENUM          | Gender of the student (Male/Female/Other). |
| `Address`    | VARCHAR(255)  | Address of the student.             |
| `PhoneNumber`| VARCHAR(15)   | Contact number.                     |

#### 2. `Teachers`
| Column       | Type          | Description                         |
|--------------|---------------|-------------------------------------|
| `TeacherID`  | INT (PK)      | Unique identifier for each teacher. |
| `FirstName`  | VARCHAR(50)   | First name of the teacher.          |
| `LastName`   | VARCHAR(50)   | Last name of the teacher.           |
| `SubjectSpecialization`| VARCHAR(50) | Area of expertise.             |
| `Email`      | VARCHAR(100)  | Email address.                      |
| `PhoneNumber`| VARCHAR(15)   | Contact number.                     |

#### 3. `Classes`
| Column         | Type          | Description                         |
|----------------|---------------|-------------------------------------|
| `ClassID`      | INT (PK)      | Unique identifier for each class.   |
| `ClassName`    | VARCHAR(50)   | Name of the class.                  |
| `ClassTeacherID`| INT (FK)     | ID of the teacher assigned to this class. |

#### 4. `Subjects`
| Column       | Type          | Description                         |
|--------------|---------------|-------------------------------------|
| `SubjectID`  | INT (PK)      | Unique identifier for each subject. |
| `SubjectName`| VARCHAR(100)  | Name of the subject.                |
| `TeacherID`  | INT (FK)      | ID of the teacher assigned to this subject. |

#### 5. `Enrollments`
| Column       | Type          | Description                         |
|--------------|---------------|-------------------------------------|
| `EnrollmentID`| INT (PK)     | Unique identifier for each enrollment. |
| `StudentID`  | INT (FK)      | ID of the enrolled student.         |
| `ClassID`    | INT (FK)      | ID of the enrolled class.           |
| `SubjectID`  | INT (FK)      | ID of the subject for enrollment.   |

## Relationships

- **Students** and **Enrollments**: Each student can enroll in multiple classes and subjects, tracked through the `Enrollments` table.
- **Teachers** and **Classes/Subjects**: Teachers can be assigned to specific classes and subjects, ensuring proper management.

## Getting Started

1. **Setup the Database**:
    - Execute the SQL file provided to create the database and all necessary tables.
    - Use a MySQL client like MySQL Workbench or the MySQL CLI tool for execution.

2. **Populate Data**:
    - Insert relevant records for students, teachers, classes, and subjects.
    
3. **Query Examples**:
    - Fetch all students in a specific class.
    - List subjects taught by a specific teacher.
    - Track enrollments by student or class.

## Contributing

Contributions are welcome! If you find any issues or wish to enhance the schema, feel free to raise a pull request or submit an issue.




