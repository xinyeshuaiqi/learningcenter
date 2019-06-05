package pers.wmx.learningcenter.controller;

import org.csource.common.MyException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import pers.wmx.learningcenter.service.DownloadService;
import pers.wmx.learningcenter.service.MaterialsService;

import java.io.IOException;

/**
 * @author: wang ming xin
 * @create: 2019-05-13 18:01
 */

@Controller
public class DownloadController {

    @Autowired
    DownloadService downloadService;

    @Autowired
    MaterialsService materialsService;

    @RequestMapping("/downloadFile")
    public String downloadFile(String filePath,Integer id,RedirectAttributes attr) throws IOException, MyException {

        downloadService.downloadDFS(filePath);

        int ret = materialsService.updateDownloadNum(id);

        attr.addAttribute("id",id);
        attr.addAttribute("msg","下载成功");

        return "redirect:/materialsInfo";
    }

}
