package inventory;

import java.util.HashMap;
import java.util.Map;

class Product {
    int productId;
    String productName;
    int quantity;
    double price;

    Product(int productId, String productName, int quantity, double price) {
        this.productId = productId;
        this.productName = productName;
        this.quantity = quantity;
        this.price = price;
    }
}

public class InventorySystem {
    private final Map<Integer, Product> inventory = new HashMap<>();

    public void addProduct(Product product) {
        inventory.put(product.productId, product);
    }

    public void updateProduct(int productId, int quantity) {
        if (inventory.containsKey(productId)) {
            inventory.get(productId).quantity = quantity;
        }
    }

    public void deleteProduct(int productId) {
        inventory.remove(productId);
    }

    public void printInventory() {
        for (Product p : inventory.values()) {
            System.out.println(p.productId + " | " + p.productName + " | Qty: " + p.quantity + " | ₹" + p.price);
        }
    }

    public static void main(String[] args) {
        InventorySystem inv = new InventorySystem();
        inv.addProduct(new Product(1, "Monitor", 10, 8999.0));
        inv.addProduct(new Product(2, "Keyboard", 25, 499.0));
        inv.updateProduct(1, 12);
        inv.deleteProduct(2);
        inv.printInventory();
    }
}
