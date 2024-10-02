SELECT b.Title, e.Publication_Date, a.Author_ID, a.First_Name, a.Last_Name
FROM Authors a
JOIN Books b ON a.Author_ID = b.Author_ID
JOIN Editions e ON b.Book_ID = e.Book_ID
WHERE a.Author_ID IN (
    SELECT DISTINCT a.Author_ID
    FROM Authors a
    JOIN Books b ON a.Author_ID = b.Author_ID
    JOIN Editions e ON b.Book_ID = e.Book_ID
    WHERE e.Publication_Date BETWEEN '2003-01-01' AND '2008-12-31'
)
ORDER BY a.Author_ID ASC, b.Title ASC, e.Publication_Date DESC;
