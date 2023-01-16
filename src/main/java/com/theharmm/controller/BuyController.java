package com.theharmm.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

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
@RequestMapping("/buy/*")
@RequiredArgsConstructor
public class BuyController {
	
	//상품정보를 가져오기 때문에 buyservice가 아닌 productDetailService의 메서드를 함께 사용
	@Autowired
	ProductDetailService productDetailService;

	@GetMapping("/select/{pid}")
	 public String selectBuyProductSize(@PathVariable int pid,@RequestParam(required = false) String size, Model model) {
		log.info("selectBuyProductSize 실행");
		ProductDetailDTO productDetailDTO = productDetailService.selectProductDetail(pid);
		List<ProductSizeDTO> productSizeList = productDetailService.selectProductSizeList(productDetailDTO);
		log.info("productDetailDTO : "+productDetailDTO.toString());
		log.info("productSizeList : "+ productSizeList.toString());
		
		model.addAttribute("productDetailDTO",productDetailDTO);
		model.addAttribute("productSizeList",productSizeList);
		
		
		return "product/buy_select";
	}
	
	@GetMapping("/{pid}")
	 public String buyProduct(@PathVariable int pid,@RequestParam String size, Model model) {
		log.info("buyProduct 실행");
		ProductDetailDTO productDetailDTO = productDetailService.selectProductDetail(pid);
		
		Map<String,Object> productInfoMap = new HashMap<String,Object>();
		productInfoMap.put("size", size);
		productInfoMap.put("pid", productDetailDTO.getPid());
		ProductSizeDTO productSizeDTO = productDetailService.selectProductSize(productInfoMap);
		
		log.info("productDetailDTO : "+productDetailDTO.toString());
		log.info("productSizeDTO : "+ productSizeDTO.toString());
		
		model.addAttribute("productDetailDTO",productDetailDTO);
		model.addAttribute("productSizeDTO",productSizeDTO);
		
		return "product/buy_buy";
	}
	
	@GetMapping("/order/{pid}")
	 public String orderProduct(@PathVariable int pid,@RequestParam String size,@RequestParam String type,@RequestParam int price,
			 HttpSession session,Model model) {
		log.info("orderProduct 실행");
		
		if(session.getAttribute("user")==null){
            return "redirect:/login";
        }
		
		ProductDetailDTO productDetailDTO = productDetailService.selectProductDetail(pid);
		
		Map<String,Object> productInfoMap = new HashMap<String,Object>();
		productInfoMap.put("size", size);
		productInfoMap.put("pid", productDetailDTO.getPid());
		ProductSizeDTO productSizeDTO = productDetailService.selectProductSize(productInfoMap);
		
		model.addAttribute("productDetailDTO",productDetailDTO);
		model.addAttribute("productSizeDTO",productSizeDTO);
		model.addAttribute("price",price);
		model.addAttribute("type",type);
		
		return "product/buy_order";
	}
	

}
