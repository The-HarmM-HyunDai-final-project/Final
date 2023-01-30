//package com.theharmm.controller;
//
//import java.util.List;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.PathVariable;
//import org.springframework.web.bind.annotation.RequestMapping;
//
//import com.theharmm.domain.KeywordDTO;
//import com.theharmm.service.KeywordService;
//import com.theharmm.service.ProductDetailService;
//
//import lombok.RequiredArgsConstructor;
//import lombok.extern.log4j.Log4j;

//@Log4j
//@Controller
//@RequestMapping("/products/*")
//@RequiredArgsConstructor
//public class KeywordController {
//
//	@Autowired
//	KeywordService keywordService;
//	
//	@GetMapping("/{pid}")
//	public String selectKeywordBest(@PathVariable int pid,Model model) {
//		
//		//키워드 베스트 가져오기 (5개까지 가져오고, 대표 키워드는 3가지로 한다) 
//		//List<KeywordDTO> keywordBest = keywordService.selectKeywordBest(pid);  
//		
//		return "product/productdetail";
//	}
//	
//}
