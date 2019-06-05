package pers.wmx.learningcenter.domain;

/**
 * @author: wang ming xin
 * @create: 2019-04-13 14:30
 */
public class Result {

    boolean success;

    int code;

    String msg;

    public Result(boolean success, int code, String msg) {
        this.success = success;
        this.code = code;
        this.msg = msg;
    }

    public boolean isSuccess() {
        return success;
    }

    public void setSuccess(boolean success) {
        this.success = success;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }
}
