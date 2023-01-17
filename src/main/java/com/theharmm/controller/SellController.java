package com.theharmm.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.theharmm.domain.ProductDetailDTO;
import com.theharmm.domain.ProductSizeDTO;
import com.theharmm.service.ProductDetailService;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/sell/*")
@RequiredArgsConstructor
public class SellController {

	@Autowired
	ProductDetailService productDetailService;
	
    
	//판매 - 상품사이즈 리스트 띄우기
		@GetMapping("/select/{pid}")
		 public String selectSellProductSize(@PathVariable int pid,@RequestParam(required = false) String size, Model model) {
			log.info("selectSellProductSize 실행");
			ProductDetailDTO productDetailDTO = productDetailService.selectProductDetail(pid);
			List<ProductSizeDTO> productSizeList = productDetailService.selectProductSizeList(productDetailDTO);
			log.info("productDetailDTO : "+productDetailDTO.toString());
			log.info("productSizeList : "+ productSizeList.toString());
			
			model.addAttribute("productDetailDTO",productDetailDTO);
			model.addAttribute("productSizeList",productSizeList);
			
			
			return "product/sell_select";
		}
		
		//즉시판매, 판매입찰 선택 
		@GetMapping("/{pid}")
		 public String buyProduct(@PathVariable int pid,@RequestParam String size, Model model) {
			log.info("buyProduct 실행");
			ProductDetailDTO productDetailDTO = productDetailService.selectSellProductDetail(pid);
			
			Map<String,Object> productInfoMap = new HashMap<String,Object>();
			productInfoMap.put("size", size);
			productInfoMap.put("pid", productDetailDTO.getPid());
			ProductSizeDTO productSizeDTO = productDetailService.selectSellProductSize(productInfoMap);// pid, size에 해당하는 상품 정보 가져오기 
			
			log.info("productDetailDTO : "+productDetailDTO.toString());
			log.info("productSizeDTO : "+ productSizeDTO.toString());
			
			model.addAttribute("productDetailDTO",productDetailDTO);
			model.addAttribute("productSizeDTO",productSizeDTO);
			
			return "product/sell_sell";
		}
		
		
		
		
		
}
