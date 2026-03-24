-- AI Dependency by Stream--
SELECT Stream, AI_Dependency_Level, COUNT(*) AS Students
FROM Students
GROUP BY Stream, AI_Dependency_Level 
ORDER BY Stream;