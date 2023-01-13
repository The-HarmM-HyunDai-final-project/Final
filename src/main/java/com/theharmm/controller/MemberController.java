package com.theharmm.controller;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.log4j.Log4j;

@Log4j
@RequestMapping("/member/*")
@ControllerAdvice
public class MemberController {

	@GetMapping("/loginpage")
	public void LoginPage() {
		
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public void LoginAction() {
		
	}
	
	@GetMapping("/myLogout")
	public void logoutGET() {
		log.info("custom logout");
	}

	
	@GetMapping("/my")
	public String MyPage() {
		return "my";
	}
}
