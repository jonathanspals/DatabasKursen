CREATE OR REPLACE VIEW vTotalAllocatedHours AS
SELECT
    ci.instanceId,
    cl.courseCode,
    cl.hp,
    ci.coursePeriod,
    e.employeeId,
    e.firstName  ' '  e.lastName AS teacherName,

    ta.teachingActivity,
    ta.factor,

    be.allocatedHours,
    (be.allocatedHours * ta.factor) AS weightedTotalAllocated

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
    coursePeriod AS period,
    teacherName,

    SUM(CASE WHEN teachingActivity = 'lecture'  THEN weightedTotalAllocated ELSE 0 END) AS lectureHours,
    SUM(CASE WHEN teachingActivity = 'tutorial' THEN weightedTotalAllocated ELSE 0 END) AS tutorialHours,
    SUM(CASE WHEN teachingActivity = 'lab'      THEN weightedTotalAllocated ELSE 0 END) AS labHours,
    SUM(CASE WHEN teachingActivity = 'seminar'  THEN weightedTotalAllocated ELSE 0 END) AS seminarHours,

    SUM(CASE WHEN teachingActivity = 'admin'    THEN weightedTotalAllocated ELSE 0 END) AS adminHours,
    SUM(CASE WHEN teachingActivity = 'exam'     THEN weightedTotalAllocated ELSE 0 END) AS examHours,

    -- everything else
    SUM(CASE WHEN teachingActivity NOT IN (
        'lecture','tutorial','lab','seminar','admin','exam')
        THEN weightedTotalAllocated ELSE 0 END) AS overheadHours,

    SUM(weightedTotalAllocated) AS totalHours

FROM vTotalAllocatedHours
WHERE teacherName = 'David Dahl'
GROUP BY
    courseCode, instanceId, hp,
    teacherName, coursePeriod

ORDER BY
    courseCode, instanceId, teacherName;

DROP VIEW IF EXISTS vTotalAllocatedHours CASCADE;