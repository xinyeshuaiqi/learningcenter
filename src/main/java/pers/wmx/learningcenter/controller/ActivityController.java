package pers.wmx.learningcenter.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.sun.org.apache.xpath.internal.operations.Mod;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import pers.wmx.learningcenter.domain.Activity;
import pers.wmx.learningcenter.domain.Result;
import pers.wmx.learningcenter.domain.User;
import pers.wmx.learningcenter.service.ActivityService;
import pers.wmx.learningcenter.service.UserService;

import javax.servlet.http.HttpServletRequest;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.concurrent.TimeUnit;

/**
 * @author: wang ming xin
 * @create: 2019-04-12 17:56
 */

@Controller
public class ActivityController {

    @Autowired
    ActivityService activityService;

    @Autowired
    UserService userService;

    @Autowired
    private RedisTemplate<String, String> redisTemplate;

    @RequestMapping("/createActivity")
    public String createActivity(){
        return "createActivity";
    }

    @RequestMapping("/toCreateActivity")
    public String toCreateActivity(Model model,Activity activity, HttpServletRequest request){

        User nowuser = (User)request.getSession().getAttribute("nowuser");
        Integer userId = nowuser.getId();
        activity.setUserId(userId);

        try {
            activity.setCreateTime(new Date());
            String startTimeStr = activity.getStartTimeStr();
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
            Date startTime = simpleDateFormat.parse(startTimeStr);
            activity.setStartTime(startTime);

        } catch (Exception e) {
            e.printStackTrace();
        }

        //保存活动
        int ret = activityService.addActivity(activity);

        //获取创建人昵称
        List<User> users = userService.findUserByNumber(nowuser.getNumber());
        activity.setNickname(users.get(0).getNickname());

        if(ret>0){
            model.addAttribute("createActivity","活动已成功创建！");
            model.addAttribute("theActivity",activity);
            return "activityDetail";
        }else{
            model.addAttribute("createActivity","活动创建失败，请稍后重试！");
        }

        //之后做成跳转到该活动的详情页面

        return "createActivity";

    }

    @RequestMapping(value = "/deleteById")
    @ResponseBody
    public Result deleteById(String id){

        if(StringUtils.isEmpty(id)){
            return new Result(true,602,"删除失败!");
        }

        int curId = Integer.parseInt(id);
        int ret = activityService.deleteById(curId);
        if(ret>0){
            return new Result(true,601,"删除成功!");
        }
        return new Result(true,602,"删除失败!");
    }

    //活动编辑页面  表单回显
    @RequestMapping(value = "/editActivity")
    public String editActivity(Model model,Integer id){

        if(StringUtils.isEmpty(id)){
            return "/homepage";
        }

        Activity activity = activityService.findById(id);
        model.addAttribute("activityToEdit",activity);

        return "editActivity";
    }

    //更新活动
    @RequestMapping(value = "/toEditActivity")
    public String toEditActivity(Model model,Activity activity) throws ParseException {

        String startTimeStr = activity.getStartTimeStr();
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
        Date startTime = simpleDateFormat.parse(startTimeStr);
        activity.setStartTime(startTime);

        int ret = activityService.updateActivity(activity);

        if(ret>0){
            Activity activity_ret = activityService.findById(activity.getId());
            model.addAttribute("theActivity",activity_ret);
        }
        return "activityDetail";

    }

    @RequestMapping("/activityView")
    public String activityView(Model model) throws JsonProcessingException {

        /*String activitiesStr = redisTemplate.boundValueOps("activities").get();

        if(null == activitiesStr) {
            List<Activity> activities = activityService.findActivityList(null);

            //转换成json
            ObjectMapper objectMapper = new ObjectMapper();
            activitiesStr = objectMapper.writeValueAsString(activities);

            //将数据塞入redis
            redisTemplate.boundValueOps("activities").set(activitiesStr);
            redisTemplate.expire("activities",5,TimeUnit.MINUTES);  //设置5分钟过期时间

            System.out.println("从数据库获取数据，数据已放入缓存");

            model.addAttribute("activities",activities);
            return "activityView";
        }

        //json转为java对象
        JSONArray parse = (JSONArray) JSONObject.parse(activitiesStr);
        List<Activity> activities = parse.toJavaList(Activity.class);

        System.out.println("从缓存获取数据");*/

        List<Activity> activities = activityService.findActivityList(null);

        model.addAttribute("activities",activities);

        return "activityView";
    }

    @RequestMapping("/activityInfo")
    public String activityInfo(Model model,Integer id,String msg){

        Activity activity = activityService.findById(id);

        Integer userId = activity.getUserId();
        String nickename = userService.findNicknameById(userId);
        activity.setNickname(nickename);

        //找到参加此活动的用户
        List<Integer> takeActivityUsers = activityService.findUsersById(id);
        List<String> nicknames = new ArrayList<>();
        takeActivityUsers.forEach(e->{
            String nickname = userService.findNicknameById(e);
            nicknames.add(nickname);
        });

        model.addAttribute("theActivity",activity);
        model.addAttribute("nicknames",nicknames);
        model.addAttribute("msg",msg);

        return "activityInfo";
    }

    @RequestMapping("/takeActivity")
    public String takeActivity(Integer id,HttpServletRequest request,RedirectAttributes attr,Model model){
        User user = (User) request.getSession().getAttribute("nowuser");
        Integer userId = user.getId();

        try{
            int ret = activityService.takeActivity(id,userId);
        }catch (Exception e){
            attr.addAttribute("msg","请勿重复报名！");
        }

        attr.addAttribute("id",id);

        return "redirect:/activityInfo";
    }
}
