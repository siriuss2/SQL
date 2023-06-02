-- Declare scalar variable for storing FirstName values
-- • Assign value ‘Antonio’ to the FirstName variable
-- • Find all Students having FirstName same as the variable

DECLARE @FirstName VARCHAR(50);
SET @FirstName = 'Antonio';

SELECT *
FROM Student s
WHERE s.FirstName = @FirstName;

-- Declare table variable that will contain StudentId, StudentName and DateOfBirth
-- • Fill the table variable with all Female students

DECLARE @FemaleStudents TABLE (
    StudentId INT,
    StudentName VARCHAR(50),
    DateOfBirth DATE
);

INSERT INTO @FemaleStudents (StudentId, StudentName , DateOfBirth)
SELECT s.Id, s.FirstName , s.DateOfBirth
FROM Student s
WHERE s.Gender = 'F';

SELECT *
FROM @FemaleStudents

-- Declare temp table that will contain LastName and EnrolledDate columns
-- • Fill the temp table with all Male students having First Name starting with ‘A’
-- • Retrieve the students from the table which last name is with 7 characters

CREATE TABLE #TempStudents (
    LastName VARCHAR(50),
    EnrolledDate DATE
);

INSERT INTO #TempStudents (LastName, EnrolledDate)
SELECT s.LastName, s.EnrolledDate
FROM Student s
WHERE s.Gender = 'M' AND FirstName LIKE 'A%';

SELECT *
FROM #TempStudents
WHERE LEN(LastName) = 7;


-- Find all teachers whose FirstName length is less than 5 and
-- • the first 3 characters of their FirstName and LastName are the same

SELECT *
FROM Teacher t
WHERE LEN(t.FirstName) < 5 AND LEFT(t.FirstName, 3) = LEFT(t.LastName, 3);

