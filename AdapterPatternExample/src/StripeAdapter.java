
public class StripeAdapter implements PaymentProcessor {
    private StripeGateway gateway = new StripeGateway();

    public void processPayment(double amount) {
        gateway.payNow(amount);
    }
}

