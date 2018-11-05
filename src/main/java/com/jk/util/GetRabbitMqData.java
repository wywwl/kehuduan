
// IntelliJ API Decompiler stub source generated from a class file
// Implementation of methods is not available

package com.jk.util;


import org.springframework.amqp.rabbit.annotation.RabbitHandler;
import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.stereotype.Component;

@Component
@RabbitListener(queues = "A1804")
public class GetRabbitMqData {
    @RabbitHandler
    public void getMsg(String msg) {
        System.out.println(msg);
    }
}