package com.jk.controller;
import com.jk.model.Advertisement;
import com.jk.service.StudentService;
import com.jk.util.OSSClientUtil;
import org.springframework.beans.factory.ListableBeanFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

@Controller
@RequestMapping("student")
public class StudentController {

    @Autowired
    private StudentService studentService;

    @RequestMapping("jiekou")
    public void tojiekou() {
        studentService.hh();
        System.out.println("哈哈哈哈哈   看成功了吧");
    }

    /**
     * 跳转查询页面
     * @return
     */
    @RequestMapping("/toqueryList")
    public String toqueryList(){
        return "/WEB-INF/jsp/queryList.jsp";
    }

    /**
     * 分页查询
     * @return
     */
    @RequestMapping("/queryList")
    @ResponseBody
    public Map<String,Object> queryList(int page, int rows, Advertisement advertisement){
        Map<String,Object> map = studentService.queryList(page,rows,advertisement);
        return map;
    }

    /**
     *批量删除
     */
    @RequestMapping("remUserById")
    @ResponseBody
    public Boolean remUserById(String[] ids) {
        try {
            studentService.remUserById(ids);
        } catch (Exception e) {
            return false;
        }
        return true;
    }
    @RequestMapping("toAdd")
    public String toAdd(){
        return "/WEB-INF/jsp/addStu.jsp";
    }

    /**
     * 新增
     * @param userBean
     * @return
     */
    @RequestMapping("addStu")
    @ResponseBody
    public Boolean addStu(Advertisement advertisement) {
        try {
            studentService.addStu(advertisement);
        } catch (Exception e) {
            return false;
        }
        return true;
    }


    /*添加图片*/
    @RequestMapping(value="headImgUpload", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> headImgUpload(HttpServletRequest request, @RequestParam("img") MultipartFile image) throws Exception {
        Map<String, Object> value = new HashMap<String, Object>();
        value.put("success", true);
        value.put("errorCode", 0);
        value.put("errorMsg", "");
        OSSClientUtil oss = new OSSClientUtil();
        String fileName = oss.uploadImg2Oss(image);
        String imgUrl = oss.getImgUrl(fileName);
        System.out.println("newUrl"+fileName);
        System.out.println("imgUrl"+imgUrl);
        value.put("fileName", fileName);
        value.put("imgUrl",imgUrl);
        return value;
    }


    /**
     * 修改跳转回显
     */
    @RequestMapping("toupdate")
    public String toupdate() {
        return "/WEB-INF/jsp/updateStu.jsp";
    }

    /**
     * 单条查询
     * @param advertisement
     * @param request
     * @return
     */
    @RequestMapping("getStuById")
    @ResponseBody
    public Advertisement getStuById(Advertisement advertisement, HttpServletRequest request) {
        Advertisement user = studentService.getStuById(advertisement);
        return user;
    }
    /**
     * 修改
     */
    @RequestMapping("updateStu")
    @ResponseBody
    public Boolean updateStu(Advertisement advertisement) {
        try {
            studentService.updateStu(advertisement);
        } catch (Exception e) {
            return false;
        }
        return true;
    }

    @RequestMapping("/toIndex")
    public String toIndex(){
        return "index";
    }


}