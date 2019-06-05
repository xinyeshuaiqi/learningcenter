package pers.wmx.learningcenter.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import pers.wmx.learningcenter.domain.*;
import pers.wmx.learningcenter.service.*;

import java.util.List;

/**
 * @author: wang ming xin
 * @create: 2019-05-16 17:34
 */
@Controller
public class AdminController {

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

    @RequestMapping("/admin")
    public String admin(){
        return "admin/admin";
    }

    @RequestMapping("/userAdmin")
    public String userAdmin(Model model){

        List<User> users = userService.findUserList();
        model.addAttribute("users",users);

        return "admin/userAdmin";
    }


    @RequestMapping("/activityAdmin")
    public String activityAdmin(Model model){

        List<Activity> activityList = activityService.findActivityList(null);

        activityList.forEach(e->{
            Integer userId = e.getUserId();
            String nickname = userService.findNicknameById(userId);
            e.setNickname(nickname);
        });

        model.addAttribute("activityList",activityList);

        return "admin/activityAdmin";
    }

    @RequestMapping("/bookAdmin")
    public String bookAdmin(Model model){

        List<Book> books = bookService.findBooks(null);

        books.forEach(e->{
            Integer userId = e.getUserId();
            String nickname = userService.findNicknameById(userId);
            e.setNickname(nickname);
        });

        model.addAttribute("books",books);

        return "admin/bookAdmin";
    }

    @RequestMapping("/materialsAdmin")
    public String materialsAdmin(Model model){

        List<Materials> materialsList = materialsService.findMaterialsList(null);

        materialsList.forEach(e->{
            Integer userId = e.getUserId();
            String nickname = userService.findNicknameById(userId);
            e.setNickName(nickname);
        });

        model.addAttribute("materialsList",materialsList);

        return "admin/materialsAdmin";
    }

    @RequestMapping("/topicAdmin")
    public String topicAdmin(Model model){

        List<Topic> topicList = topicService.findTopicList(null);

        topicList.forEach(e->{
            Integer userId = e.getUserId();
            String nickname = userService.findNicknameById(userId);
            e.setNickName(nickname);
        });

        model.addAttribute("topicList",topicList);

        return "admin/topicAdmin";
    }

}
