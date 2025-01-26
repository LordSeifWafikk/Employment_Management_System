Create database EMS 
use EMS
-- Table: Employee
CREATE TABLE Employee (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    DepartmentID INT,
    SupervisorID INT,
    Position VARCHAR(50),
    Status CHAR(20),
    FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID),
    FOREIGN KEY (SupervisorID) REFERENCES Supervisor(SupervisorID)
);

-- Table: Department
CREATE TABLE Department (
    DepartmentID INT PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    
);

-- Table: Admin
CREATE TABLE Admin (
    AdminID INT PRIMARY KEY,
    Role CHAR(20),
    Permissions VARCHAR(255)
);
-- Table: Supervisor
CREATE TABLE Supervisor (
    SupervisorID INT PRIMARY KEY,
    DepartmentID INT,
    Permissions VARCHAR(100),
    FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID)
);

-- Table: Counseling
CREATE TABLE Counseling (
    CounselingID INT PRIMARY KEY,
    EmployeeID INT,
    SupervisorID INT,
    Type CHAR(20),
    Recommendation VARCHAR(100),
    Outcome VARCHAR(100),
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID),
    FOREIGN KEY (SupervisorID) REFERENCES Supervisor(SupervisorID)
);

-- Table: Payroll
CREATE TABLE Payroll (
    PayrollID INT PRIMARY KEY,
    EmployeeID INT,
    Salary DECIMAL,
    Deductions DECIMAL,
    NetPay DECIMAL,
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID)
);

-- Table: LeaveRequest
CREATE TABLE LeaveRequest (
    LeaveID INT PRIMARY KEY,
    EmployeeID INT,
    Type CHAR(20),
    Status CHAR(20),
    Duration INT,
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID)
);

-- Table: PerformanceReview
CREATE TABLE PerformanceReview (
    ReviewID INT PRIMARY KEY,
    EmployeeID INT,
    Date DATE,
    Score INT,
    Comments VARCHAR(255),
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID)
);

-- Table: Attendance
CREATE TABLE Attendance (
    AttendanceID INT PRIMARY KEY,
    EmployeeID INT,
    TardinessCount INT,
    AbsenceRecord VARCHAR(255),
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID)
);

-- Table: Onboarding
CREATE TABLE Onboarding (
    OnboardingID INT PRIMARY KEY,
    EmployeeID INT,
    Task VARCHAR(255),
    Status CHAR(20),
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID)
);

-- Table: TardinessInvestigation
CREATE TABLE TardinessInvestigation (
    InvestigationID INT PRIMARY KEY,
    EmployeeID INT,
    Findings VARCHAR(255),
    ActionsTaken VARCHAR(255),
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID)
);

-- Table: Recruiter
CREATE TABLE Recruiter (
    RecruiterID INT PRIMARY KEY,
    ManagedPositions VARCHAR(255)
);

-- Table: JobAdvertisement
CREATE TABLE JobAdvertisement (
    JobID INT PRIMARY KEY,
    Position VARCHAR(50),
    Requirements VARCHAR(255),
    DatePosted DATE,
    RecruiterID INT,  
    CandidateID INT,  
    FOREIGN KEY (RecruiterID) REFERENCES Recruiter(RecruiterID), 
    FOREIGN KEY (CandidateID) REFERENCES Candidate(CandidateID)  
);

CREATE TABLE JobOffer (
    OfferID INT PRIMARY KEY,
    Position VARCHAR(50),
    CandidateID INT,
    RecruiterID INT,  
    Salary DECIMAL(10, 2),
    Terms VARCHAR(255),
    FOREIGN KEY (CandidateID) REFERENCES Candidate(CandidateID),
    FOREIGN KEY (RecruiterID) REFERENCES Recruiter(RecruiterID)  
);

-- Table: Candidate
CREATE TABLE Candidate (
    CandidateID INT PRIMARY KEY,
    Name VARCHAR(50),
    ApplicationStatus CHAR(20),
    Position VARCHAR(50)
);

