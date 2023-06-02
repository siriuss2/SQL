USE [master]
GO

DROP DATABASE IF EXISTS [SEDCACADEMYDB]
GO

CREATE DATABASE [SEDCACADEMYDB]
GO

USE [SEDCACADEMYDB]
GO

CREATE TABLE [Students](
		[Id] [int] IDENTITY(1,1) NOT NULL,
		[FirstName] [nvarchar] (100) NOT NULL,
		[LastName] [nvarchar] (100) NOT NULL,
		[DateOfBirth] [date] NOT NULL,
		[EnrolledDate] [date] NOT NULL,
		[Gender] [nvarchar] (100) NOT NULL,
		[NationalIDNumber] [int] NOT NULL,
		[StudentCardNumber] [int] NOT NULL,
		CONSTRAINT [PK_Students] PRIMARY KEY CLUSTERED ([Id] ASC)
)

CREATE TABLE [Teachers](
		[Id] [int] IDENTITY(1,1) NOT NULL,
		[FirstName] [nvarchar] (100) NOT NULL,
		[LastName] [nvarchar] (100) NOT NULL,
		[DateOfBirth] [date] NOT NULL,
		[AcademicRank] [nvarchar](100) NOT NULL,
		[HireDate] [date] NOT NULL,

		CONSTRAINT [PK_Teachers] PRIMARY KEY CLUSTERED ([Id] ASC)
)

CREATE TABLE [Grades](
		[Id] [int] IDENTITY(1,1) NOT NULL,
		[StudentId] [int] NOT NULL,
		[CourseId] [int] NOT NULL,
		[TeacherId] [int] NOT NULL,
		[Grade] [int] NOT NULL,
		[Comment] [nvarchar] (100) NOT NULL,
		[CreatedDate] [date] NOT NULL

		CONSTRAINT [PK_Grades] PRIMARY KEY CLUSTERED ([Id] ASC)
)

CREATE TABLE [Courses](
		[Id] [int] IDENTITY(1,1) NOT NULL,
		[Name] [nvarchar](100) NOT NULL,
		[Credit] [int] NOT NULL,
		[AcademicYear] [date] NOT NULL,
		[Semester] [int] NOT NULL,

		CONSTRAINT [PK_Courses] PRIMARY KEY CLUSTERED ([Id] ASC)
)

CREATE TABLE [GradeDetails](
		[Id] [int] IDENTITY(1,1) NOT NULL,
		[GradeId] [int] NOT NULL,
		[AchievementTypeId] [int] NOT NULL,
		[AchievementPoints] [int] NOT NULL,
		[AchievementMaxPoints] [int] NOT NULL,
		[AchievementDate] [date] NOT NULL,


		CONSTRAINT [PK_GradeDetails] PRIMARY KEY CLUSTERED ([Id] ASC)
)

CREATE TABLE [AchievementType](
		[Id] [int] IDENTITY(1,1) NOT NULL,
		[Name] [nvarchar] (100) NOT NULL,
		[Description] [nvarchar] (100) NULL,
		[ParticipationRate] [int]


		CONSTRAINT [PK_AchievementType] PRIMARY KEY CLUSTERED ([Id] ASC)
)

