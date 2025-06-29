package strategy;

public class NetBankingPayment implements PaymentStrategy {
    public void pay(double amount) {
        System.out.println("Paid ₹" + amount + " using NetBanking.");
    }
}