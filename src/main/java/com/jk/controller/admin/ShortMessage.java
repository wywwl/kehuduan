package com.jk.controller.admin;

import com.alibaba.dubbo.common.utils.StringUtils;
import com.alibaba.fastjson.JSONArray;
import com.jk.model.admin.Advertisement;
import com.jk.model.aop.RoleLog;
import com.jk.service.admin.AdminService;
import com.jk.util.admin.Constant;
import com.jk.util.admin.HttpClientUtil;
import com.jk.util.admin.Md5Util;
import com.jk.util.admin.TimeUtil;
import com.mongodb.AggregationOutput;
import com.mongodb.BasicDBObject;
import com.mongodb.DBObject;
import org.apache.commons.httpclient.HttpException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.domain.Sort.Order;
import org.springframework.stereotype.Component;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.TimeUnit;

@Component
public class ShortMessage {

    @Autowired
    private AdminService adminService;

    @Autowired
    private RedisTemplate redisTemplate;

    @Autowired
    private MongoTemplate mongoTemplate;

    private static final SimpleDateFormat dateFormat = new SimpleDateFormat("HH:mm:ss");


    //@Scheduled(fixedRate = 10000)
    public void reportCurrentTime()  throws HttpException, IOException, ParseException {
        System.out.println("现在时间：" + dateFormat.format(new Date()));
        List<Advertisement> asas = adminService.gettest();
        for(int i = 0; i < asas.size(); i++){
            String starttime = asas.get(i).getStarttime();//遍历出每个广告位购买的开始时间
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");//时间格式
            long time = simpleDateFormat.parse(starttime).getTime();//转换成毫秒值
            long currentTime = System.currentTimeMillis();//获取当前时间的毫秒值
            long timeDifference = currentTime - time;//当前时间的毫秒值减去开始时间的毫秒值
            long newTime = time + timeDifference;//开始时间的毫秒值加上当前时间的毫秒值减去开始时间的毫秒值


            adminService.updataAdvertisement(asas.get(i).getId(),newTime);//修改开始时间的毫秒值
            long secondtime = asas.get(i).getSecondtime();//遍历出每个广告开始时间的毫秒值
            String endtime = asas.get(i).getEndtime();//遍历出每个广告的结束时间
            long endSecond = simpleDateFormat.parse(endtime).getTime();//转换成毫秒值
            long middle = endSecond - secondtime;//得出中间差
            long days = ((middle+86400000) / (1000 * 60 * 60 * 24));//转换成天数
            System.out.println(days+"差天");
            if(days == 0){
                adminService.deleteAdvertisement(asas.get(i).getId());
                System.out.println("成功执行删除方法");
            }
            if(days == 15 || days == 12 || days == 9 || days == 6 || days == 3 || days == 1){
                //缓存标识锁（lock）key，开头加上手机号保证唯一性  用来拦截当天只能发送一次短信
                String flagkey = Constant.LOGIN_CODE_FLAG + asas.get(i).getEnterprisephone();
                //在缓存中获取lock
                String lock = (String)redisTemplate.opsForValue().get(flagkey+asas.get(i).getEnterprisephone());
                if(StringUtils.isEmpty(lock)){
                    Integer random = (int) ((Math.random()*9+1)*100000);
                    HashMap<String, Object> params = new HashMap<>();
                    params.put("accountSid",Constant.ACCOUNTSID);
                    params.put("templateid",Constant.TEMPLATEID);
                    params.put("param",random);
                    params.put("to",asas.get(i).getEnterprisephone());
                    String timestamp = TimeUtil.format(new Date());
                    params.put("timestamp",timestamp);
                    String sign = Md5Util.getMd532(Constant.ACCOUNTSID+Constant.AUTH_TOKEN+timestamp);
                    params.put("sig",sign);
                    String post = HttpClientUtil.post(Constant.SMS_URL, params);
                    redisTemplate.opsForValue().set(flagkey+asas.get(i).getEnterprisephone(), "lock", 1, TimeUnit.DAYS);
                    System.out.println("短信发送成功");
                }
            }

        }

    }




//  广告存入缓存中
//    String test = (String)redisTemplate.opsForValue().get("test");
//    List<Advertisement> advertisements = JSONArray.parseArray(test, Advertisement.class);
//        for(int i = 0; i < advertisements.size(); i++){
//        String starttime = advertisements.get(i).getStarttime();//遍历出每个广告位购买的开始时间
//        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");//时间格式
//        long time = simpleDateFormat.parse(starttime).getTime();//转换成毫秒值
//        long currentTime = System.currentTimeMillis();//获取当前时间的毫秒值
//        long timeDifference = currentTime - time;//当前时间的毫秒值减去开始时间的毫秒值
//        long newTime = time + timeDifference;//开始时间的毫秒值加上当前时间的毫秒值减去开始时间的毫秒值
//        //-----------
//        long secondtime = advertisements.get(i).getSecondtime();//遍历出每个广告开始时间的毫秒值
//        String endtime = advertisements.get(i).getEndtime();//遍历出每个广告的结束时间
//        long endSecond = simpleDateFormat.parse(endtime).getTime();//转换成毫秒值
//        long middle = endSecond - secondtime;//得出中间差
//        long days = ((middle+86400000) / (1000 * 60 * 60 * 24));//转换成天数
//        System.out.println("还剩"+days+"天");
//        //先发短信再修改
//        if(days == 0){
//            adminService.deleteAdvertisement(advertisements.get(i).getId());
//            System.out.println("成功执行删除方法");
//        }
//        if(days == 15 || days == 12 || days == 9 || days == 6 || days == 3 || days == 1){
//            //缓存标识锁（lock）key，开头加上手机号保证唯一性  用来拦截当天只能发送一次短信
//            String flagkey = Constant.LOGIN_CODE_FLAG + advertisements.get(i).getEnterprisephone();
//            //在缓存中获取lock
//            String lock = (String)redisTemplate.opsForValue().get(flagkey+advertisements.get(i).getEnterprisephone());
//            if(StringUtils.isEmpty(lock)){
//                Integer random = (int) ((Math.random()*9+1)*100000);
//                HashMap<String, Object> params = new HashMap<>();
//                params.put("accountSid",Constant.ACCOUNTSID);
//                params.put("templateid",Constant.TEMPLATEID);
//                params.put("param",random);
//                params.put("to",advertisements.get(i).getEnterprisephone());
//                String timestamp = TimeUtil.format(new Date());
//                params.put("timestamp",timestamp);
//                String sign = Md5Util.getMd532(Constant.ACCOUNTSID+Constant.AUTH_TOKEN+timestamp);
//                params.put("sig",sign);
//                String post = HttpClientUtil.post(Constant.SMS_URL, params);
//                redisTemplate.opsForValue().set(flagkey+advertisements.get(i).getEnterprisephone(), "lock", 1, TimeUnit.DAYS);
//                System.out.println("短信发送成功");
//            }
//        }
//        //再次赋值装到redisz中
//        advertisements.get(i).setSecondtime(newTime);
//    }
//    String json = JSONArray.toJSONString(advertisements);
//        redisTemplate.opsForValue().set("test",json);
























}
