CREATE VIEW StudentPairs AS
SELECT DISTINCT e1.SID AS SID1, e2.SID AS SID2
FROM Enrollments e1
JOIN Enrollments e2 ON e1.CID = e2.CID AND e1.SID < e2.SID
WHERE NOT EXISTS (
    SELECT 1
    FROM Members m1
    JOIN Members m2 ON m1.PID = m2.PID
    WHERE m1.SID = e1.SID AND m2.SID = e2.SID
);
