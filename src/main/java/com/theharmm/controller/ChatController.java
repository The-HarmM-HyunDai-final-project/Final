package com.theharmm.controller;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.theharmm.security.domain.CustomUser;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class ChatController {

	@RequestMapping(value = "/chat", method = RequestMethod.GET)
	public void Chat(Model model) {
		CustomUser user = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		log.info("==================================");
		log.info("@ChatController, GET Chat / Username : " + user.getUsername());
		
		model.addAttribute("userid", user.getUsername());
		//return "chat";
	}
}
