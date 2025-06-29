package command;

public class Main {
    public static void main(String[] args) {
        Fan fan = new Fan();
        CommandInvoker remote = new CommandInvoker();

        remote.setCommand(new FanOnCommand(fan));
        remote.pressButton();

        remote.setCommand(new FanOffCommand(fan));
        remote.pressButton();
    }
}