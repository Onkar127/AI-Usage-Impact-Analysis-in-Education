SELECT COUNT(*) 
FROM students
WHERE State IS NULL OR State = '';
SET SQL_SAFE_UPDATES = 0;
UPDATE students
SET State = 'Unknown'
WHERE State IS NULL OR State = '';

UPDATE students
SET State = 'Unknown'
WHERE State IS NULL AND id > 0;

SELECT DISTINCT Internet_Access
FROM students;

UPDATE students
SET Internet_Access = 'High'
WHERE Internet_Access IN ('high','HIGH');

SELECT DISTINCT AI_Tools_Used
FROM students;

UPDATE students
SET AI_Tools_Used = 'ChatGPT'
WHERE AI_Tools_Used IN ('chatgpt','CHATGPT');

UPDATE students
SET Daily_Usage_Hours = 24
WHERE Daily_Usage_Hours > 24;

SELECT College_Name, Stream, COUNT(*)
FROM students
GROUP BY College_Name, Stream
HAVING COUNT(*) > 1;


ALTER TABLE students
DROP COLUMN Device_Used;

SELECT COUNT(*)
FROM students;

SELECT 
COUNT(*) 
FROM students
GROUP BY 
College_Name,
stream ,
Year_of_Study,
AI_Tools_Used,
Daily_Usage_Hours,
Use_Cases,
Trust_in_AI_Tools,
Impact_on_Grades,
Do_Professors_Allow_Use,
Preferred_AI_Tool,
Awareness_Level,
Willing_to_Pay_for_Access,
State,
Device_Used,
Internet_Access
HAVING COUNT(*) > 1;