
public class Main {
    public static void main(String[] args) {
        DocumentFactory factory;

        factory = new PdfFactory();
        Document doc1 = factory.createDocument();
        doc1.open();

        factory = new WordFactory();
        Document doc2 = factory.createDocument();
        doc2.open();
    }
}

