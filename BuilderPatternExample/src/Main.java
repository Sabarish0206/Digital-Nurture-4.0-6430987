
public class Main {
    public static void main(String[] args) {
        Computer pc = new Computer.Builder()
                .setCPU("i5")
                .setRAM("16GB")
                .setStorage("512GB SSD")
                .build();
        pc.displaySpecs();
    }
}

