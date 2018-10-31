
// IntelliJ API Decompiler stub source generated from a class file
// Implementation of methods is not available

package com.jk.util;

@org.springframework.stereotype.Component
@org.springframework.amqp.rabbit.annotation.RabbitListener(queues = {"A1804"})
public class GetRabbitMqData {
    public GetRabbitMqData() { /* compiled code */ }

    @org.springframework.amqp.rabbit.annotation.RabbitHandler
    public void getMsg(String msg) { /* compiled code */ }
}