CREATE TABLE CourseLayout(
    courseLayoutId VARCHAR(50) UNIQUE NOT NULL PRIMARY KEY,
    courseCode VARCHAR(50) NOT NULL,
    courseName VARCHAR(50) NOT NULL, 
    hp DECIMAL NOT NULL,
    minStudents INT NOT NULL, 
    maxStudents INT
);