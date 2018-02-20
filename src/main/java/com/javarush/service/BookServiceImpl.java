package com.javarush.service;

import com.javarush.dao.BookDao;
import com.javarush.model.Book;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import java.util.List;

@Service
public class BookServiceImpl implements BookService {

    @Autowired
    private BookDao bookDao;

    @Transactional
    public void addBook(Book book) {
        this.bookDao.addBook(book);
    }

    @Transactional
    public void updateBook(Book book) {
        this.bookDao.updateBook(book);
    }

    @Transactional
    public void deleteBook(int id) {
        this.bookDao.deleteBook(id);
    }

    @Transactional
    public Book getBookById(int id) {

        return this.bookDao.getBookById(id);
    }

    @Transactional
    public List<Book> listBooks(int rowsPerPage, int page, String criterion) {
        return this.bookDao.listBooks(rowsPerPage, page, criterion);
    }

    @Transactional
    public long getBooksCount() {
        return this.bookDao.getBooksCount();
    }
}
