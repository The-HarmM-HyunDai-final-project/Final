package com.theharmm.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.theharmm.service.ChatbotService;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class ChatBotController {
   
   @Autowired
   ChatbotService chatbotService;
   
   @RequestMapping(value = "/chatbotSend")
   @ResponseBody
    public Map<String,Object> chatbotSend(@RequestParam("inputText") String inputText) {
        String msg = "";
        String button ="";
    	log.info("chatbotsend 실행" + msg);
        msg = chatbotService.main(inputText);
        log.info("전체 msg" + msg);
        
        Calendar cal = Calendar.getInstance();
	    cal.setTime(new Date());
	    DateFormat df = new SimpleDateFormat("a hh:mm");
	    String chatTime = df.format(cal.getTime());
        

        if(msg.equals("상담 직원을 연결해 드릴까요")) {
        	button = "<button id='connectAdmin' class='btn_division' style='background-color:#48665a;'>상담원 연결하기</button>";
        }
       
        Map<String,Object> map = new HashMap<>();
        map.put("msg",msg);
        map.put("chatTime",chatTime);
        map.put("button",button);
        
        log.info(button);
        
        String chatbotMessage =  "";
		/*
		 * String jsonString = ""; try { ObjectMapper mapper = new ObjectMapper();
		 * jsonString = mapper.writeValueAsString(map); }catch(Exception e) {
		 * 
		 * }
		 */
		

		
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

        return map;
    }
}