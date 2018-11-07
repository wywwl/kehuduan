package com.jk;

import org.springframework.amqp.core.Queue;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ImportResource;
import org.springframework.scheduling.annotation.EnableScheduling;


@SpringBootApplication
@ImportResource(value = {"classpath:spring-dubbo-consumer.xml"})
@EnableScheduling
public class KehuduanApplication {

    public static void main(String[] args) {
        SpringApplication.run(KehuduanApplication.class, args);
    }


    @Bean
    public Queue getQueue(){
        return new Queue("A1804");
    }








}
