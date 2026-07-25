CREATE TABLE hr_data (
    Age INT,
    Attrition VARCHAR(10),
    BusinessTravel VARCHAR(50),
    DailyRate INT,
    Department VARCHAR(50),
    DistanceFromHome INT,
    Education INT,
    EducationField VARCHAR(50),
    EmployeeCount INT,
    EmployeeNumber INT PRIMARY KEY,
    EnvironmentSatisfaction INT,
    Gender VARCHAR(10),
    HourlyRate INT,
    JobInvolvement INT,
    JobLevel INT,
    JobRole VARCHAR(100),
    JobSatisfaction INT,
    MaritalStatus VARCHAR(20),
    MonthlyIncome INT,
    MonthlyRate INT,
    NumCompaniesWorked INT,
    Over18 VARCHAR(5),
    OverTime VARCHAR(10),
    PercentSalaryHike INT,
    PerformanceRating INT,
    RelationshipSatisfaction INT,
    StandardHours INT,
    StockOptionLevel INT,
    TotalWorkingYears INT,
    TrainingTimesLastYear INT,
    WorkLifeBalance INT,
    YearsAtCompany INT,
    YearsInCurrentRole INT,
    YearsSinceLastPromotion INT,
    YearsWithCurrManager INT
);

COPY hr_data
FROM 'E:\\WA_Fn-UseC_-HR-Employee-Attrition.csv'
DELIMITER ','
CSV HEADER;


-- 1. View all records
SELECT *
FROM hr_data;

-- 2. Total number of employees
SELECT COUNT(*) AS Total_Employees
FROM hr_data;

-- 3. Employees who left the company
SELECT COUNT(*) AS Attrition_Count
FROM hr_data
WHERE Attrition = 'Yes';

-- 4. Employees who are still working
SELECT COUNT(*) AS Active_Employees
FROM hr_data
WHERE Attrition = 'No';

-- 5. Distinct departments
SELECT DISTINCT Department
FROM hr_data;

-- 6. Distinct job roles
SELECT DISTINCT JobRole
FROM hr_data;

-- 7. Average employee age
SELECT ROUND(AVG(Age),2) AS Average_Age
FROM hr_data;

-- 8. Average monthly income
SELECT ROUND(AVG(MonthlyIncome),2) AS Average_Monthly_Income
FROM hr_data;

-- 9. Highest monthly income
SELECT MAX(MonthlyIncome) AS Highest_Salary
FROM hr_data;

-- 10. Lowest monthly income
SELECT MIN(MonthlyIncome) AS Lowest_Salary
FROM hr_data;


-- 11. Employees older than 40
SELECT *
FROM hr_data
WHERE Age > 40;

-- 12. Employees earning more than 10000
SELECT EmployeeNumber, Age, Department, MonthlyIncome
FROM hr_data
WHERE MonthlyIncome > 10000;

-- 13. Female employees
SELECT *
FROM hr_data
WHERE Gender = 'Female';

-- 14. Male employees
SELECT *
FROM hr_data
WHERE Gender = 'Male';

-- 15. Married employees
SELECT *
FROM hr_data
WHERE MaritalStatus = 'Married';

-- 16. Employees in Sales department
SELECT *
FROM hr_data
WHERE Department = 'Sales';

-- 17. Employees with overtime
SELECT *
FROM hr_data
WHERE OverTime = 'Yes';

-- 18. Employees without overtime
SELECT *
FROM hr_data
WHERE OverTime = 'No';

-- 19. Employees who travel frequently
SELECT *
FROM hr_data
WHERE BusinessTravel = 'Travel_Frequently';

-- 20. Employees with attrition
SELECT EmployeeNumber, Age, Department, JobRole
FROM hr_data
WHERE Attrition = 'Yes';


-- 21. Total employees in each department
SELECT Department,
       COUNT(*) AS Total_Employees
FROM hr_data
GROUP BY Department
ORDER BY Total_Employees DESC;

-- 22. Average monthly income by department
SELECT Department,
       ROUND(AVG(MonthlyIncome),2) AS Avg_Monthly_Income
FROM hr_data
GROUP BY Department
ORDER BY Avg_Monthly_Income DESC;

-- 23. Average age by department
SELECT Department,
       ROUND(AVG(Age),2) AS Avg_Age
FROM hr_data
GROUP BY Department;

-- 24. Total employees by gender
SELECT Gender,
       COUNT(*) AS Employees
FROM hr_data
GROUP BY Gender;

-- 25. Attrition count by department
SELECT Department,
       COUNT(*) AS Attrition_Count
FROM hr_data
WHERE Attrition = 'Yes'
GROUP BY Department
ORDER BY Attrition_Count DESC;

-- 26. Employees by education field
SELECT EducationField,
       COUNT(*) AS Employees
FROM hr_data
GROUP BY EducationField
ORDER BY Employees DESC;

-- 27. Average salary by job role
SELECT JobRole,
       ROUND(AVG(MonthlyIncome),2) AS Avg_Salary
FROM hr_data
GROUP BY JobRole
ORDER BY Avg_Salary DESC;

-- 28. Employees by marital status
SELECT MaritalStatus,
       COUNT(*) AS Employees