-- Create the Interview table with RecruiterID
CREATE TABLE Interview (
    InterviewID INT PRIMARY KEY,
    CandidateID INT,
    RecruiterID INT,  
    Date DATE,
    Feedback VARCHAR(255),
    Status CHAR(20),
    FOREIGN KEY (CandidateID) REFERENCES Candidate(CandidateID),
    FOREIGN KEY (RecruiterID) REFERENCES Recruiter(RecruiterID)  -- Foreign Key to Recruiter table
);

-- Table: Holiday
CREATE TABLE Holiday (
    HolidayID INT PRIMARY KEY,
    Date DATE,
    Description VARCHAR(255)
);



--Table: ProbationStatus
CREATE TABLE ProbationStatus (
    ProbationID INT PRIMARY KEY,
    EmployeeID INT NOT NULL,
    SupervisorID INT NOT NULL,
    StartDate DATE NOT NULL,
    EndDate DATE NOT NULL,
    Status VARCHAR(50) , 
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID),
    FOREIGN KEY (SupervisorID) REFERENCES Supervisor(SupervisorID)
);



-- Add ManagedByAdminID column to Employee table
ALTER TABLE Employee
ADD ManagedByAdminID INT;

-- Add ManagedByEmployeeID column to Department table
ALTER TABLE Department
ADD ManagedByEmployeeID INT;

-- Add foreign key to link Employee to Admin (Employee is managed by Admin)
ALTER TABLE Employee
ADD CONSTRAINT FK_Employee_Admin
FOREIGN KEY (ManagedByAdminID) REFERENCES Admin(AdminID);

-- Add foreign key to link Department to Employee (Department is managed by Employee)
ALTER TABLE Department
ADD CONSTRAINT FK_Department_Employee
FOREIGN KEY (ManagedByEmployeeID) REFERENCES Employee(EmployeeID);

-- Add AdminID to Candidate (Admin hires Candidate)
ALTER TABLE Candidate
ADD HiredByAdminID INT;

-- Add foreign key to link Admin to Candidate (Admin hires Candidate)
ALTER TABLE Candidate
ADD CONSTRAINT FK_Candidate_Admin
FOREIGN KEY (HiredByAdminID) REFERENCES Admin(AdminID);

-- Add RecruiterID to JobAdvertisement (Recruiter conducts Job Advertisement)
ALTER TABLE JobAdvertisement
ADD ConductedByRecruiterID INT;

-- Add foreign key to link Recruiter to JobAdvertisement (Recruiter conducts Job Advertisement)
ALTER TABLE JobAdvertisement
ADD CONSTRAINT FK_JobAdvertisement_Recruiter
FOREIGN KEY (ConductedByRecruiterID) REFERENCES Recruiter(RecruiterID);

-- Add RecruiterID to JobOffer (Recruiter sends Job Offer)
ALTER TABLE JobOffer
ADD SentByRecruiterID INT;

-- Add foreign key to link Recruiter to JobOffer (Recruiter sends Job Offer)
ALTER TABLE JobOffer
ADD CONSTRAINT FK_JobOffer_Recruiter
FOREIGN KEY (SentByRecruiterID) REFERENCES Recruiter(RecruiterID);

-- Add AdminID to Holiday (Admin assigns holidays to Employee)
ALTER TABLE Holiday
ADD AssignedByAdminID INT;

-- Add foreign key to link Admin to Holiday (Admin assigns holidays to Employee)
ALTER TABLE Holiday
ADD CONSTRAINT FK_Holiday_Admin
FOREIGN KEY (AssignedByAdminID) REFERENCES Admin(AdminID);

-- Add EmployeeID to Holiday (Employee receives holiday assignments)
ALTER TABLE Holiday
ADD AssignedToEmployeeID INT;

-- Add foreign key to link Employee to Holiday (Employee receives holiday assignments)
ALTER TABLE Holiday
ADD CONSTRAINT FK_Holiday_Employee
FOREIGN KEY (AssignedToEmployeeID) REFERENCES Employee(EmployeeID);

