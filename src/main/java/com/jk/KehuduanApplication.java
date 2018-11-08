package com.jk;

import com.fasterxml.jackson.databind.JsonNode;
import com.jk.util.Md5Util;
import com.jk.util.TimeUtil;
import org.apache.http.Consts;
import org.apache.http.HttpEntity;
import org.apache.http.client.config.RequestConfig;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;
import org.apache.solr.client.solrj.SolrClient;
import org.apache.solr.client.solrj.impl.LBHttpSolrClient;
import org.springframework.amqp.core.Queue;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ImportResource;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;

import javax.annotation.Resource;
import java.net.MalformedURLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
@SpringBootApplication
@ImportResource(value = {"classpath:spring-dubbo-consumer.xml"})
public class KehuduanApplication {



     public static void main(String[] args) {
      SpringApplication.run(KehuduanApplication.class, args);
     }

    @Bean
    public Queue getQueue(){
        return new Queue("A1804");
    }


   /* public static void main(String[] args){
        //创建httpClient默认实例 用来请求
        CloseableHttpClient httpClient = HttpClients.createDefault();

        List<BasicNameValuePair> params = new ArrayList<>();
        String timestamp = TimeUtil.format(new Date());
        Integer random = (int) ((Math.random()*9+1)*100000);
        String sign = Md5Util.getMd532("23bbbb63aa8c41b0aafa1c06384252a8"+"df07d7a98ba04dd09bd243cc275c965b"+timestamp);
        params.add(new BasicNameValuePair("accountSid","23bbbb63aa8c41b0aafa1c06384252a8"));//需要的参数
        params.add(new BasicNameValuePair("templateid","516215694")); //需要的参数
        params.add(new BasicNameValuePair("param",random.toString())); //需要的参数
        params.add(new BasicNameValuePair("to","16619978958")); //需要的参数
        params.add(new BasicNameValuePair("timestamp",timestamp)); //需要的参数
        params.add(new BasicNameValuePair("sig",sign)); //需要的参数

        CloseableHttpResponse response = null;//请求
        JsonNode jsonToJsonNode = null;
        try {
            //参数
            String paramsStr = EntityUtils.toString(new UrlEncodedFormEntity(params, Consts.UTF_8));
            HttpPost HttpPost = new HttpPost("https://api.miaodiyun.com/20150822/industrySMS/sendSMS"+paramsStr);

            //↓模仿浏览器请求
            HttpPost.setHeader("User-Agent", "Mozilla/5.0 (Windows NT 6.1;"
                    + " Win64; x64; rv:50.0) Gecko/20100101 Firefox/50.0");
            HttpPost.setHeader("Accept", "application/json");

            HttpPost.setHeader("Accept-Encoding", "gzip, deflate");
            HttpPost.setHeader("Content-Type", "application/x-www-form-urlencoded; charset=UTF-8");
            RequestConfig config = RequestConfig.custom()
                    .setConnectTimeout(1000)  		//设置链接超时的时间1秒钟
                    .setSocketTimeout(1000) 		//设置读取超时1秒钟
                    .build(); 						//RequestConfig静态方法  setProxy  设置代理
            HttpPost.setConfig(config);
            //↑

            response = httpClient.execute(HttpPost);//请求
            HttpEntity entity = response.getEntity();
            String dreamJson = EntityUtils.toString(entity,"UTF-8");
            System.out.println(dreamJson);
            //转化成json格式
            //jsonToJsonNode = JsonUtil.jsonToJsonNode(dreamJson);
            //转换成字符串存到mongodb中
            //String StringDream = jsonToJsonNode.toString();
            //字符串形式存入mongodb中
            //mongoTemplate.insert(StringDream,"dreamData");
            //json格式存入mongodb中
            //mongoTemplate.insert(jsonToJsonNode,"dreamData");
        } catch (Exception e) {
            e.printStackTrace();
        }finally{
            try {
                response.close();
                httpClient.close();
            } catch (Exception e2) {
                e2.printStackTrace();
            }
        }
    }

*/


}
