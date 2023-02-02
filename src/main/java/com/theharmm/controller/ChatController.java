package com.theharmm.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.theharmm.domain.ShowLiveChannelDTO;
import com.theharmm.security.domain.CustomUser;
import com.theharmm.service.ShowLiveService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class ChatController {
	
	@Autowired
	private ShowLiveService showLiveService;

	
	@RequestMapping(value = "/chat/{roomNo}", method = RequestMethod.GET)
	public String Chat(Model model, @PathVariable("roomNo") String roomNo , HttpSession session) {
		CustomUser user = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		ShowLiveChannelDTO channel = showLiveService.getChannelDTOByRoomNo(roomNo);

		log.warn(channel.getRestricted_grade());
		user.setRoomNo(roomNo);
		//세션에 들어온 방번호 지우기
		session.setAttribute("roomNo", roomNo);
		
		log.info("==================================");
		log.info("@ChatController, GET Chat / Username : " + user.getUsername());
		log.info(roomNo + " 방번호");
		
		model.addAttribute("userid", user.getUsername());
		
		return "chat";
	}
}
