-- RiskLevel --
ALTER TABLE Students
ADD RiskLevel VARCHAR(20);

UPDATE Students
SET RiskLevel =
CASE
    WHEN (
        (CASE WHEN Daily_Usage_Hours > 3 THEN 20 WHEN Daily_Usage_Hours > 2 THEN 10 ELSE 0 END) +
        (CASE WHEN ABS(Impact_on_Grades) > 3 THEN 20 WHEN ABS(Impact_on_Grades) > 1 THEN 10 ELSE 0 END) +
        (CASE WHEN Trust_in_AI_Tools < 2 THEN 20 WHEN Trust_in_AI_Tools < 4 THEN 10 ELSE 0 END) +
        (CASE WHEN Do_Professors_Allow_Use = 'No' THEN 20 ELSE 0 END) +
        (CASE WHEN Internet_Access = 'Poor' THEN 20 WHEN Internet_Access = 'Medium' THEN 10 ELSE 0 END)
    ) >= 80 THEN 'CRITICAL'

    WHEN (
        (CASE WHEN Daily_Usage_Hours > 3 THEN 20 WHEN Daily_Usage_Hours > 2 THEN 10 ELSE 0 END) +
        (CASE WHEN ABS(Impact_on_Grades) > 3 THEN 20 WHEN ABS(Impact_on_Grades) > 1 THEN 10 ELSE 0 END) +
        (CASE WHEN Trust_in_AI_Tools < 2 THEN 20 WHEN Trust_in_AI_Tools < 4 THEN 10 ELSE 0 END) +
        (CASE WHEN Do_Professors_Allow_Use = 'No' THEN 20 ELSE 0 END) +
        (CASE WHEN Internet_Access = 'Poor' THEN 20 WHEN Internet_Access = 'Medium' THEN 10 ELSE 0 END)
    ) >= 60 THEN 'HIGH'

    WHEN (
        (CASE WHEN Daily_Usage_Hours > 3 THEN 20 WHEN Daily_Usage_Hours > 2 THEN 10 ELSE 0 END) +
        (CASE WHEN ABS(Impact_on_Grades) > 3 THEN 20 WHEN ABS(Impact_on_Grades) > 1 THEN 10 ELSE 0 END) +
        (CASE WHEN Trust_in_AI_Tools < 2 THEN 20 WHEN Trust_in_AI_Tools < 4 THEN 10 ELSE 0 END) +
        (CASE WHEN Do_Professors_Allow_Use = 'No' THEN 20 ELSE 0 END) +
        (CASE WHEN Internet_Access = 'Poor' THEN 20 WHEN Internet_Access = 'Medium' THEN 10 ELSE 0 END)
    ) >= 40 THEN 'MEDIUM'

    WHEN (
        (CASE WHEN Daily_Usage_Hours > 3 THEN 20 WHEN Daily_Usage_Hours > 2 THEN 10 ELSE 0 END) +
        (CASE WHEN ABS(Impact_on_Grades) > 3 THEN 20 WHEN ABS(Impact_on_Grades) > 1 THEN 10 ELSE 0 END) +
        (CASE WHEN Trust_in_AI_Tools < 2 THEN 20 WHEN Trust_in_AI_Tools < 4 THEN 10 ELSE 0 END) +
        (CASE WHEN Do_Professors_Allow_Use = 'No' THEN 20 ELSE 0 END) +
        (CASE WHEN Internet_Access = 'Poor' THEN 20 WHEN Internet_Access = 'Medium' THEN 10 ELSE 0 END)
    ) >= 20 THEN 'LOW'

    ELSE 'SAFE'
END;


-- AI Dependency Level --

ALTER TABLE Students
ADD AI_Dependency_Level VARCHAR(20);

UPDATE Students
SET AI_Dependency_Level =
CASE
    WHEN Daily_Usage_Hours >= 4 THEN 'Very High'
    WHEN Daily_Usage_Hours >= 3 THEN 'High'
    WHEN Daily_Usage_Hours >= 2 THEN 'Moderate'
    WHEN Daily_Usage_Hours >= 1 THEN 'Low'
    ELSE 'Minimal'
END;

 