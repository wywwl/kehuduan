package com.jk;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.ImportResource;
import org.springframework.amqp.core.Queue;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ImportResource;

@SpringBootApplication
@ImportResource(value = {"classpath:spring-dubbo-consumer.xml"})
@ComponentScan(basePackages = "com.jk.service")

public class KehuduanApplication {

    public static void main(String[] args) {
        SpringApplication.run(KehuduanApplication.class, args);
    }

    @Bean
    public Queue getQueue(){
        return new Queue("A1804");
    }

}
