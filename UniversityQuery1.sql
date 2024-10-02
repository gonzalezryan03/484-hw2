SELECT Courses.CID
FROM Courses
LEFT JOIN Enrollments ON Courses.CID = Enrollments.CID
LEFT JOIN Students ON Enrollments.SID = Students.SID
GROUP BY Courses.CID
HAVING COUNT(DISTINCT CASE WHEN Students.Major != 'CS' OR Students.Major IS NULL THEN Students.SID END) < 10
ORDER BY Courses.CID DESC;
