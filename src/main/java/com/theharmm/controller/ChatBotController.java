package com.theharmm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.theharmm.service.ChatbotService;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class ChatBotController {
	
	@Autowired
	ChatbotService chatbotService;
	
	@RequestMapping("/chatbotSend")
    public String chatbotSend(@RequestParam("inputText") String inputText) {
        String msg = "";
        log.info("chatbotsend 실행" + msg);
        msg = chatbotService.main(inputText);
        log.info(msg);
        return msg;
    }
}
