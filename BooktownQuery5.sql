WITH RowlingSubjects AS (
    SELECT DISTINCT b.Subject_ID
    FROM Books b
    JOIN Authors a ON b.Author_ID = a.Author_ID
    WHERE a.First_Name = 'J. K.' AND a.Last_Name = 'Rowling'
),
AuthorSubjectCounts AS (
    SELECT a.Author_ID, a.First_Name, a.Last_Name,
           COUNT(DISTINCT b.Subject_ID) AS SubjectCount
    FROM Authors a
    JOIN Books b ON a.Author_ID = b.Author_ID
    WHERE b.Subject_ID IN (SELECT Subject_ID FROM RowlingSubjects)
    GROUP BY a.Author_ID, a.First_Name, a.Last_Name
)
SELECT asc.Author_ID, asc.First_Name, asc.Last_Name
FROM AuthorSubjectCounts asc
WHERE asc.SubjectCount = (SELECT COUNT(*) FROM RowlingSubjects)
ORDER BY asc.Last_Name ASC, asc.Author_ID DESC;
