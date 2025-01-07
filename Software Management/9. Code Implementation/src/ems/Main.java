package src.ems;

import java.util.Date;

public class Main {
    public static void main(String[] args) {
        // Testing the Investigation class
        Investigation investigation = new Investigation();
        investigation.conductTardinessInvestigation();
        investigation.takeActions();
        investigation.selectEmployee();

        // Testing the Counseling class
        Counseling counseling = new Counseling();
        counseling.conductCounseling();

        // Testing the ProbationStatus class
        ProbationStatus probationStatus = new ProbationStatus();
        probationStatus.conductInvestigation();
        probationStatus.updateProbationStatus();
        System.out.println("Probation Details: " + probationStatus.viewProbationDetails());

        // Testing the LeaveRequest class
        LeaveRequest leaveRequest = new LeaveRequest();
        leaveRequest.submitRequest();

        // Testing the User class
        User user = new User();
        user.login();
        System.out.println("Request Status: " + user.checkRequestStatus());
        user.logout();

        // Testing the Supervisor class
        Supervisor supervisor = new Supervisor();
        supervisor.reviewEmployeePerformance();
        supervisor.recommendCounseling();

        // Testing the Admin class
        Admin admin = new Admin();
        admin.manageEmployee();
        admin.resignEmployee();
        admin.addHoliday();
        System.out.println("Admin Permissions: " + admin.viewPermissions());

        // Testing the Employee class
        Employee employee = new Employee();
        employee.requestLeave();

        // Testing the Attendance class
        Attendance attendance = new Attendance();
        attendance.markAttendance();
        System.out.println("Tardiness Count: " + attendance.calculateTardiness());
        System.out.println("Attendance Details: " + attendance.viewAttendanceDetails());

        // Testing the Department class
        Department department = new Department();
        department.assignSupervisor();
        System.out.println("Employees in Department: " + department.viewEmployees());
        department.updateStatus();
        System.out.println("Payroll Details: " + department.viewPayroll());
        System.out.println("Employee Data: " + department.queryEmployeeData());
        System.out.println("Attendance Data: " + department.queryAttendanceData());
        department.retrieveEmployee();

        // Testing the Payroll class
        Payroll payroll = new Payroll();
        System.out.println("Net Pay: " + payroll.calculateNetPay());
        System.out.println("Generated Payroll: " + payroll.generatePayroll());

        // Testing the PerformanceReview class
        PerformanceReview performanceReview = new PerformanceReview();
        System.out.println("Process Payroll Request: " + performanceReview.requestProcessPayroll());
        System.out.println("Employees List: " + performanceReview.openEmployeesList());
        performanceReview.searchEmployeeID();
        performanceReview.terminateEmployee();

        // Testing the JobAdvertisement class
        JobAdvertisement jobAdvertisement = new JobAdvertisement();
        jobAdvertisement.createJobAd();

        // Testing the Recruiter class
        Recruiter recruiter = new Recruiter();
        recruiter.scheduleInterview();
        recruiter.postJobAdvertisement();

        // Testing the Holiday class
        Holiday holiday = new Holiday();
        holiday.assignToEmployee();

        // Testing the Onboarding class
        Onboarding onboarding = new Onboarding();
        onboarding.selectNewHires();
        onboarding.addTask();
        System.out.println("Calculated Salary: " + onboarding.calculateSalary());
        

        // Testing the Candidate class
        Candidate candidate = new Candidate();
        candidate.applyForJob();
        candidate.attendInterview();

        // Testing the Interview class
        Interview interview = new Interview();
        interview.openInterview();
        interview.provideFeedback();
        interview.selectCandidate();

        // Testing the Offer class
        Offer offer = new Offer();
        offer.provideJobOffer();
        offer.selectAcceptedCandidate();
        offer.selectCandidate();
        System.out.println("Job Details: " + offer.viewJobDetails());

        System.out.println("All tests completed successfully!");
    }
}