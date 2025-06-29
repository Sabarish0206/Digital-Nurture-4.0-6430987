package proxy;

public class Main {
    public static void main(String[] args) {
        Image img1 = new ProxyImage("vacation.jpg");
        
        // Only loaded when first called
        img1.display(); 
        img1.display(); // Uses cached image
    }
}
