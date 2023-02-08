
package com.theharmm.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.theharmm.domain.MemberAddressDTO;
import com.theharmm.domain.MemberVO;
import com.theharmm.domain.ProductDetailDTO;
import com.theharmm.domain.ProductSizeDTO;
import com.theharmm.security.domain.CustomUser;
import com.theharmm.service.MemberInfoService;
import com.theharmm.service.ProductDetailService;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;
/*신미림 작성*/
@Log4j
@Controller
@RequestMapping("/buy/*")
@RequiredArgsConstructor
public class BuyController {
	
	//상품정보를 가져오기 때문에 buyservice가 아닌 productDetailService의 메서드를 함께 사용
	@Autowired
	ProductDetailService productDetailService;
	
	@Autowired
	MemberInfoService memberInfoService;

	//구매 - 상품사이즈 리스트 띄우기
	@GetMapping("/select/{pid}")
	 public String selectBuyProductSize(@PathVariable int pid,@RequestParam(required = false) String size, Model model) {
		log.info("selectBuyProductSize 실행");
		//CustomUser user = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
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
		CustomUser user = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
	    MemberVO memberInfo = user.getMember();
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
		model.addAttribute("memberInfo",memberInfo);
		return "product/buy_buy";
	}
	
	// 즉시구매 혹은 구매입찰 중 타입별로 구매하기로 넘어옴
	@GetMapping("/order/{pid}")
	 public String orderProduct(@PathVariable int pid,@RequestParam String size,@RequestParam String type,@RequestParam int price,
			 @RequestParam(required=false,defaultValue = "0") int dDay,Model model) {
		log.info("orderProduct 실행");
		int shippingFee = 3000;
		int fee = 30000;
		CustomUser user = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		MemberVO memberInfo = user.getMember();
		
		Map<String,Object> memberInfoMap = new HashMap<String,Object>();
		memberInfoMap.put("member_email",memberInfo.getMember_email());
		MemberAddressDTO addressDTO = memberInfoService.selectMemberMainAddress(memberInfoMap);
		model.addAttribute("addressDTO", addressDTO);
		log.info("AddressDTO : "+ addressDTO);
		
		ProductDetailDTO productDetailDTO = productDetailService.selectProductDetail(pid);
		
		Map<String,Object> productInfoMap = new HashMap<String,Object>();
		productInfoMap.put("size", size);
		productInfoMap.put("pid", productDetailDTO.getPid());
		ProductSizeDTO productSaleSizeDTO = productDetailService.selectSaleProductSize(productInfoMap);
		
		model.addAttribute("productDetailDTO",productDetailDTO);// 상품상세정보
		model.addAttribute("productSaleSizeDTO",productSaleSizeDTO);//상품사이즈 
		
		model.addAttribute("type",type);// 타입 
		model.addAttribute("shippingFee",shippingFee);
		
		Calendar cal = Calendar.getInstance();
	    cal.setTime(new Date());
	    DateFormat df = new SimpleDateFormat("yyyy/MM/dd");
	    cal.add(Calendar.DATE, dDay);
	    String bidDate = df.format(cal.getTime());
	    
		if(type.equals("즉시구매")) {
			price = productSaleSizeDTO.getPrice();
			fee = (int)(productSaleSizeDTO.getPrice()*0.015);
		}
		else if(type.equals("구매입찰")) {
			fee =(int)(price*0.03);
		}
		
		model.addAttribute("fee",fee);
		model.addAttribute("price",price);
		model.addAttribute("totalPrice",price+fee+shippingFee);
		model.addAttribute("dDay",dDay);
		model.addAttribute("bidDate",bidDate);
		
		int paySeq = productDetailService.selectPaySeqNextVal();
		
		model.addAttribute("paySeq",paySeq);
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
		CustomUser user = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		MemberVO memberInfo = user.getMember();
		Map<String,Object> saleInfoMap = new HashMap<String,Object>();
		saleInfoMap.put("type",type);
		//saleInfoMap.put("buyid", buyer_email);
		saleInfoMap.put("pid",pid);
		saleInfoMap.put("saleid",saleid);
		
		//판매입찰 데이터 업데이트 - 구매완료 처리
		productDetailService.updateBuyOrder(saleInfoMap);// 판매입찰로 올라온 데이터가 진행완료 처리 되는거임 
		
		
		return "success";
	}
	
	//결제 후 입찰 넘어가는 곳 
	@PostMapping("/bid")
	@ResponseBody
	 public String insertBidBuyOrder(@RequestParam String imp_uid, @RequestParam String type, @RequestParam String merchant_uid, @RequestParam String buyer_email,@RequestParam int pid,
			 @RequestParam int price,@RequestParam int totalPrice,@RequestParam String model_size,@RequestParam int dDay) {
		log.info("insertBidBuyOrder 실행");
		log.info(imp_uid + merchant_uid + buyer_email + pid+totalPrice+model_size);
		CustomUser user = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		MemberVO memberInfo = new MemberVO();
		
		//구매입찰 데이터 등록(insert)
		Map<String,Object> buyInfoMap = new HashMap<String,Object>();
		buyInfoMap.put("type",type);
		buyInfoMap.put("member_email",memberInfo.getMember_email());
		buyInfoMap.put("pid",pid);
		buyInfoMap.put("price",price);
		buyInfoMap.put("dDay",dDay);
		buyInfoMap.put("size_type",model_size);
		productDetailService.insertBuyOrder(buyInfoMap);		
		
	
		return "success";
	}
	
	//구매완료 
	@GetMapping("/complete")
	 public String buyProductComplete(@RequestParam int pid,@RequestParam int saleid,
			 @RequestParam int totalPrice, @RequestParam int price,
			 @RequestParam int fee,@RequestParam int shippingFee, Model model) {
		log.info("buyProductComplete 실행");
		CustomUser user = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		MemberVO memberInfo = new MemberVO();
		
		
		//상품정보 가져오기
		ProductDetailDTO productDetailDTO = productDetailService.selectProductDetail(pid);
		
		
		
		model.addAttribute("productDetailDTO", productDetailDTO);
		model.addAttribute("price", price);
		model.addAttribute("fee", fee);
		model.addAttribute("totalPrice", totalPrice);
		model.addAttribute("shippingFee", shippingFee);
		
		
		return "product/buy_complete";
	}
	
	//구매입찰
		@GetMapping("/bidComplete")
		 public String buyBidProductComplete(@RequestParam int pid,
				 @RequestParam int totalPrice, @RequestParam int price,
				 @RequestParam int fee,@RequestParam int shippingFee,@RequestParam String size,
				 @RequestParam int dDay, Model model) {
			log.info("buyBidProductComplete 실행");
			CustomUser user = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			MemberVO memberInfo = new MemberVO();
			
			Calendar cal = Calendar.getInstance();
		    cal.setTime(new Date());
		    DateFormat df = new SimpleDateFormat("yyyy/MM/dd");
		    cal.add(Calendar.DATE, dDay);
		    String bidDate = df.format(cal.getTime());
			
			//상품정보 가져오기
			ProductDetailDTO productDetailDTO = productDetailService.selectProductDetail(pid);
			
		
			model.addAttribute("productDetailDTO", productDetailDTO);
			model.addAttribute("price", price);
			model.addAttribute("fee", fee);
			model.addAttribute("totalPrice", totalPrice);
			model.addAttribute("dDay", dDay);
			model.addAttribute("bidDate", bidDate);
			model.addAttribute("shippingFee", shippingFee);
			
			
			return "product/buy_bid_complete";
		}


}

