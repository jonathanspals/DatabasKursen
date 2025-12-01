CREATE TABLE BookedEmployee(
	employeeId VARCHAR(50),
	plannedActivityId VARCHAR(50),
	allocatedHours INT,
    FOREIGN KEY (employeeId) REFERENCES Employee(employeeId),
    FOREIGN KEY (plannedActivityId) REFERENCES PlannedActivity(plannedActivityId),
    PRIMARY KEY(employeeId, plannedActivityId)
);
