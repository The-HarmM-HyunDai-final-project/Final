package com.theharmm.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class HomeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);

		logger.info("hi");
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

		String formattedDate = dateFormat.format(date);

		model.addAttribute("serverTime", formattedDate);

		return "main";
	}
	
	
	@GetMapping("/test")
	public String test() {
		return "test";
	}
	
	@GetMapping("/test2")
	public String test2() {
		return "test2";
	}
	
	@GetMapping("/test3")
	public String test3() {
		return "test3";
	}
	
	@GetMapping("/temp")
	public void temp() {
		log.warn("임시요");
	}
	
	@GetMapping("/home")
	public void home() {
		log.warn("home임시요");
	}
}