package pers.wmx.learningcenter.dao;

import org.apache.ibatis.annotations.*;
import pers.wmx.learningcenter.domain.Book;
import pers.wmx.learningcenter.domain.BorrowBook;

import java.util.Date;
import java.util.List;

@Mapper
public interface BookDao {

    @Insert("insert into book(user_id,NAME,TYPE,description,create_time,cover_path) " +
            "values(#{userId},#{name},#{type},#{description},#{createTime},#{coverPath})")
    @Options(useGeneratedKeys=true, keyProperty="id", keyColumn="id")   //插入成功后返回id
    int add(Book book);

    @Select({"<script>",
            "SELECT * FROM book",
            "WHERE 1=1",
            "<when test='userId!=null'>",
            "AND user_id = #{userId}",
            "</when>",
            "ORDER BY create_time desc",
            "</script>"})
    List<Book> findBooks(@Param(value = "userId")Integer userId);

    @Delete("delete from book where id = #{id}")
    int deleteById(@Param(value = "id")Integer id);

    @Select("select * from  book where id = #{id}")
    Book findBookById(@Param(value = "id")Integer id);

    @Update("update book set NAME=#{name},description=#{description},type=#{type}," +
            "cover_path=#{coverPath} " +
            "where id=#{id}")
    int updateBook(Book book);

    @Insert("insert into borrowbook(user_id,book_id,borrow_time,keep_time,willreturn_time) " +
            "values(#{userId},#{bookId},#{borrowTime},#{keepTime},#{willreturnTime})")
    int takeBook(BorrowBook borrowBook);

    @Select("select * from  borrowbook  where book_id = #{id} ORDER BY borrow_time desc")
    List<BorrowBook> takeBookList(@Param(value = "id")Integer id);

    @Update("update book set STATUS=1 where id=#{id}")
    int updateStatus(@Param(value = "id")Integer id);

    @Update("update book set STATUS=0 where id=#{id}")
    int resetStatus(@Param(value = "id")Integer id);

    @Select("select * from  borrowbook  where book_id = #{id} ORDER BY borrow_time desc")
    List<BorrowBook> findBorrowBookById(@Param(value = "id")Integer id);

    @Update("update borrowbook set realreturn_time=#{realreturnTime} where id=#{id}")
    int updateBorrowBook(BorrowBook borrowBook);

    @Select({"<script>",
            "SELECT * FROM book",
            "WHERE 1=1",
            "<when test='name!=null'>",
            "AND NAME like CONCAT('%',#{name},'%')",
            "</when>",
            "<when test='type!=null'>",
            "AND TYPE = #{type}",
            "</when>",
            "<when test='description!=null'>",
            "AND description like CONCAT('%',#{description},'%')",
            "</when>",
            "ORDER BY create_time desc",
            "</script>"})
    List<Book> findBooksByCondition(Book book);
}
