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
			List<ProductSizeDTO> productBuySizeList = productDetailService.selectBuyProductSizeList(productDetailDTO);
			log.info("productDetailDTO : "+productDetailDTO.toString());
			log.info("productBuySizeList : "+ productBuySizeList.toString());
			
			model.addAttribute("productDetailDTO",productDetailDTO);
			model.addAttribute("productBuySizeList",productBuySizeList);
			
			
			return "product/sell_select";
		}
		
		//즉시판매, 판매입찰 선택 
		@GetMapping("/{pid}")
		 public String sellProduct(@PathVariable int pid,@RequestParam String size, Model model) {
			log.info("sellProduct 실행");
			ProductDetailDTO productDetailDTO = productDetailService.selectProductDetail(pid);
			
			Map<String,Object> productInfoMap = new HashMap<String,Object>();
			productInfoMap.put("size", size);
			productInfoMap.put("pid", productDetailDTO.getPid());
			ProductSizeDTO productBuySizeDTO = productDetailService.selectBuyProductSize(productInfoMap);// pid, size에 구매입찰에 해당하는 상품 정보 가져오기 
			ProductSizeDTO productSaleSizeDTO = productDetailService.selectSaleProductSize(productInfoMap);//해당 사이즈 pid에 해당하는 판매입찰 상품 정보
			log.info("productDetailDTO : "+productDetailDTO.toString());
			log.info("productBuySizeDTO : "+ productBuySizeDTO.toString());//사이즈에 대한 판매정보
			log.info("productSaleSizeDTO : "+productSaleSizeDTO.toString());//사이즈에 대한 구매정보
			
			model.addAttribute("productDetailDTO",productDetailDTO);
			model.addAttribute("productSaleSizeDTO",productSaleSizeDTO);
			model.addAttribute("productBuySizeDTO",productBuySizeDTO);
			
			return "product/sell_sell";
		}
		
		
		// 즉시판매 혹은 판매입찰 중 타입별로 구매하기로 넘어옴
		@GetMapping("/order/{pid}")
		 public String orderSellProduct(@PathVariable int pid,@RequestParam String size,@RequestParam String type,@RequestParam int price,@RequestParam(required=false,defaultValue = "0") int dDay,
				 Model model) {
			log.info("orderProduct 실행");
			int shippingFee = 0;
			int fee = 30000;
		

			
			ProductDetailDTO productDetailDTO = productDetailService.selectProductDetail(pid);
			
			Map<String,Object> productInfoMap = new HashMap<String,Object>();
			productInfoMap.put("size", size);
			productInfoMap.put("pid", productDetailDTO.getPid());
			ProductSizeDTO productBuySizeDTO = productDetailService.selectBuyProductSize(productInfoMap);
			
			model.addAttribute("productDetailDTO",productDetailDTO);// 상품상세정보
			model.addAttribute("productBuySizeDTO",productBuySizeDTO);//상품사이즈 
			
			model.addAttribute("type",type);// 타입 
			model.addAttribute("shippingFee",shippingFee);
			
			
			
			fee = (int)(productBuySizeDTO.getPrice()*0.025);
		
			model.addAttribute("fee",fee);
			model.addAttribute("price",price);
			model.addAttribute("totalPrice",price-fee-shippingFee);
			model.addAttribute("dDay",dDay);
			
			if(type.equals("즉시판매")) {
		
				return "product/sell_order";
			}
			else if(type.equals("판매입찰")){
				
				return "product/sell_bid";
			}
			else {
				//추후 에러페이지로 변경필요
				return "product/sell_bid";
			}

		}
		
		
		
}
