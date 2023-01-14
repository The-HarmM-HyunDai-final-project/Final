package com.theharmm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/buy/*")
@RequiredArgsConstructor
public class BuyController {

	@GetMapping("/{pid}")
	 public String selectProductPrice(@PathVariable int pid, Model model) {
		log.info("selectProductPrice 실행");
		return "";
	}
}
