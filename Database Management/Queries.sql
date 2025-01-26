use EMS
-- 1. Count Approved Leave Requests for Each Employee /aggregate /wafik
SELECT 
    E.Name AS EmployeeName, 
    COUNT(L.LeaveID) AS ApprovedLeaveCount
FROM 
    LeaveRequest L
JOIN 
    Employee E ON L.EmployeeID = E.EmployeeID
WHERE 
    L.Status = 'Approved'
GROUP BY 
    E.Name;

-- 2. Find Employees with No Leave Requests // sub query   / shahwan
SELECT 
    E.Name AS EmployeeName
FROM 
    Employee E
WHERE 
    E.EmployeeID NOT IN (
        SELECT 
            EmployeeID
        FROM 
            LeaveRequest
    );

-- 3. Total Leave Requests and Average Salary for Each Department /aggregate  / wafik
SELECT 
    E.DepartmentID, 
    COUNT(L.LeaveID) AS TotalLeaveRequests, 
    AVG(P.Salary) AS AverageSalary
FROM 
    Employee E
LEFT JOIN 
    LeaveRequest L ON E.EmployeeID = L.EmployeeID
JOIN 
    Payroll P ON E.EmployeeID = P.EmployeeID
GROUP BY 
    E.DepartmentID;

-- 4. Employees and Their Leave Request Details  /omar
SELECT 
    E.Name AS EmployeeName, 
    L.Type AS LeaveType, 
    L.Duration AS 'LeaveDuration (Days)', 
    L.Status AS LeaveStatus
FROM 
    Employee E
JOIN 
    LeaveRequest L ON E.EmployeeID = L.EmployeeID;

-- 5. Employees and Their Payroll Details  / omar
SELECT 
    E.Name AS EmployeeName, 
    P.Salary, 
    P.Deductions, 
    P.NetPay
FROM 
    Employee E
JOIN 
    Payroll P ON E.EmployeeID = P.EmployeeID;

-- 6. Recruiters Managing More Than 2 Job Advertisements  / shahwan
SELECT 
    R.RecruiterID
FROM 
    Recruiter R
JOIN 
    JobAdvertisement J ON R.RecruiterID = J.RecruiterID
GROUP BY 
    R.RecruiterID
HAVING 
    COUNT(J.JobID) > 2;

-- 7. Employees with Tardiness Records  / omar
SELECT 
    E.Name AS EmployeeName, 
    A.TardinessCount
FROM 
    Employee E
JOIN 
    Attendance A ON E.EmployeeID = A.EmployeeID
WHERE 
    A.TardinessCount > 0;

-- 8. Find Employees Who Have Been Counseled /sub query   /shahwan
SELECT 
    E.Name AS EmployeeName
FROM 
    Employee E
WHERE 
    E.EmployeeID IN (
        SELECT 
            EmployeeID
        FROM 
            Counseling
    );


-- 9. Average Leave Duration by Leave Type  / aggregate  / wafikk
SELECT 
    L.Type AS LeaveType, 
    AVG(L.Duration) AS AverageLeaveDuration
FROM 
    LeaveRequest L
GROUP BY 
    L.Type;

-- 10. Public Holidays and Assigned Employees
SELECT 
    H.Description AS HolidayDescription, 
    H.Date AS HolidayDate, 
    E.Name AS EmployeeName
FROM 
    Holiday H
JOIN 
    Employee E ON H.AssignedToEmployeeID = E.EmployeeID;

-- 11. Employees on Probation and Their Status  / omar
SELECT 
    E.Name AS EmployeeName, 
    P.StartDate, 
    P.EndDate, 
    P.Status AS ProbationStatus
FROM 
    Employee E
JOIN 
    ProbationStatus P ON E.EmployeeID = P.EmployeeID;

-- 12. Pending Job Offers for Candidates  / wafik
SELECT 
    C.Name AS CandidateName, 
    J.Position, 
    J.Salary, 
    J.Terms
FROM 
    JobOffer J
JOIN 
    Candidate C ON J.CandidateID = C.CandidateID
WHERE 
    C.ApplicationStatus = 'Pending';


