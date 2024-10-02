SELECT b.Title, SUM(e.Pages) AS Total_Pages
FROM Books b
JOIN Editions e ON b.Book_ID = e.Book_ID
GROUP BY b.Book_ID, b.Title
ORDER BY Total_Pages DESC;
