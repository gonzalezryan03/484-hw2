SELECT Author_ID
FROM Books
GROUP BY Author_ID
HAVING COUNT(*) = 1
ORDER BY Author_ID ASC;
