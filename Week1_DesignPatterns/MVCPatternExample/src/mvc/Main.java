package mvc;

public class Main {
    public static void main(String[] args) {
        Student student = new Student("Sabarish", 101);
        StudentView view = new StudentView();
        StudentController controller = new StudentController(student, view);

        controller.updateView();

        controller.setStudentName("Karthik");
        controller.updateView();
    }
}
