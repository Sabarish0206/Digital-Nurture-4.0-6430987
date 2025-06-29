package observer;

public class MobileApp implements Observer {
    private String user;

    public MobileApp(String user) {
        this.user = user;
    }

    @Override
    public void update(String stock, double price) {
        System.out.println("[" + user + "] Stock update → " + stock + ": ₹" + price);
    }
}
