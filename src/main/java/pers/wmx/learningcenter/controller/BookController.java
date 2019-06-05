package pers.wmx.learningcenter.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import pers.wmx.learningcenter.domain.Book;
import pers.wmx.learningcenter.domain.BorrowBook;
import pers.wmx.learningcenter.domain.Result;
import pers.wmx.learningcenter.domain.User;
import pers.wmx.learningcenter.service.BookService;
import pers.wmx.learningcenter.service.UserService;
import pers.wmx.learningcenter.utils.TimeUtil;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.List;

/**
 * @author: wang ming xin
 * @create: 2019-04-10 12:10
 */

@Controller
public class BookController {

    @Autowired
    BookService bookService;

    @Autowired
    UserService userService;

    @Value("${severfile.url}")
    String fileUrl;

    @RequestMapping("/borrowBook")
    public String borrowBook(){
        return "borrowBook";
    }

    @RequestMapping("/toBorrowBook")
    public String toBorrowBook(Book book, HttpServletRequest request, Model model){
        User nowuser = (User) request.getSession().getAttribute("nowuser");
        Integer userId = nowuser.getId();

        book.setUserId(userId);
        book.setCreateTime(new Date());
        book.setStatus(0);

        int ret = bookService.add(book);

        if(ret>0){
            book.setNickname(nowuser.getNickname());
            model.addAttribute("book",book);
            model.addAttribute("fileurl",fileUrl);
            return "bookInfo";
        }

        model.addAttribute("msg","借出书籍失败，请稍后重试！");

        return "borrowBook";
    }


    @RequestMapping("/deleteBookById")
    @ResponseBody
    public Result deleteBookById(Integer id){
        if(StringUtils.isEmpty(id)){
            return new Result(true,802,"删除失败!");
        }

        int ret = bookService.deleteById(id);

        if(ret>0){
            return new Result(true,801,"删除成功!");
        }
        return new Result(true,802,"删除失败!");
    }

    //书籍详情 个人视角
    @RequestMapping("/bookInfo")
    public String bookInfo(Integer id,Model model){
        Book book = bookService.findBookById(id);

        Integer userId = book.getUserId();
        String nickname = userService.findNicknameById(userId);
        book.setNickname(nickname);

        //借书列表
        List<BorrowBook> borrowBooks = bookService.takeBookList(id);

        borrowBooks.forEach(e->{
            Integer userId1 = e.getUserId();
            String nickname1 = userService.findNicknameById(userId1);
            String phoneNumber = userService.findPhoneNumberById(userId1);
            e.setNickname(nickname1);
            e.setPhoneNumber(phoneNumber);
        });

        model.addAttribute("book",book);
        model.addAttribute("borrowBooks",borrowBooks);
        model.addAttribute("fileurl",fileUrl);

        return "bookInfo";
    }

    //书籍详情 他人视角
    @RequestMapping("/bookDetail")
    public String bookDetail(Integer id,Model model){
        Book book = bookService.findBookById(id);

        Integer userId = book.getUserId();
        String nickname = userService.findNicknameById(userId);
        String phoneNumber =  userService.findPhoneNumberById(userId);
        book.setNickname(nickname);
        book.setPhoneNumber(phoneNumber);

        //借书列表
        List<BorrowBook> borrowBooks = bookService.takeBookList(id);

       borrowBooks.forEach(e->{
           Integer userId1 = e.getUserId();
           String nickname1 = userService.findNicknameById(userId1);
           e.setNickname(nickname1);
       });

        model.addAttribute("book",book);
        model.addAttribute("borrowBooks",borrowBooks);
        model.addAttribute("fileurl",fileUrl);

        return "bookDetails";
    }

    @RequestMapping("/editBook")
    public String editBook(Integer id,Model model){

        Book book = bookService.findBookById(id);
        model.addAttribute("book",book);
        model.addAttribute("fileurl",fileUrl);

        return "editBook";
    }

    @RequestMapping("/toEditBook")
    public String toEditBook(Book book,Model model,HttpServletRequest request){

        User nowuser = (User) request.getSession().getAttribute("nowuser");

        int ret = bookService.updateBook(book);

        if(ret>0){
            Book bookRet = bookService.findBookById(book.getId());
            bookRet.setNickname(nowuser.getNickname());
            model.addAttribute("book",bookRet);
            model.addAttribute("fileurl",fileUrl);
            return "bookInfo";
        }

        return "homepage";
    }

    //图书馆主页
    @RequestMapping("/bookView")
    public String bookView(Model model){

        List<Book> books = bookService.findBooks(null);
        model.addAttribute("books",books);
        model.addAttribute("fileurl",fileUrl);

        return "bookView";
    }

    //用户借书
    @RequestMapping("/takeBook")
    public String takeBook(Integer id, Integer keepTime, HttpServletRequest request, RedirectAttributes attr, Model model){

        User nowuser = (User) request.getSession().getAttribute("nowuser");
        Integer nowuserId = nowuser.getId();

        BorrowBook borrowBook = new BorrowBook();
        borrowBook.setBookId(id);
        borrowBook.setUserId(nowuserId);
        borrowBook.setKeepTime(keepTime);

        //从现在开始借书
        Date startTime = new Date();
        Date endTime = TimeUtil.nDays(startTime,keepTime);

        borrowBook.setBorrowTime(startTime);
        borrowBook.setWillreturnTime(endTime);

        try {
            int ret = bookService.takeBook(borrowBook);
        }catch (Exception e){
            attr.addAttribute("msg","请勿重复借书！");
        }

        int ret = bookService.updateStatus(id);

        attr.addAttribute("id",id);

        return "redirect:/bookDetail";
    }

    //确认还书
    @RequestMapping("/returnBook")
    public String returnBook(Integer id,Model model,RedirectAttributes attr){

        //Book book = bookService.findBookById(id);
        int ret = bookService.resetStatus(id);

        List<BorrowBook> borrowBooks = bookService.findBorrowBookById(id);
        BorrowBook borrowBook = borrowBooks.get(0);
        Date realreturnTime = new Date();
        borrowBook.setRealreturnTime(realreturnTime);
        int ret1 = bookService.updateBorrowBook(borrowBook);

        attr.addAttribute("id",id);

        return "redirect:/bookInfo";
    }

    @RequestMapping("/searchBook")
    public String searchBook(Book book,Model model){

        if(StringUtils.isEmpty(book.getName())){
            book.setName(null);
        }
        if(StringUtils.isEmpty(book.getType())){
            book.setType(null);
        }
        if(StringUtils.isEmpty(book.getDescription())){
            book.setDescription(null);
        }

        List<Book> books = bookService.findBooksByCondition(book);

        model.addAttribute("books",books);
        model.addAttribute("fileurl",fileUrl);

        return "bookView";
    }

}
