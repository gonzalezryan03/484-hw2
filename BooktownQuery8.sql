SELECT DISTINCT p.Publisher_ID, p.Name
FROM Publishers p
JOIN Editions e ON p.Publisher_ID = e.Publisher_ID
JOIN Books b ON e.Book_ID = b.Book_ID
WHERE b.Author_ID IN (
    SELECT Author_ID
    FROM Books
    GROUP BY Author_ID
    HAVING COUNT(DISTINCT Book_ID) = 3
)
ORDER BY p.Publisher_ID DESC;
