CREATE OR REPLACE VIEW vAllocatedHours AS
SELECT
    ci.instanceId,
    cl.courseCode,
    cl.hp,

    e.employeeId,
    e.firstName  || ' ' || e.lastName AS teacherName,
    e.title AS designation,

    ta.teachingActivity,
    ta.factor,

    be.allocatedHours,
    (be.allocatedHours * ta.factor) AS weightedAllocated

FROM BookedEmployee be
JOIN Employee e
    ON be.employeeId = e.employeeId
JOIN PlannedActivity pa
    ON be.plannedActivityId = pa.plannedActivityId
JOIN TeachingActivity ta
    ON pa.teachingActivityId = ta.teachingActivityId
JOIN CourseInstances ci
    ON pa.instanceId = ci.instanceId
JOIN CourseLayout cl
    ON ci.courseLayoutId = cl.courseLayoutId;


SELECT
    courseCode,
    instanceId,
    hp,
    teacherName,
    designation,

    SUM(CASE WHEN teachingActivity = 'lecture'  THEN weightedAllocated ELSE 0 END) AS lectureHours,
    SUM(CASE WHEN teachingActivity = 'tutorial' THEN weightedAllocated ELSE 0 END) AS tutorialHours,
    SUM(CASE WHEN teachingActivity = 'lab'      THEN weightedAllocated ELSE 0 END) AS labHours,
    SUM(CASE WHEN teachingActivity = 'seminar'  THEN weightedAllocated ELSE 0 END) AS seminarHours,

    SUM(CASE WHEN teachingActivity = 'admin'    THEN weightedAllocated ELSE 0 END) AS adminHours,
    SUM(CASE WHEN teachingActivity = 'exam'     THEN weightedAllocated ELSE 0 END) AS examHours,

    
    SUM(CASE WHEN teachingActivity NOT IN (
        'lecture','tutorial','lab','seminar','admin','exam')
        THEN weightedAllocated ELSE 0 END) AS overheadHours,

    SUM(weightedAllocated) AS totalHours

FROM vAllocatedHours
GROUP BY
    courseCode, instanceId, hp,
    teacherName, designation

ORDER BY
    courseCode, instanceId, teacherName;
