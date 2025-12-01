CREATE TABLE EmployeeSkill(
	employeeId VARCHAR(50),
	skillId VARCHAR(50),
    FOREIGN KEY (employeeId) REFERENCES Employee(employeeId),
    FOREIGN KEY (skillId) REFERENCES Skillset(skillId),
    PRIMARY KEY (employeeId, skillId)
);