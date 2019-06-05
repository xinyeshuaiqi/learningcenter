package pers.wmx.learningcenter.controller;

import org.csource.common.MyException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import pers.wmx.learningcenter.domain.Result;
import pers.wmx.learningcenter.service.UploadService;

import java.io.IOException;
import java.util.List;

/**
 * @author: wang ming xin
 * @create: 2019-04-09 20:18
 */
@Controller
public class UploadController {

    @Autowired
    UploadService uploadService;


    @RequestMapping("/upload")
    @ResponseBody
    public Result saveBook(@RequestParam("file") MultipartFile file) throws IOException, MyException {

        String fileId = uploadService.uploadDFS(file);
        Result result = new Result(true,701,fileId);

        return result;
    }
}
