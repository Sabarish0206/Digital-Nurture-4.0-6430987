package com.example.librarymanagement.service;

import com.example.librarymanagement.repository.BookRepository;

public class BookService {
    private BookRepository bookRepository;

    public void setBookRepository(BookRepository bookRepository) {
        this.bookRepository = bookRepository;
    }

    public void issueBook(String bookTitle) {
        System.out.println("BookService: Issuing book...");
        bookRepository.saveBook(bookTitle);
    }
}
