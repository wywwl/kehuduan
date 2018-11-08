package com.jk;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ImportResource;
@SpringBootApplication
@ImportResource(value={"classpath:spring-dubbo-consumer.xml"})
    public class KehuduanApplication {

    public static void main(String[] args) {
        SpringApplication.run(KehuduanApplication.class,args);
    }

}
