package pers.wmx.learningcenter.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pers.wmx.learningcenter.dao.BookDao;
import pers.wmx.learningcenter.domain.Book;
import pers.wmx.learningcenter.domain.BorrowBook;
import pers.wmx.learningcenter.service.BookService;

import java.util.Date;
import java.util.List;

/**
 * @author: wang ming xin
 * @create: 2019-04-14 15:51
 */

@Service
public class BookServiceImpl implements BookService {
    @Autowired
    BookDao bookDao;

    @Override
    public int takeBook(BorrowBook borrowBook) {
        return bookDao.takeBook(borrowBook);
    }

    @Override
    public int add(Book book) {
        return bookDao.add(book);
    }

    @Override
    public List<Book> findBooks(Integer userId) {
        return bookDao.findBooks(userId);
    }

    @Override
    public int deleteById(Integer id) {
        return bookDao.deleteById(id);
    }

    @Override
    public Book findBookById(Integer id) {
        return bookDao.findBookById(id);
    }

    @Override
    public int updateBook(Book book) {
        return bookDao.updateBook(book);
    }

    @Override
    public List<BorrowBook> takeBookList(Integer id) {
        return bookDao.takeBookList(id);
    }

    @Override
    public int updateStatus(Integer id) {
        return bookDao.updateStatus(id);
    }

    @Override
    public int resetStatus(Integer id) {
        return bookDao.resetStatus(id);
    }

    @Override
    public List<BorrowBook> findBorrowBookById(Integer id) {
        return bookDao.findBorrowBookById(id);
    }

    @Override
    public int updateBorrowBook(BorrowBook borrowBook) {
        return bookDao.updateBorrowBook(borrowBook);
    }

    @Override
    public List<Book> findBooksByCondition(Book book) {
        return bookDao.findBooksByCondition(book);
    }

}
