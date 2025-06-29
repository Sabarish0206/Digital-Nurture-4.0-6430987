package observer;

public class Main {
    public static void main(String[] args) {
        StockMarket market = new StockMarket();
        Observer user1 = new MobileApp("Sabarish");
        Observer user2 = new MobileApp("Ravi");

        market.register(user1);
        market.register(user2);

        market.setStock("HDFC", 3450.75);
        market.setStock("INFY", 1520.40);
    }
}
