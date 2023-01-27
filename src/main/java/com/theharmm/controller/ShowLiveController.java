
package com.theharmm.controller;

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
@RequestMapping("/showlive/*")
@Log4j
public class ShowLiveController {

	@Autowired
	private ShowLiveService showLiveService;
	
	@RequestMapping(value = "/{roomNo}", method = RequestMethod.GET)
	public String ShowLiveRoomEnter(Model model, @PathVariable("roomNo") String roomNo , HttpSession session) {
		CustomUser user = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		user.setRoomNo(roomNo);
		//세션에 들어온 방번호 지우기
		session.setAttribute("roomNo", roomNo);
		
		log.info("==================================");
		log.info("@ChatController, GET Chat / Username : " + user.getUsername());
		log.info(roomNo + " 방번호");
		
		ShowLiveChannelDTO channel = showLiveService.getChannelDTOByRoomNo(roomNo);
		if(channel == null) {
			return "showlive/showlivenoroom";
		}
		
		model.addAttribute("userid", user.getUsername());
		model.addAttribute("channelDTO", channel);
		
		return "showlive/showliveroom";
	}
	
	@RequestMapping(value = "/showlivenoroom", method = RequestMethod.GET)
	public String ShowLiveRoomEnterError(HttpSession session) {
		log.warn("생성되지 않은 방을 요청하셧네요 ...");
		return "showlive/showlivenoroom";
	}
	
}

