SELECT DISTINCT m1.SID, s1.Name
FROM Members m1
JOIN Members m2 on m1.PID = m2.PID AND m1.SID != m2.SID
JOIN Students s1 ON m1.SID = s1.SID
WHERE EXISTS (
    SELECT 1
    FROM Enrollments e1
    JOIN Courses c1 and e1.CID = c1.CID
    WHERE e1.SID = m2.SID AND c1.C_Name IN ('EECS482', 'EECS483')
)
AND EXISTS(
    SELECT 1
    FROM Enrollments e2
    JOIN Courses c2 and e2.CID = c2.CID
    WHERE e2.SID = m2.SID AND c2.C_Name IN ('EECS484', 'EECS485')
)
AND EXISTS(
    SELECT 1
    FROM Enrollments e3
    JOIN Courses c3 and e3.CID = c3.CID
    WHERE e3.SID = m2.SID AND c3.C_Name IN ('EECS280')
)
ORDER BY s1.Name DESC;