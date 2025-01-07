package src.ems;

public class Supervisor extends User {
    private int supervisorID;
    private String permission;
    private String department;

    public PerformanceReview reviewEmployeePerformance() {
        // Implementation here
        return new PerformanceReview();
    }

    public void recommendCounseling() {
        // Implementation here
    }
}