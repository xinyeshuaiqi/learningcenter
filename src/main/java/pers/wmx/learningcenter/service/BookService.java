package pers.wmx.learningcenter.service;

import pers.wmx.learningcenter.domain.Book;
import pers.wmx.learningcenter.domain.BorrowBook;

import java.util.Date;
import java.util.List;

/**
 * @author: wang ming xin
 * @create: 2019-04-14 15:50
 */
public interface BookService {

    int takeBook(BorrowBook borrowBook);

    int add(Book book);

    List<Book> findBooks(Integer userId);

    int deleteById(Integer id);

    Book findBookById(Integer id);

    int updateBook(Book book);

    List<BorrowBook> takeBookList(Integer id);

    int updateStatus(Integer id);

    int resetStatus(Integer id);

    List<BorrowBook> findBorrowBookById(Integer id);

    int updateBorrowBook(BorrowBook borrowBook);

    List<Book> findBooksByCondition(Book book);
}
