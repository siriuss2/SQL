-- Find all Students with FirstName = Antonio
SELECT *
FROM Student s
WHERE s.FirstName = 'Antonio'


-- Find all Students with DateOfBirth greater than ‘01.01.1999’
SELECT *
FROM Student s
WHERE s.DateOfBirth > '1999.01.01'


-- Find all Students with LastName starting With ‘J’ enrolled in January/1998
SELECT *
FROM Student s
WHERE s.LastName LIKE 'J%' AND s.EnrolledDate >= '1998-01-01' AND s.EnrolledDate <= '1998-01-31';


-- List all Students ordered by FirstName
SELECT *
FROM Student s
ORDER BY s.FirstName


-- List all Teacher Last Names and Student Last Names in single result set. Remove duplicates
SELECT DISTINCT LastName
FROM(
	SELECT LastName FROM Teacher
	UNION
	SELECT LastName FROM Student
) AS Names 

-- Create Foreign key constraints from diagram or with script
ALTER TABLE Grade
ADD CONSTRAINT FK_Student_Grade
FOREIGN KEY (StudentID) REFERENCES [dbo].[Student]([Id]);

ALTER TABLE Grade
ADD CONSTRAINT FK_Course_Grade
FOREIGN KEY (CourseID) REFERENCES [dbo].[Course]([Id]);

ALTER TABLE Grade
ADD CONSTRAINT FK_Teacher_Grade2
FOREIGN KEY (TeacherID) REFERENCES [dbo].[Teacher]([Id]);

ALTER TABLE GradeDetails
ADD CONSTRAINT FK_Grade_GradeDetails
FOREIGN KEY (GradeID) REFERENCES [dbo].[Grade]([Id]);

ALTER TABLE GradeDetails
ADD CONSTRAINT FK_AchievementType_GradeDetails
FOREIGN KEY (AchievementTypeID) REFERENCES [dbo].[AchievementType]([Id]);


-- List all possible combinations of Courses names and AchievementType names that can be passed by student
SELECT c.Name AS 'Course Name', a.Name AS 'Achievement Type Name'
FROM Course c
CROSS JOIN AchievementType a;


-- List all Teachers without exam Grade
SELECT *
FROM Teacher t
LEFT JOIN Grade g ON t.Id = g.TeacherID
WHERE g.TeacherID IS NULL;
