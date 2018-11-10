package com.jk.controller.oss;

import com.jk.util.OSSClientUtil;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class UpDownServiceImpl {

    private OSSClientUtil ossClient=new OSSClientUtil();
    public String updateHead(MultipartFile file, long userId) throws Exception {
        if (file == null || file.getSize() <= 0) {
            throw new Exception("头像不能为空");
        }
        String name = ossClient.uploadImg2Oss(file);
        String imgUrl = ossClient.getImgUrl(name);
        //userDao.updateHead(userId, imgUrl);//只是本地上传使用的
        return imgUrl;
    }

}
