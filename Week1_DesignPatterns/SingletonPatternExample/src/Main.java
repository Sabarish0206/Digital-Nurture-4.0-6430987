
public class Main {
    public static void main(String[] args) {
        Logger logger1 = Logger.getInstance();
        Logger logger2 = Logger.getInstance();

        logger1.log("1st message");
        logger2.log("2nd message");

        System.out.println(logger1 == logger2);
    }
}

