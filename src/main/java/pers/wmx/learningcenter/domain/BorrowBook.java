package pers.wmx.learningcenter.domain;

import java.util.Date;

/**
 * @author: wang ming xin
 * @create: 2019-04-15 01:06
 */

public class BorrowBook {
    Integer id;

    Integer bookId;

    Integer userId;

    String nickname;

    String phoneNumber;

    //借的时间
    Date borrowTime;

    //可以保存的时间
    int keepTime;

    //预计归还时间  borrowTime + keepTime
    Date willreturnTime;

    //实际归还时间 这个由书还后，书的所有者来确定
    Date realreturnTime;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getBookId() {
        return bookId;
    }

    public void setBookId(Integer bookId) {
        this.bookId = bookId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Date getBorrowTime() {
        return borrowTime;
    }

    public void setBorrowTime(Date borrowTime) {
        this.borrowTime = borrowTime;
    }

    public int getKeepTime() {
        return keepTime;
    }

    public void setKeepTime(int keepTime) {
        this.keepTime = keepTime;
    }

    public Date getWillreturnTime() {
        return willreturnTime;
    }

    public void setWillreturnTime(Date willreturnTime) {
        this.willreturnTime = willreturnTime;
    }

    public Date getRealreturnTime() {
        return realreturnTime;
    }

    public void setRealreturnTime(Date realreturnTime) {
        this.realreturnTime = realreturnTime;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }
}
