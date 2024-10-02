SELECT e.ISBN
FROM Editions e
JOIN Books b ON e.Book_ID = b.Book_ID
JOIN Authors a ON b.Author_ID = a.Author_ID
WHERE a.First_Name = 'Agatha' AND a.Last_Name = 'Christie'
ORDER BY e.ISBN DESC;
