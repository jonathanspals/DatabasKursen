CREATE TABLE CourseEmployee(
	instanceId VARCHAR(50),
	employeeId VARCHAR(50),
	FOREIGN KEY (instanceId) REFERENCES CourseInstances(instanceId),
	FOREIGN KEY (employeeId) REFERENCES Employee(employeeId),
	PRIMARY KEY (instanceId, employeeId)
);