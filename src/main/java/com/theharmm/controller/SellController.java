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

import com.fasterxml.jackson.databind.ObjectMapper;
import com.theharmm.domain.AccountDTO;
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
@RequestMapping("/sell/*")
@RequiredArgsConstructor
public class SellController {

	@Autowired
	ProductDetailService productDetailService;
	
	@Autowired
	MemberInfoService memberInfoService;
	
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
			CustomUser user = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			MemberVO memberInfo = user.getMember();
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
			model.addAttribute("memberInfo",memberInfo);
			
			return "product/sell_sell";
		}
		
		
		// 즉시판매 혹은 판매입찰 중 타입별로 구매하기로 넘어옴
		@GetMapping("/order/{pid}")
		 public String orderSellProduct(@PathVariable int pid,@RequestParam String size,@RequestParam String type,@RequestParam int price,@RequestParam(required=false,defaultValue = "0") int dDay,
				 Model model) {
			log.info("orderSellProduct 실행");
			CustomUser user = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			MemberVO memberInfo = user.getMember();
			
			Map<String,Object> memberInfoMap = new HashMap<String,Object>();
			memberInfoMap.put("member_email",memberInfo.getMember_email());
			MemberAddressDTO addressDTO = memberInfoService.selectMemberMainAddress(memberInfoMap);
			AccountDTO accountDTO = memberInfoService.selectMemberMainAccount(memberInfoMap);
			model.addAttribute("memberDTO", memberInfo);
			model.addAttribute("addressDTO", addressDTO);
			model.addAttribute("accountDTO", accountDTO);
			log.info("MemberDTO : "+ user);
			log.info("AddressDTO : "+ addressDTO);
			log.info("AccountDTO : "+ accountDTO);
			
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
			
			Calendar cal = Calendar.getInstance();
		    cal.setTime(new Date());
		    DateFormat df = new SimpleDateFormat("yyyy/MM/dd");
		    cal.add(Calendar.DATE, dDay);
		    String bidDate = df.format(cal.getTime());
			
			if(type.equals("즉시판매")) {
				fee = (int)(productBuySizeDTO.getPrice()*0.025);
			}
			else {
				fee = (int)(price*0.025);
			}
			
			
		
			model.addAttribute("fee",fee);
			model.addAttribute("price",price);
			model.addAttribute("totalPrice",price-fee-shippingFee);
			model.addAttribute("dDay",dDay);
			model.addAttribute("bidDate",bidDate);

			
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
		
		//계좌등록
		@PostMapping(value="/regAccount", produces = "application/json; charset=UTF-8")
		@ResponseBody
		 public String regAccount(@RequestParam String member_email, @RequestParam String bank_name, @RequestParam String account_number, @RequestParam String account_owner) {
			log.info("regAccount 실행");
			CustomUser user = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			MemberVO memberInfo = user.getMember();
			
			Map<String,Object> memberInfoMap = new HashMap<>();
			memberInfoMap.put("member_email",member_email);
			log.info(member_email+bank_name+account_number+account_owner);
			
			
			AccountDTO accountDTO = new AccountDTO();
			accountDTO.setMember_email(member_email);
			accountDTO.setBank_name(account_owner);
			accountDTO.setBank_number(account_number);
			accountDTO.setBank(bank_name);
			
			
			memberInfoService.mergeAccount(accountDTO);
			String jsonString = "";
			try {
			ObjectMapper mapper = new ObjectMapper(); 
			jsonString = mapper.writeValueAsString(memberInfoService.selectMemberMainAccount(memberInfoMap));
			}catch(Exception e) {
				
			}
			

			return jsonString;
		}
		
		
		//판매완료 
		@GetMapping("/complete")
		 public String sellProductComplete(@RequestParam int pid,@RequestParam int buyid,
				 @RequestParam int totalPrice,@RequestParam String accountNumber, @RequestParam int price,
				 @RequestParam int fee,Model model) {
			log.info("sellProductComplete 실행");
			CustomUser user = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			MemberVO memberInfo = user.getMember();
			
			//상품정보 가져오기
			ProductDetailDTO productDetailDTO = productDetailService.selectProductDetail(pid);
			
			//계좌정보 가져오기
			Map<String,Object> accountInfoMap = new HashMap<String,Object>();
			accountInfoMap.put("member_email",memberInfo.getMember_email());
			accountInfoMap.put("bank_number",accountNumber);
			AccountDTO accountDTO = memberInfoService.selectMemberAccount(accountInfoMap);
			
			//구매입찰 데이터 업데이트 - 판매완료 처리
			Map<String,Object> buyInfoMap = new HashMap<String,Object>();
			//saleInfoMap.put("saleid", user.getMember_email());
			buyInfoMap.put("pid",pid);
			buyInfoMap.put("buyid",buyid);
			productDetailService.updateSaleOrder(buyInfoMap);
			
			model.addAttribute("productDetailDTO", productDetailDTO);
			model.addAttribute("price", price);
			model.addAttribute("fee", fee);
			model.addAttribute("totalPrice", totalPrice);
			
			
			return "product/sell_complete";
		}
		
		//판매입찰
		@GetMapping("/bidComplete")
		 public String sellBidProductComplete(@RequestParam int pid,@RequestParam int totalPrice,@RequestParam String accountNumber,
				 @RequestParam int price,@RequestParam int fee,@RequestParam String size,@RequestParam int dDay,Model model) {
			log.info("sellBidProductComplete 실행");
			CustomUser user = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			MemberVO memberInfo = user.getMember();
			
			//상품정보 가져오기
			ProductDetailDTO productDetailDTO = productDetailService.selectProductDetail(pid);
			
			//계좌정보 가져오기
			Map<String,Object> accountInfoMap = new HashMap<String,Object>();
			accountInfoMap.put("member_email",memberInfo.getMember_email());
			accountInfoMap.put("bank_number",accountNumber);
			AccountDTO accountDTO = memberInfoService.selectMemberAccount(accountInfoMap);
			
			//판매입찰 데이터 등록(insert)
			Map<String,Object> saleInfoMap = new HashMap<String,Object>();
			saleInfoMap.put("pid",pid);
			saleInfoMap.put("member_email",memberInfo.getMember_email());
			saleInfoMap.put("price",price);
			saleInfoMap.put("size_type",size);
			saleInfoMap.put("dDay",dDay);
			productDetailService.insertSaleOrder(saleInfoMap);
			
			Calendar cal = Calendar.getInstance();
		    cal.setTime(new Date());
		    DateFormat df = new SimpleDateFormat("yyyy/MM/dd");
		    cal.add(Calendar.DATE, dDay);
		    String bidDate = df.format(cal.getTime());
			
			model.addAttribute("productDetailDTO", productDetailDTO);
			model.addAttribute("price", price);
			model.addAttribute("fee", fee);
			model.addAttribute("totalPrice", totalPrice);
			model.addAttribute("dDay", dDay);
			model.addAttribute("bidDate", bidDate);
			
			return "product/sell_bid_complete";
		}

		
		
}
