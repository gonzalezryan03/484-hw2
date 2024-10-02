SELECT s.Subject
FROM Subjects s
LEFT JOIN Books b ON s.Subject_ID = b.Subject_ID
WHERE b.Book_ID IS NULL
ORDER BY s.Subject ASC;
