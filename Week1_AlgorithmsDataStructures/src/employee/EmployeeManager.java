package employee;

class Employee {
    int employeeId;
    String name;
    String position;
    double salary;

    Employee(int employeeId, String name, String position, double salary) {
        this.employeeId = employeeId;
        this.name = name;
        this.position = position;
        this.salary = salary;
    }
}

public class EmployeeManager {
    private final Employee[] employees = new Employee[100];
    private int count = 0;

    public void add(Employee e) {
        if (count < employees.length) {
            employees[count++] = e;
        }
    }

    public void search(int id) {
        for (int i = 0; i < count; i++) {
            if (employees[i].employeeId == id) {
                System.out.println("Found: " + employees[i].name + ", ₹" + employees[i].salary);
                return;
            }
        }
        System.out.println("Employee not found.");
    }

    public void delete(int id) {
        for (int i = 0; i < count; i++) {
            if (employees[i].employeeId == id) {
                for (int j = i; j < count - 1; j++) {
                    employees[j] = employees[j + 1];
                }
                employees[--count] = null;
                System.out.println("Deleted employee with ID: " + id);
                return;
            }
        }
        System.out.println("Employee not found.");
    }

    public void listAll() {
        for (int i = 0; i < count; i++) {
            System.out.println(employees[i].employeeId + " - " + employees[i].name);
        }
    }

    public static void main(String[] args) {
        EmployeeManager em = new EmployeeManager();
        em.add(new Employee(1, "Kiran", "Dev", 50000));
        em.add(new Employee(2, "Riya", "Tester", 45000));

        em.listAll();
        em.search(2);
        em.delete(1);
        em.listAll();
    }
}
