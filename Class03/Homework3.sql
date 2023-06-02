-- Calculate the count of all grades per Teacher in the system
SELECT t.FirstName , t.LastName , COUNT(g.Grade) AS GradeCount
FROM Teacher t
LEFT JOIN Grade g ON t.Id = g.TeacherID
GROUP BY t.Id , t.FirstName , t.LastName


-- Calculate the count of all grades per Teacher in the system for first 100 Students (ID < 100)
SELECT s.FirstName , s.LastName , COUNT(g.Grade) AS GradeCount
FROM Teacher t
LEFT JOIN Grade g ON t.Id = g.TeacherID
JOIN Student s ON g.StudentID = s.Id
WHERE s.Id < 100
GROUP BY s.Id , s.FirstName , s.LastName


-- Find the Maximal Grade, and the Average Grade per Student on all grades in the system
SELECT StudentID, MAX(Grade) AS MaxGrade, AVG(Grade) AS AvgGrade
FROM Grade
GROUP BY StudentID;

-- Calculate the count of all grades per Teacher in the system and filter only grade count greater then 200
SELECT t.FirstName AS Teacher , COUNT(*) AS GradeCount
FROM Grade g
JOIN Teacher t ON t.Id = g.TeacherID
GROUP BY t.FirstName
HAVING COUNT(*) > 200;


-- Find the Grade Count, Maximal Grade, and the Average Grade per Student on all grades in the 
-- system. Filter only records where Maximal Grade is equal to Average Grade
SELECT s.FirstName,COUNT(g.Grade) AS GradeCount , AVG(g.Grade) AS GradeAvg , MAX(g.Grade) AS GradeMax
FROM Grade g
JOIN Student s On s.Id = g.StudentID
GROUP BY s.FirstName
HAVING MAX(g.Grade) = AVG(g.Grade) 


-- List Student First Name and Last Name next to the other details from previous query
SELECT s.FirstName, s.LastName , COUNT(g.Grade) AS GradeCount , AVG(g.Grade) AS GradeAvg , MAX(g.Grade) AS GradeMax
FROM Grade g
JOIN Student s On s.Id = g.StudentID
GROUP BY s.FirstName , s.LastName
HAVING MAX(g.Grade) = AVG(g.Grade) 


-- Create new view (vv_StudentGrades) that will List all StudentIds and count of Grades per student
CREATE VIEW vv_StudentGrades
AS
SELECT StudentID,  COUNT(*) AS GradeCount
FROM Grade
GROUP BY StudentID

SELECT * FROM vv_StudentGrades
GO


-- Change the view to show Student First and Last Names instead of StudentID
CREATE VIEW vv_StudentGrades1
AS
SELECT s.FirstName , s.LastName , COUNT(*) AS GradeCount
FROM Grade g
JOIN Student s ON s.Id = g.StudentID
GROUP BY s.Id , s.FirstName , s.LastName

SELECT * FROM vv_StudentGrades1
GO

-- List all rows from view ordered by biggest Grade Count
SELECT * 
FROM vv_StudentGrades1
ORDER BY GradeCount DESC



