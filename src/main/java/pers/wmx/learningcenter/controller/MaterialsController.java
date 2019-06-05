package pers.wmx.learningcenter.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import pers.wmx.learningcenter.domain.Book;
import pers.wmx.learningcenter.domain.Materials;
import pers.wmx.learningcenter.domain.Result;
import pers.wmx.learningcenter.domain.User;
import pers.wmx.learningcenter.service.MaterialsService;
import pers.wmx.learningcenter.service.UserService;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.List;

/**
 * @author: wang ming xin
 * @create: 2019-05-12 21:30
 */

@Controller
public class MaterialsController {
    @Value("${severfile.url}")
    String fileUrl;

    @Autowired
    MaterialsService materialsService;

    @Autowired
    UserService userService;

    @RequestMapping("/uploadFile")
    public String uploadFile(){
        return "uploadFile";
    }

    @RequestMapping("/toUploadFile")
    public String toUploadFile(Materials materials, HttpServletRequest request, Model model){
        User nowuser = (User) request.getSession().getAttribute("nowuser");
        Integer userId = nowuser.getId();

        materials.setUserId(userId);
        materials.setCreateTime(new Date());

        int ret = materialsService.add(materials);

        if(ret>0){
            materials.setNickName(nowuser.getNickname());
            model.addAttribute("materials",materials);
            //model.addAttribute("fileurl",fileUrl);
            return "materialsInfo";
        }

        model.addAttribute("msg","上传资料失败，请稍后重试！");

        return "uploadFile";
    }


    @RequestMapping("/materialsInfo")
    public String materialsInfo(String id,String msg,Model model){

        Materials materials = materialsService.findById(Integer.parseInt(id));

        Integer userId = materials.getUserId();
        String nickname = userService.findNicknameById(userId);
        materials.setNickName(nickname);

        model.addAttribute("msg",msg);
        model.addAttribute("materials",materials);

        return "materialsInfo";
    }

    @RequestMapping("/deleteMaterialsById")
    @ResponseBody
    public Result deleteMaterialsById(Integer id){
        if(StringUtils.isEmpty(id)){
            return new Result(true,802,"删除失败!");
        }

        int ret = materialsService.deleteById(id);

        if(ret>0){
            return new Result(true,801,"删除成功!");
        }
        return new Result(true,802,"删除失败!");
    }

    @RequestMapping("/editMaterials")
    public String editMaterials(Integer id,Model model){

        Materials materials = materialsService.findById(id);
        model.addAttribute("materials",materials);

        return "editMaterials";
    }

    @RequestMapping("/toEditMaterials")
    public String editMaterials(Materials materials,Model model,HttpServletRequest request){

        User nowuser = (User) request.getSession().getAttribute("nowuser");

        int ret = materialsService.updateMaterials(materials);

        if(ret>0){
            Materials materials1 = materialsService.findById(materials.getId());
            materials1.setNickName(nowuser.getNickname());
            model.addAttribute("materials",materials1);
            return "materialsInfo";
        }

        return "homepage";
    }

    @RequestMapping("/materialsView")
    public String materialsView(Model model){
        List<Materials> materialsList = materialsService.findMaterialsList(null);
        model.addAttribute("materialsList",materialsList);
        return "materialsView";
    }

    @RequestMapping("/searchMaterials")
    public String searchMaterials(Materials materials,Model model){

        if(StringUtils.isEmpty(materials.getName())){
            materials.setName(null);
        }
        if(StringUtils.isEmpty(materials.getType())){
            materials.setType(null);
        }
        if(StringUtils.isEmpty(materials.getDescription())){
            materials.setDescription(null);
        }

        List<Materials> materialsList = materialsService.findMaterialsByCondition(materials);
        model.addAttribute("materialsList",materialsList);

        return "materialsView";
    }


    @RequestMapping("/orderMaterials")
    public String orderMaterials(Model model){

        List<Materials> materialsList = materialsService.findMaterialsOrderLy();
        model.addAttribute("materialsList",materialsList);

        return "materialsView";
    }

}
