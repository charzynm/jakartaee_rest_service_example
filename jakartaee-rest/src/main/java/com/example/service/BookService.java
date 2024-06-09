package com.example.service;

import com.example.model.Book;
import com.example.repository.BookRepository;

import jakarta.ejb.Stateless;
import jakarta.inject.Inject;
import java.util.List;

@Stateless
public class BookService {

    @Inject
    private BookRepository repository;

    public void createBook(Book book) {
        repository.create(book);
    }

    public Book findBook(Long id) {
        return repository.find(id);
    }

    public List<Book> findAllBooks() {
        return repository.findAll();
    }

    public Book updateBook(Book book) {
        return repository.update(book);
    }

    public void deleteBook(Long id) {
        repository.delete(id);
    }
}
