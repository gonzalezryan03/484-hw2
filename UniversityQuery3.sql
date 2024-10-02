SELECT e.SID
FROM Enrollments e
JOIN Courses c ON c.CID = e.CID
GROUP BY e.SID
HAVING
    MAX(CASE WHEN c.C_Name = 'EECS281' THEN 1 ELSE 0 END) = 1
    OR
    (
     MAX(CASE WHEN c.C_Name = 'EECS482' THEN 1 ELSE 0 END) = 1
     AND
     MAX(CASE WHEN c.C_Name = 'EECS486' THEN 1 ELSE 0 END) = 1
    )
    OR
    (
     MAX(CASE WHEN c.C_Name = 'EECS442' THEN 1 ELSE 0 END) = 1
     AND
     MAX(CASE WHEN c.C_Name = 'EECS445' THEN 1 ELSE 0 END) = 1
     AND
     MAX(CASE WHEN c.C_Name = 'EECS492' THEN 1 ELSE 0 END) = 1
    )
ORDER BY e.SID ASC;