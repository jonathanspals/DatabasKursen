CREATE TABLE Employee(
    employeeId VARCHAR(50) UNIQUE NOT NULL PRIMARY KEY,
    firstName VARCHAR(50)NOT NULL,
    lastName VARCHAR(50)NOT NULL,
    title VARCHAR(50) NOT NULL,
    email VARCHAR(100)NOT NULL,
    phone VARCHAR(20)NOT NULL,
    salary INT NOT NULL,
    managerId VARCHAR(50),
    departmentId VARCHAR(50), 
    FOREIGN KEY (managerId) REFERENCES Employee(employeeId)
);
/* Koden nedan kör vi efter vi skapat Department table för att keys ska kopplas */
ALTER TABLE Employee
ADD FOREIGN KEY (departmentId)
REFERENCES Department(departmentId);
