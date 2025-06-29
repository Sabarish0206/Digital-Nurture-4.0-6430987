package strategy;

public class StrategyMain {
    public static void main(String[] args) {
        PaymentContext context = new PaymentContext();

        context.setStrategy(new UpiPayment());
        context.executePayment(1999);

        context.setStrategy(new NetBankingPayment());
        context.executePayment(4500);
    }
}
