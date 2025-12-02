CREATE TABLE PlannedActivity(
    plannedActivityId VARCHAR(50) UNIQUE NOT NULL PRIMARY KEY,
    activityName VARCHAR(50) NOT NULL,
    plannedHours INT,
    teachingActivityId VARCHAR(50),
	instanceId VARCHAR(50),
    FOREIGN KEY(instanceId) REFERENCES CourseInstances(instanceId),
    FOREIGN KEY(teachingActivityId) REFERENCES TeachingActivity(teachingActivityId)
);