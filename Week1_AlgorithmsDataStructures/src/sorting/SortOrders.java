package sorting;

class Order {
    int orderId;
    String customerName;
    double totalPrice;

    Order(int orderId, String customerName, double totalPrice) {
        this.orderId = orderId;
        this.customerName = customerName;
        this.totalPrice = totalPrice;
    }
}

public class SortOrders {

    // Bubble Sort by totalPrice
    public static void bubbleSort(Order[] orders) {
        int n = orders.length;
        for (int i = 0; i < n - 1; i++) {
            for (int j = 0; j < n - i - 1; j++) {
                if (orders[j].totalPrice > orders[j + 1].totalPrice) {
                    Order temp = orders[j];
                    orders[j] = orders[j + 1];
                    orders[j + 1] = temp;
                }
            }
        }
    }

    // Quick Sort by totalPrice
    public static void quickSort(Order[] orders, int low, int high) {
        if (low < high) {
            int pi = partition(orders, low, high);
            quickSort(orders, low, pi - 1);
            quickSort(orders, pi + 1, high);
        }
    }

    private static int partition(Order[] orders, int low, int high) {
        double pivot = orders[high].totalPrice;
        int i = low - 1;
        for (int j = low; j < high; j++) {
            if (orders[j].totalPrice <= pivot) {
                i++;
                Order temp = orders[i];
                orders[i] = orders[j];
                orders[j] = temp;
            }
        }
        Order temp = orders[i + 1];
        orders[i + 1] = orders[high];
        orders[high] = temp;
        return i + 1;
    }

    public static void display(Order[] orders) {
        for (Order o : orders) {
            System.out.println(o.orderId + " | " + o.customerName + " | ₹" + o.totalPrice);
        }
    }

    public static void main(String[] args) {
        Order[] orders = {
            new Order(101, "Ravi", 2599),
            new Order(102, "Anu", 999),
            new Order(103, "Meena", 1899)
        };

        System.out.println("Original:");
        display(orders);

        System.out.println("\nAfter Bubble Sort:");
        bubbleSort(orders);
        display(orders);

        // Reset array for quick sort
        orders = new Order[]{
            new Order(101, "Ravi", 2599),
            new Order(102, "Anu", 999),
            new Order(103, "Meena", 1899)
        };

        System.out.println("\nAfter Quick Sort:");
        quickSort(orders, 0, orders.length - 1);
        display(orders);
    }
}
