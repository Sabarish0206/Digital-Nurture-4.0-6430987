package mvc;

public class StudentController {
    private Student model;
    private StudentView view;

    public StudentController(Student model, StudentView view) {
        this.model = model;
        this.view = view;
    }

    public void updateView() {
        view.printStudentDetails(model.getName(), model.getRollNumber());
    }

    public void setStudentName(String name) {
        model.setName(name);
    }

    public void setRollNumber(int rollNumber) {
        model.setRollNumber(rollNumber);
    }
}
