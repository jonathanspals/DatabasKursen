CREATE OR REPLACE VIEW vPlannedHours AS
SELECT 
    ci.instanceId,
    ci.coursePeriod,
    ci.students,
    cl.courseCode,
    cl.hp,

    pa.plannedActivityId,
    pa.plannedHours,

    ta.teachingActivity,
    ta.factor,

    ( pa.plannedHours + (ta.factor * ci.students) ) AS weightedHours

FROM CourseInstances ci
JOIN CourseLayout cl
    ON ci.courseLayoutId = cl.courseLayoutId
JOIN PlannedActivity pa
    ON pa.instanceId = ci.instanceId
JOIN TeachingActivity ta
    ON ta.teachingActivityId = pa.teachingActivityId;


--EXPLAIN ANALYZE
SELECT
    courseCode,
    instanceId,
    hp,
    students,
    coursePeriod AS period,

    SUM(CASE WHEN teachingActivity = 'lecture'  THEN weightedHours ELSE 0 END) AS lectureHours,
    SUM(CASE WHEN teachingActivity = 'tutorial' THEN weightedHours ELSE 0 END) AS tutorialHours,
    SUM(CASE WHEN teachingActivity = 'lab'      THEN weightedHours ELSE 0 END) AS labHours,
    SUM(CASE WHEN teachingActivity = 'seminar'  THEN weightedHours ELSE 0 END) AS seminarHours,
    SUM(CASE WHEN teachingActivity = 'admin'    THEN weightedHours ELSE 0 END) AS adminHours,
    SUM(CASE WHEN teachingActivity = 'exam'     THEN weightedHours ELSE 0 END) AS examHours,

    SUM(weightedHours) AS totalHours

FROM vPlannedHours
GROUP BY courseCode, instanceId, hp, students, coursePeriod
ORDER BY courseCode, instanceId;