FROM hr_data
GROUP BY MaritalStatus;

-- 29. Employees by business travel
SELECT BusinessTravel,
       COUNT(*) AS Employees
FROM hr_data
GROUP BY BusinessTravel;

-- 30. Employees by overtime status
SELECT OverTime,
       COUNT(*) AS Employees
FROM hr_data
GROUP BY OverTime;

-- 31. Departments having more than 100 employees
SELECT Department,
       COUNT(*) AS Employees
FROM hr_data
GROUP BY Department
HAVING COUNT(*) > 100;

-- 32. Job roles with average salary above 7000
SELECT JobRole,
       ROUND(AVG(MonthlyIncome),2) AS Avg_Salary
FROM hr_data
GROUP BY JobRole
HAVING AVG(MonthlyIncome) > 7000;

-- 33. Education fields having more than 100 employees
SELECT EducationField,
       COUNT(*) AS Employees
FROM hr_data
GROUP BY EducationField
HAVING COUNT(*) > 100;

-- 34. Departments with average age above 35
SELECT Department,
       ROUND(AVG(Age),2) AS Avg_Age
FROM hr_data
GROUP BY Department
HAVING AVG(Age) > 35;

-- 35. Business travel types with more than 100 employees
SELECT BusinessTravel,
       COUNT(*) AS Employees
FROM hr_data
GROUP BY BusinessTravel
HAVING COUNT(*) > 100;


-- 36. Classify employees by Age Group
SELECT EmployeeNumber,
       Age,
       CASE
           WHEN Age < 30 THEN 'Young'
           WHEN Age BETWEEN 30 AND 40 THEN 'Middle Age'
           ELSE 'Senior'
       END AS Age_Group
FROM hr_data;

-- 37. Salary Category
SELECT EmployeeNumber,
       MonthlyIncome,
       CASE
           WHEN MonthlyIncome < 5000 THEN 'Low'
           WHEN MonthlyIncome BETWEEN 5000 AND 10000 THEN 'Medium'
           ELSE 'High'
       END AS Salary_Category
FROM hr_data;

-- 38. Work Experience Category
SELECT EmployeeNumber,
       TotalWorkingYears,
       CASE
           WHEN TotalWorkingYears < 5 THEN 'Beginner'
           WHEN TotalWorkingYears BETWEEN 5 AND 10 THEN 'Experienced'
           ELSE 'Expert'
       END AS Experience_Level
FROM hr_data;

-- 39. Overtime Status
SELECT EmployeeNumber,
       OverTime,
       CASE
           WHEN OverTime='Yes' THEN 'Extra Working Hours'
           ELSE 'Regular Working Hours'
       END AS Work_Status
FROM hr_data;

-- 40. Attrition Status
SELECT EmployeeNumber,
       Attrition,
       CASE
           WHEN Attrition='Yes' THEN 'Employee Left'
           ELSE 'Employee Active'
       END AS Employee_Status
FROM hr_data;


-- 41. Employees earning more than average salary
SELECT EmployeeNumber,
       MonthlyIncome
FROM hr_data
WHERE MonthlyIncome >
(
    SELECT AVG(MonthlyIncome)
    FROM hr_data
);

-- 42. Oldest employee(s)
SELECT EmployeeNumber,
       Age
FROM hr_data
WHERE Age =
(
    SELECT MAX(Age)
    FROM hr_data
);

-- 43. Youngest employee(s)
SELECT EmployeeNumber,
       Age
FROM hr_data
WHERE Age =
(
    SELECT MIN(Age)
    FROM hr_data
);

-- 44. Employees with maximum monthly income
SELECT EmployeeNumber,
       MonthlyIncome
FROM hr_data
WHERE MonthlyIncome =
(
    SELECT MAX(MonthlyIncome)
    FROM hr_data
);

-- 45. Employees working more than average years
SELECT EmployeeNumber,
       TotalWorkingYears
FROM hr_data
WHERE TotalWorkingYears >
(
    SELECT AVG(TotalWorkingYears)
    FROM hr_data
);
-- 46. Rank employees by salary
SELECT EmployeeNumber,
       MonthlyIncome,
       RANK() OVER(ORDER BY MonthlyIncome DESC) AS Salary_Rank
FROM hr_data;

-- 47. Dense Rank employees by salary
SELECT EmployeeNumber,
       MonthlyIncome,
       DENSE_RANK() OVER(ORDER BY MonthlyIncome DESC) AS Dense_Salary_Rank
FROM hr_data;

-- 48. Row Number by salary
SELECT EmployeeNumber,
       MonthlyIncome,
       ROW_NUMBER() OVER(ORDER BY MonthlyIncome DESC) AS Row_Num
FROM hr_data;

-- 49. Rank employees within each department
SELECT Department,
       EmployeeNumber,
       MonthlyIncome,
       RANK() OVER(PARTITION BY Department ORDER BY MonthlyIncome DESC) AS Dept_Rank
FROM hr_data;

-- 50. Average salary of each department (Window Function)
SELECT Department,
       EmployeeNumber,
       MonthlyIncome,
       ROUND(AVG(MonthlyIncome)
       OVER(PARTITION BY Department),2) AS Dept_Avg_Salary
FROM hr_data;
