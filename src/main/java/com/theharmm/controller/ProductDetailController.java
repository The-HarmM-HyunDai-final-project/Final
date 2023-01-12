package com.theharmm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.theharmm.dto.product.ProductDetailDTO;
import com.theharmm.service.ProductDetailService;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/products/*")
@RequiredArgsConstructor
public class ProductDetailController {
	
	@Autowired
	ProductDetailService productDetailService;
	
	
	@GetMapping("/{pid}")
	public String selectProductDetail(@PathVariable int pid,Model model) {
		log.info("selectProductDetail 실행");
		
		ProductDetailDTO productDetailDTO = productDetailService.selectProductDetail(pid);
		
		log.info("상품정보 : "+productDetailDTO.toString());
		//session.setAttribute("totalRows", totalRows);
		model.addAttribute("productDetailDTO", productDetailDTO);

		return "product/productdetail";
	}
}
