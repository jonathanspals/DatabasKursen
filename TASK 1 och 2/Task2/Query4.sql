SELECT
    e.employeeId,
    e.firstName || ' ' || e.lastName AS "TeacherName",
    ci.coursePeriod                  AS "Period",
    COUNT(DISTINCT ci.instanceId)    AS "NoOfCourses"
FROM Employee e
JOIN CourseEmployee ce ON ce.employeeId = e.employeeId
JOIN CourseInstances ci ON ci.instanceId = ce.instanceId

GROUP BY e.employeeId, "TeacherName", ci.coursePeriod
HAVING COUNT(DISTINCT ci.instanceId) > 0;
