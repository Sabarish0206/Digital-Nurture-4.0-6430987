package decorator;

public class Main {
    public static void main(String[] args) {
        Notifier baseNotifier = new EmailNotifier();
        Notifier multiChannel = new SlackNotifier(new SMSNotifier(baseNotifier));
        
        multiChannel.send("System will undergo maintenance tonight.");
    }
}
