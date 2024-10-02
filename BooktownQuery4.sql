SELECT a.First_Name, a.Last_Name
FROM Authors a
JOIN Books b ON a.Author_ID = b.Author_ID
JOIN Subjects s ON b.Subject_ID = s.Subject_ID
GROUP BY a.Author_ID, a.First_Name, a.Last_Name
HAVING
    SUM(CASE WHEN s.Subject = 'Children/YA' THEN 1 ELSE 0 END) >= 1
    AND
    SUM(CASE WHEN s.Subject = 'Fiction' THEN 1 ELSE 0 END) >= 1
ORDER BY a.First_Name ASC, a.Last_Name ASC;
