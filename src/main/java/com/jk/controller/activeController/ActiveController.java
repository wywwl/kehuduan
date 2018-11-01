package com.jk.controller.activeController;

import com.jk.service.activeService.ActiveService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 王玉荣
 * 这是活动的模块
 */
@RequestMapping("active")
@Controller
public class ActiveController {

    @Autowired
    private ActiveService activeService;




}
