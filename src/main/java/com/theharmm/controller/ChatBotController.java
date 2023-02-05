package com.theharmm.controller;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.theharmm.service.ChatbotService;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class ChatBotController {
	
	@Autowired
	ChatbotService chatbotService;
	
	@RequestMapping(value = "/chatbotSend")
	@ResponseBody
    public String chatbotSend(@RequestParam("inputText") String inputText) {
        String msg = "";
        log.info("chatbotsend 실행" + msg);
        msg = chatbotService.main(inputText);

        log.info("전체 msg" + msg);
        String chatbotMessage =  "";
        
		/*
		 * JSONObject jsonObject = new JSONObject(msg); JSONArray bubbles =
		 * jsonObject.getJSONArray("bubbles");
		 * 
		 * for (int i =0; i < bubbles.length(); i++){ JSONObject bubble =
		 * bubbles.getJSONObject(i);
		 * 
		 * String chatType = bubble.getString("type");
		 * 
		 * if (chatType.equals("text")){
		 * 
		 * chatbotMessage = bubble.getJSONObject("data").getString("description");
		 * 
		 * }else if (chatType.equals("template")) {
		 * 
		 * chatbotMessage =
		 * bubble.getJSONObject("data").getJSONObject("cover").getJSONObject("data").
		 * getString("description");
		 * 
		 * }else { chatbotMessage = ""; }
		 * 
		 * log.info("chatbotMessage"+chatbotMessage); }
		 */

        return msg;
    }
}
