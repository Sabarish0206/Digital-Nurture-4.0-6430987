package search;

import java.util.Arrays;
import java.util.Comparator;

class Product {
    int id;
    String name;
    String category;

    Product(int id, String name, String category) {
        this.id = id;
        this.name = name;
        this.category = category;
    }
}

public class ProductSearch {

    public static Product linearSearch(Product[] products, String name) {
        for (Product p : products) {
            if (p.name.equalsIgnoreCase(name)) {
                return p;
            }
        }
        return null;
    }

    public static Product binarySearch(Product[] products, String name) {
        Arrays.sort(products, Comparator.comparing(p -> p.name.toLowerCase()));

        int low = 0, high = products.length - 1;
        while (low <= high) {
            int mid = (low + high) / 2;
            int cmp = products[mid].name.compareToIgnoreCase(name);
            if (cmp == 0) return products[mid];
            else if (cmp < 0) low = mid + 1;
            else high = mid - 1;
        }
        return null;
    }

    public static void main(String[] args) {
        Product[] products = {
            new Product(1, "Phone", "Electronics"),
            new Product(2, "Mouse", "Accessories"),
            new Product(3, "Tablet", "Electronics")
        };

        Product found1 = linearSearch(products, "Mouse");
        Product found2 = binarySearch(products, "Tablet");

        System.out.println(found1 != null ? "Found by Linear: " + found1.name : "Not Found");
        System.out.println(found2 != null ? "Found by Binary: " + found2.name : "Not Found");
    }
}
