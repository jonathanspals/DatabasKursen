CREATE TABLE CourseInstances(
    instanceId VARCHAR(50) UNIQUE NOT NULL PRIMARY KEY, 
    courseLayoutId VARCHAR(50),
    coursePeriod VARCHAR(10) NOT NULL,
    students INT NOT NULL, 
    lectureHours INT NOT NULL, 
    tutorialHours INT, 
    labHours INT, 
    seminarHours INT, 
    adminHours INT NOT NULL, 
    examHours INT, 
    FOREIGN KEY (courseLayoutId) REFERENCES CourseLayout(courseLayoutId)
);