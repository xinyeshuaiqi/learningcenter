package pers.wmx.learningcenter.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import pers.wmx.learningcenter.domain.*;
import pers.wmx.learningcenter.service.*;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * @author: wang ming xin
 * @create: 2019-04-10 12:10
 */

@Controller
public class UserController {

    @Autowired
    UserService userService;

    @Autowired
    ActivityService activityService;

    @Autowired
    BookService bookService;

    @Autowired
    MaterialsService materialsService;

    @Autowired
    TopicService topicService;

    /* 注册 */
    //注册页面跳转
    @RequestMapping("/registry")
    public String registry(){
        return "registry";
    }

    //注册逻辑
    @RequestMapping("/toRegistry")
    public String toRegistry(Model model,User user){

        //验证学号的唯一性
        List<User> users = userService.findUserByNumber(user.getNumber());
        if(users!=null && users.size()>0){
            model.addAttribute("msg","注册失败，该学号已注册！");
            return "registry";
        }

        //还未注册
        int ret = userService.registry(user);
        if(ret <=0){
            model.addAttribute("msg","注册失败，请稍后重试！");
            return "registry";
        }

        model.addAttribute("msg","注册成功！欢迎加入大家庭！");

        return "registry";
    }

    /* 登陆 */
    //登陆页面跳转
    @RequestMapping("/login")
    public String login(){
        return "login";
    }
    //登录逻辑
    @RequestMapping("/toLogin")
    public String toLogin(Model model,User user,HttpServletRequest request){

        User ret = userService.findByUser(user);

        if(ret == null){
            model.addAttribute("msg","登陆失败，学号或密码错误！");
            model.addAttribute("formUser",user);  //数据回显
            return "login";
        }

        if(ret.getSatus() == 1){
            model.addAttribute("msg","登陆失败，用户被禁用！");
            model.addAttribute("formUser",user);  //数据回显
            return "login";
        }

        //放在session
        request.getSession().setAttribute("nowuser",ret);

        if(ret.getIsAdmin() == 1){
            return "admin/admin"; //如果是管理员跳转到管理页面
        }

        model.addAttribute("msg","登陆成功！");

        return "redirect:/";
    }

    @RequestMapping("/loginout")
    public String loginout(HttpServletRequest request){

        int maxInactiveInterval = request.getSession().getMaxInactiveInterval();
        System.out.println("session时效:"+maxInactiveInterval);
        //移除session
        request.getSession().removeAttribute("nowuser");

        return "/";
    }

    @RequestMapping("/homepage")
    public String homepage(Model model,HttpServletRequest request){

        User user = (User) request.getSession().getAttribute("nowuser");
        Integer userId = user.getId();
        List<Activity> activitieList = activityService.findActivityList(userId);
        List<Book> bookList =bookService.findBooks(userId);
        List<Materials> materialsList = materialsService.findMaterialsList(userId);
        List<Topic> topicList= topicService.findTopicList(userId);

        model.addAttribute("activitieList",activitieList);
        model.addAttribute("bookList",bookList);
        model.addAttribute("materialsList",materialsList);
        model.addAttribute("topicList",topicList);

        return "homepage";
    }

    @RequestMapping("/editInfo")
    public String editInfo(){
        return "editInfo";
    }


    @RequestMapping("/toEditInfo")
    public String toEditInfo(User user,HttpServletRequest request){
        int ret = userService.updateUser(user);

        List<User> users = userService.findUserByNumber(user.getNumber());
        request.getSession().setAttribute("nowuser",users.get(0));

        return "redirect:homepage";
    }

    @RequestMapping("/deleteUserById")
    @ResponseBody
    public Result deleteUserById(Integer id){
        if(StringUtils.isEmpty(id)){
            return new Result(true,802,"删除失败!");
        }

        int ret = userService.deleteById(id);

        if(ret>0){
            return new Result(true,801,"删除成功!");
        }
        return new Result(true,802,"删除失败!");
    }

    @RequestMapping("/banUser")
    @ResponseBody
    public Result banUser(Integer id){
        if(StringUtils.isEmpty(id)){
            return new Result(true,802,"禁用失败!");
        }

        int ret = userService.banUser(id);

        if(ret>0){
            return new Result(true,801,"禁用成功!");
        }
        return new Result(true,802,"禁用失败!");
    }


    @RequestMapping("/activeUser")
    @ResponseBody
    public Result activeUser(Integer id){
        if(StringUtils.isEmpty(id)){
            return new Result(true,802,"激活失败!");
        }

        int ret = userService.activeUser(id);

        if(ret>0){
            return new Result(true,801,"激活成功!");
        }
        return new Result(true,802,"激活失败!");
    }

    @RequestMapping("/resetPas")
    public String resetPas(Integer id,Model model){

        model.addAttribute("id",id);

        return "admin/resetPas";
    }


    @RequestMapping("/updatePas")
    public String updatePas(Integer id,String password,Model model){

        int ret = userService.updatePas(id,password);
        if(ret>0) {
            model.addAttribute("msg", "密码修改成功,新密码为:"+password);
        }

        return "admin/resetPas";
    }
}
