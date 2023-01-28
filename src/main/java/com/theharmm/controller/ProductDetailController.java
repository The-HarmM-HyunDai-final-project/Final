package com.theharmm.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.theharmm.domain.BuyDTO;
import com.theharmm.domain.PostVO;
import com.theharmm.domain.ProductDetailDTO;
import com.theharmm.domain.SellDTO;
import com.theharmm.service.PostService;
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
	
	@Autowired
	PostService postService;
	
	
	@GetMapping("/{pid}")
	public String selectProductDetail(@PathVariable int pid,Model model) {
		log.info("selectProductDetail 실행");
		
		ProductDetailDTO productDetailDTO = productDetailService.selectProductDetail(pid);
		//판매버튼
		BuyDTO buyDTO = productDetailService.selectMinBuyProductPrice(pid);
		//구매버튼 
		SellDTO sellDTO = productDetailService.selectMinSellProductPrice(pid);

		
		//긍정리뷰
		List<PostVO> positivePostList = postService.selectPositivePostList(pid);
		
		//부정리뷰
		List<PostVO> negativePostList = postService.selectNegativePostList(pid);

	
		//체결거래 
		List<BuyDTO> allSignContractList = productDetailService.selectAllSignContract(pid);
		//판매입찰 
		List<SellDTO> allSellBidList = productDetailService.selectAllSellBid(pid);
		//구매입찰 
		List<BuyDTO> allBuyBidList = productDetailService.selectAllBuyBid(pid);
		
		log.info("상품정보 : "+productDetailDTO.toString());
		log.info("긍정리뷰 : "+positivePostList.toString());
		log.info("부정리뷰 : "+negativePostList.toString());
		//session.setAttribute("totalRows", totalRows);
		model.addAttribute("productDetailDTO", productDetailDTO);
		model.addAttribute("buyDTO", buyDTO);
		model.addAttribute("sellDTO", sellDTO);
		model.addAttribute("positivePostList", positivePostList);
		model.addAttribute("negativePostList", negativePostList);
		model.addAttribute("allSignContractList", allSignContractList);
		model.addAttribute("allSellBidList", allSellBidList);
		model.addAttribute("allBuyBidList", allBuyBidList);
		return "product/productdetail";
	}
	
	
}
