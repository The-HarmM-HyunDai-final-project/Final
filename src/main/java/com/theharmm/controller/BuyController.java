
package com.theharmm.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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

	//구매 - 상품사이즈 리스트 띄우기
	@GetMapping("/select/{pid}")
	 public String selectBuyProductSize(@PathVariable int pid,@RequestParam(required = false) String size, Model model) {
		log.info("selectBuyProductSize 실행");
		ProductDetailDTO productDetailDTO = productDetailService.selectProductDetail(pid);
		List<ProductSizeDTO> productSaleSizeList = productDetailService.selectSaleProductSizeList(productDetailDTO);
		log.info("productDetailDTO : "+productDetailDTO.toString());
		log.info("productSaleSizeList : "+ productSaleSizeList.toString());
		
		model.addAttribute("productDetailDTO",productDetailDTO);
		model.addAttribute("productSaleSizeList",productSaleSizeList);
		
		
		return "product/buy_select";
	}
	
	//즉시구매, 구매입찰 선택 
	@GetMapping("/{pid}")
	 public String buyProduct(@PathVariable int pid,@RequestParam String size, Model model) {
		log.info("buyProduct 실행");
		int shippingFee = 3000;
		int fee = 30000;
		
		ProductDetailDTO productDetailDTO = productDetailService.selectProductDetail(pid);
		
		Map<String,Object> productInfoMap = new HashMap<String,Object>();
		productInfoMap.put("size", size);
		productInfoMap.put("pid", productDetailDTO.getPid());
		ProductSizeDTO productBuySizeDTO = productDetailService.selectBuyProductSize(productInfoMap);// pid, size에 구매입찰에 해당하는 상품 정보 가져오기 
		ProductSizeDTO productSaleSizeDTO = productDetailService.selectSaleProductSize(productInfoMap);//해당 사이즈 pid에 해당하는 판매입찰 상품 정보
		log.info("productDetailDTO : "+productDetailDTO.toString());
		log.info("productBuySizeDTO : "+ productBuySizeDTO.toString());//사이즈에 대한 판매정보
		log.info("productSaleSizeDTO : "+productSaleSizeDTO.toString());//사이즈에 대한 구매정보
		model.addAttribute("shippingFee",shippingFee);
		model.addAttribute("productDetailDTO",productDetailDTO);
		model.addAttribute("productSaleSizeDTO",productSaleSizeDTO);
		model.addAttribute("productBuySizeDTO",productBuySizeDTO);
		return "product/buy_buy";
	}
	
	// 즉시구매 혹은 구매입찰 중 타입별로 구매하기로 넘어옴
	@GetMapping("/order/{pid}")
	 public String orderProduct(@PathVariable int pid,@RequestParam String size,@RequestParam String type,@RequestParam int price,
			 Model model) {
		log.info("orderProduct 실행");
		int shippingFee = 3000;
		int fee = 30000;
	

		
		ProductDetailDTO productDetailDTO = productDetailService.selectProductDetail(pid);
		
		Map<String,Object> productInfoMap = new HashMap<String,Object>();
		productInfoMap.put("size", size);
		productInfoMap.put("pid", productDetailDTO.getPid());
		ProductSizeDTO productSaleSizeDTO = productDetailService.selectSaleProductSize(productInfoMap);
		
		model.addAttribute("productDetailDTO",productDetailDTO);// 상품상세정보
		model.addAttribute("productSaleSizeDTO",productSaleSizeDTO);//상품사이즈 
		
		model.addAttribute("type",type);// 타입 
		model.addAttribute("shippingFee",shippingFee);
		
		
		if(type.equals("즉시구매")) {
			price = productSaleSizeDTO.getPrice();
			fee = (int)(productSaleSizeDTO.getPrice()*0.015);
		}
		else if(type.equals("구매입찰")) {
			fee =(int)(productSaleSizeDTO.getPrice()*0.03);
		}
		
		model.addAttribute("fee",fee);
		model.addAttribute("price",price);
		model.addAttribute("totalPrice",price+fee+shippingFee);
		
		if(type.equals("즉시구매")) {
	
			return "product/buy_order";
		}
		else if(type.equals("구매입찰")){
			
			return "product/buy_bid";
		}
		else {
			//추후 에러페이지로 변경필요
			return "product/buy_bid";
		}

	}
	
	//결제 후 넘어가는 곳 
	@PostMapping("/order")
	@ResponseBody
	 public String updateBuyOrder(@RequestParam String imp_uid, @RequestParam String type, @RequestParam String merchant_uid, @RequestParam String buyer_email,@RequestParam int pid,@RequestParam int totalPrice,@RequestParam String model_size,@RequestParam int saleid) {
		log.info("updateBuyOrder 실행");
		log.info(imp_uid + merchant_uid + buyer_email + pid+totalPrice+model_size+saleid);
		
		Map<String,Object> saleInfoMap = new HashMap<String,Object>();
		saleInfoMap.put("type",type);
		//saleInfoMap.put("buyid", buyer_email);
		saleInfoMap.put("pid",pid);
		saleInfoMap.put("saleid",saleid);
		
		productDetailService.updateBuyOrder(saleInfoMap);
		
		//여기서 구매입찰로 들어온 경우는 최종가격에 수수료 제거 해줘야함 !!!!!! 
		
//		if(type.equals("즉시구매")) {
//			price = productSizeDTO.getPrice();
//			fee = (int)(productSizeDTO.getPrice()*0.015);
//		}
//		else if(type.equals("구매입찰")) {
//			fee =(int)(productSizeDTO.getPrice()*0.03);
//		}
//		
		return "success";
	}

}

