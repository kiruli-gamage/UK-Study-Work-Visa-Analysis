USE UK_Immigration;
GO

SELECT name
FROM sys.tables;

---Remove any invalid rows

-- Clean Study Sponsorship - Nationality
DELETE FROM StudySponsorship_Nationality
WHERE ISNUMERIC(Year) = 0 OR Year IS NULL;

-- Clean Study Sponsorship - Sector
DELETE FROM StudySponsorship_Sector
WHERE ISNUMERIC(Year) = 0 OR Year IS NULL;

-- Clean Work Sponsorship - Industry
DELETE FROM WorkSponsorship_Industry
WHERE ISNUMERIC(Year) = 0 OR Year IS NULL;

-- Clean Work Sponsorship - Nationality
DELETE FROM WorkSponsorship_Nationality
WHERE ISNUMERIC(Year) = 0 OR Year IS NULL;

---Convert data types properly

ALTER TABLE StudySponsorship_Nationality
ALTER COLUMN Year INT;

ALTER TABLE StudySponsorship_Nationality
ALTER COLUMN Applications INT;

---Check your cleaned data
SELECT TOP 10 * FROM StudySponsorship_Nationality;
SELECT TOP 10 * FROM StudySponsorship_Sector;
SELECT TOP 10 * FROM WorkSponsorship_Industry;
SELECT TOP 10 * FROM WorkSponsorship_Nationality;

SELECT @@SERVERNAME;
