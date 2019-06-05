package pers.wmx.learningcenter.controller;

import net.sf.jsqlparser.statement.select.Top;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import pers.wmx.learningcenter.domain.*;
import pers.wmx.learningcenter.service.ReplyService;
import pers.wmx.learningcenter.service.TopicService;
import pers.wmx.learningcenter.service.UserService;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.List;

/**
 * @author: wang ming xin
 * @create: 2019-05-14 18:55
 */
@Controller
public class TopicController {
    @Autowired
    TopicService topicService;

    @Autowired
    ReplyService replyService;

    @Autowired
    UserService userService;

    @RequestMapping("/createTopic")
    public String createTopic(){
        return "createTopic";
    }

    @RequestMapping("/toCreateTopic")
    public String toCreateTopic(Topic topic, HttpServletRequest request, Model model){
        User nowuser = (User) request.getSession().getAttribute("nowuser");
        Integer userId = nowuser.getId();

        topic.setUserId(userId);
        topic.setCreateTime(new Date());

        int ret = topicService.add(topic);
        if (ret > 0) {
            String nickname = nowuser.getNickname();
            topic.setNickName(nickname);
            model.addAttribute("topic",topic);
        }

        return "afterCreateTopic";
    }

    @RequestMapping("/deleteTopicById")
    @ResponseBody
    public Result deleteTopicById(Integer id){
        if(StringUtils.isEmpty(id)){
            return new Result(true,802,"删除失败!");
        }

        int ret = topicService.deleteById(id);

        if(ret>0){
            return new Result(true,801,"删除成功!");
        }
        return new Result(true,802,"删除失败!");
    }


    @RequestMapping("/editTopic")
    public String editTopic(Integer id,Model model){

        Topic topic = topicService.findById(id);
        model.addAttribute("topic",topic);

        return "editTopic";
    }

    @RequestMapping("/toEditTopic")
    public String toEditTopic(Topic topic, Model model,HttpServletRequest request){
        topic.setUpdateTime(new Date());

        int ret = topicService.updateTopic(topic);

        User nowuser = (User) request.getSession().getAttribute("nowuser");
        topic.setNickName(nowuser.getNickname());

        model.addAttribute("topic",topic);

        return "afterEditTopic";
    }


    @RequestMapping("/topicInfo")
    public String topicInfo(Integer id,String msg,Model model){

        Topic topic = topicService.findById(id);
        Integer userId = topic.getUserId();
        String nickname = userService.findNicknameById(userId);
        topic.setNickName(nickname);

        //评论
        List<Reply> replyList = replyService.findReplyList(id);

        replyList.forEach(e->{
            Integer userId1 = e.getUserId();
            String nickname1 = userService.findNicknameById(userId1);
            e.setNickName(nickname1);

            List<Reply> children = replyService.findChildren(e.getId());
            children.forEach(f->{
                Integer userId2 = f.getUserId();
                String nickname2 = userService.findNicknameById(userId2);
                f.setNickName(nickname2);
            });

            e.setChildren(children);
        });

        topic.setReplyList(replyList);

        model.addAttribute("topic",topic);
        model.addAttribute("msg",msg);

        return "topicInfo";
    }

    @RequestMapping("/topicView")
    public String topicView(Model model){

        List<Topic> topicList = topicService.findTopicList(null);

        topicList.forEach(e->{
            Integer userId = e.getUserId();
            String nickname = userService.findNicknameById(userId);
            e.setNickName(nickname);
        });

        model.addAttribute("topicList",topicList);

        return "topicView";
    }

    @RequestMapping("/topicComment")
    public String topicComment(Integer id, String content, HttpServletRequest request, RedirectAttributes attr, Model model){
        User nowuser = (User) request.getSession().getAttribute("nowuser");
        Integer userId = nowuser.getId();

        Reply reply = new Reply();
        reply.setTopicId(id);
        reply.setUserId(userId);
        reply.setContent(content);
        reply.setCreateTime(new Date());

        int ret = replyService.add(reply);

        attr.addAttribute("id",id);

        return "redirect:/topicInfo";
    }

    //回复
    @RequestMapping("/replyComment")
    public String replyComment(Integer topicId,Integer id, String content, HttpServletRequest request, RedirectAttributes attr, Model model){
        User nowuser = (User) request.getSession().getAttribute("nowuser");
        Integer userId = nowuser.getId();

        Reply reply = new Reply();
        reply.setTopicId(-1);
        reply.setParentId(id);
        reply.setUserId(userId);
        reply.setContent(content);
        reply.setCreateTime(new Date());

        int ret = replyService.add(reply);

        attr.addAttribute("id",topicId);

        return "redirect:/topicInfo";
    }

    //赞
    @RequestMapping("/like")
    public String like(Integer id,HttpServletRequest request,RedirectAttributes attr){
        User nowuser = (User) request.getSession().getAttribute("nowuser");
        Integer userId = nowuser.getId();

        RecordLike recordLikeNum = topicService.findRecordLike(id,userId);
        if(recordLikeNum==null){
            recordLikeNum = new RecordLike();
            recordLikeNum.setTopicId(id);
            recordLikeNum.setUserId(userId);

            int ret = topicService.addRecordLike(recordLikeNum);
            int ret1 = topicService.updateLikeNum(id);

        } else{
            attr.addAttribute("msg","请勿重复点赞");
        }

        attr.addAttribute("id",id);

        return "redirect:/topicInfo";
    }

    //赞
    @RequestMapping("/dislike")
    public String dislike(Integer id,HttpServletRequest request,RedirectAttributes attr){
        User nowuser = (User) request.getSession().getAttribute("nowuser");
        Integer userId = nowuser.getId();

        RecordDisLike recordDisLikeNum = topicService.findRecordDisLike(id,userId);
        if(recordDisLikeNum==null){
            recordDisLikeNum = new RecordDisLike();
            recordDisLikeNum.setTopicId(id);
            recordDisLikeNum.setUserId(userId);

            int ret = topicService.addRecordDisLike(recordDisLikeNum);
            int ret1 = topicService.updateDisLikeNum(id);

        } else{
            attr.addAttribute("msg","请勿重复踩");
        }

        attr.addAttribute("id",id);

        return "redirect:/topicInfo";
    }


}
