package com.theharmm.controller;

import javax.servlet.http.HttpSession;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.socket.WebSocketSession;

import com.theharmm.security.domain.CustomUser;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class ChatController {

	@RequestMapping(value = "/chat/{roomNo}", method = RequestMethod.GET)
	public String Chat(Model model, @PathVariable("roomNo") String roomNo, HttpSession session) {
		CustomUser user = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		//user.setRoomNo(roomNo);
		
		//session.setAttribute(name, value);
		
		log.info("==================================");
		log.info("@ChatController, GET Chat / Username : " + user.getUsername());
		log.info(roomNo + "번방 입장");
		
		
	
		model.addAttribute("userid", user.getUsername());
		model.addAttribute("roomNo", roomNo);
		
		return "chat";
	}
}
