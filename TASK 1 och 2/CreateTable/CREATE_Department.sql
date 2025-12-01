CREATE TABLE Department(
    departmentId VARCHAR (50) UNIQUE NOT NULL PRIMARY KEY,
	departmentName VARCHAR (50) NOT NULL,
	departmentManagerId VARCHAR (50),
	FOREIGN KEY (departmentManagerId) REFERENCES Employee(employeeId)
);
