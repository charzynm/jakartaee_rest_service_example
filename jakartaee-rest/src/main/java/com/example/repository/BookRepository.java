package com.example.repository;

import com.example.model.Book;

import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.transaction.Transactional;
import java.util.List;

@Transactional
public class BookRepository {

    @PersistenceContext
    private EntityManager em;

    public void create(Book book) {
        em.persist(book);
    }

    public Book find(Long id) {
        return em.find(Book.class, id);
    }

    public List<Book> findAll() {
        return em.createQuery("SELECT b FROM Book b", Book.class).getResultList();
    }

    public Book update(Book book) {
        return em.merge(book);
    }

    public void delete(Long id) {
        Book book = em.find(Book.class, id);
        if (book != null) {
            em.remove(book);
        }
    }
}
