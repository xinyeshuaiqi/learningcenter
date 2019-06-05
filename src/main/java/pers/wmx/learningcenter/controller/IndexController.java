package pers.wmx.learningcenter.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author: wang ming xin
 * @create: 2019-04-10 12:10
 */

@Controller
public class IndexController {

    @RequestMapping("/")
    public String index(){
        return "index";
    }



}
