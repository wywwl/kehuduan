package com.jk.controller.oss;


import com.jk.service.CodeService;
import org.apache.catalina.servlet4preview.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UpDownServiceImpl upDownServiceImpl;
    //处理文件上传
    @RequestMapping(value="/testuploadimg", method = RequestMethod.POST)
    @ResponseBody
    /*public  String uploadImg(@RequestParam("file") MultipartFile file,
                             HttpServletRequest request) {*/
    public Map<String, Object> headImgUpload(HttpServletRequest request, @RequestParam("file") MultipartFile file) {
        Map<String, Object> value = new HashMap<String, Object>();
        value.put("success", true);
        value.put("errorCode", 0);
        value.put("errorMsg", "");
        String url ="";
        try {
            url = upDownServiceImpl.updateHead(file, 4);//此处是调用上传服务接口，4是需要更新的userId 测试数据。
            value.put("data", url);
        } catch (IOException e) {
            e.printStackTrace();
            value.put("success", false);
            value.put("errorCode", 200);
            value.put("errorMsg", "图片上传失败");
        } catch (Exception e) {
            e.printStackTrace();
        }
        System.out.println(url);
        return value;
    }


/*
    @RequestMapping("shangchuan1")
    @ResponseBody
    public String contentFileUpload1(MultipartFile images, HttpServletRequest request) {
        //建立以时间命名的文件夹
        SimpleDateFormat sdf = new SimpleDateFormat("/yyyy/MM/dd/");
        String datePath = sdf.format(new Date());
        // 上传文件原始名称
        String originFileName = images.getOriginalFilename();
        // 新的文件名称
        String file = UUID.randomUUID() + originFileName.substring(originFileName.lastIndexOf("."));
        System.out.println(file+"sssssssssssssssssssssssssssssssssssssssssssssssssss");
        Map<String, Object> value = new HashMap<String, Object>();
        String url ="";
        try {
            url = UpDownService.updateHead1(images);
            logger.debug("图片路径{}",url);
            System.out.println(url);

            value.put("code", 0);
            value.put("msg", "图片上传成功");
        } catch (Exception e) {
            e.printStackTrace();
            value.put("code", 2000);
            value.put("msg", "图片上传成功");
        }
        System.out.println(url+"sssssssssssssssssssssssssssssssssssssssssssssssssss");


        return url;
    }*/


}
