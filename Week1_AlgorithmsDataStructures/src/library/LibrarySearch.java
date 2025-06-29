package library;

import java.util.Arrays;
import java.util.Comparator;

class Book {
    int bookId;
    String title;
    String author;

    Book(int bookId, String title, String author) {
        this.bookId = bookId;
        this.title = title;
        this.author = author;
    }
}

public class LibrarySearch {

    // Linear Search
    public static Book linearSearch(Book[] books, String title) {
        for (Book b : books) {
            if (b.title.equalsIgnoreCase(title)) {
                return b;
            }
        }
        return null;
    }

    // Binary Search (Assumes array is sorted)
    public static Book binarySearch(Book[] books, String title) {
        Arrays.sort(books, Comparator.comparing(b -> b.title.toLowerCase()));
        int low = 0, high = books.length - 1;

        while (low <= high) {
            int mid = (low + high) / 2;
            int cmp = books[mid].title.compareToIgnoreCase(title);
            if (cmp == 0) return books[mid];
            else if (cmp < 0) low = mid + 1;
            else high = mid - 1;
        }

        return null;
    }

    public static void main(String[] args) {
        Book[] books = {
            new Book(1, "Data Structures", "Narasimha Karumanchi"),
            new Book(2, "Java Basics", "Herbert Schildt"),
            new Book(3, "Clean Code", "Robert C. Martin")
        };

        Book result1 = linearSearch(books, "Java Basics");
        Book result2 = binarySearch(books, "Clean Code");

        System.out.println(result1 != null ? "Linear Found: " + result1.title : "Not Found");
        System.out.println(result2 != null ? "Binary Found: " + result2.title : "Not Found");
    }
}
