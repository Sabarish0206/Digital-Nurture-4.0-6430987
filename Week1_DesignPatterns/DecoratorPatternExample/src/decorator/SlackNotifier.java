package decorator;

public class SlackNotifier extends NotifierDecorator {
    public SlackNotifier(Notifier notifier) {
        super(notifier);
    }

    @Override
    public void send(String message) {
        super.send(message);
        System.out.println("Sending SLACK Message: " + message);
    }
}
