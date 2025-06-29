package linkedlist;

class Task {
    int taskId;
    String taskName;
    String status;
    Task next;

    Task(int id, String name, String status) {
        this.taskId = id;
        this.taskName = name;
        this.status = status;
        this.next = null;
    }
}

public class TaskManager {
    Task head = null;

    public void addTask(Task task) {
        if (head == null) {
            head = task;
        } else {
            Task temp = head;
            while (temp.next != null)
                temp = temp.next;
            temp.next = task;
        }
    }

    public void traverseTasks() {
        Task temp = head;
        while (temp != null) {
            System.out.println(temp.taskId + ": " + temp.taskName + " - " + temp.status);
            temp = temp.next;
        }
    }

    public void deleteTask(int id) {
        if (head == null) return;

        if (head.taskId == id) {
            head = head.next;
            return;
        }

        Task prev = head, curr = head.next;
        while (curr != null) {
            if (curr.taskId == id) {
                prev.next = curr.next;
                return;
            }
            prev = curr;
            curr = curr.next;
        }
    }

    public static void main(String[] args) {
        TaskManager tm = new TaskManager();
        tm.addTask(new Task(1, "Login Module", "Pending"));
        tm.addTask(new Task(2, "Payment Gateway", "In Progress"));
        tm.traverseTasks();
        tm.deleteTask(1);
        tm.traverseTasks();
    }
}
