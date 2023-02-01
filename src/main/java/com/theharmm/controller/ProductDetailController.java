package com.theharmm.controller;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.theharmm.domain.BuyDTO;
import com.theharmm.domain.KeywordDTO;
import com.theharmm.domain.PostVO;
import com.theharmm.domain.ProductDTO;
import com.theharmm.domain.ProductDetailDTO;
import com.theharmm.domain.SellDTO;
import com.theharmm.service.KeywordService;
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
	
	@Autowired
    KeywordService keywordService;
	
	
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
		log.info("체결데이터 조회 : "+allSignContractList.toString());
		//session.setAttribute("totalRows", totalRows);
		model.addAttribute("productDetailDTO", productDetailDTO);

		model.addAttribute("buyDTO", buyDTO);
		model.addAttribute("sellDTO", sellDTO);
		model.addAttribute("positivePostList", positivePostList);
		model.addAttribute("negativePostList", negativePostList);
		model.addAttribute("allSignContractList", allSignContractList);
		model.addAttribute("allSellBidList", allSellBidList);
		model.addAttribute("allBuyBidList", allBuyBidList);
		
		
		//같은 브랜드 리스트 띄우기 
		List<ProductDTO> ProductBrandList = productDetailService.selectProductBrandList(pid);
		model.addAttribute("productBrandList", ProductBrandList);
		
		//긍정키워드 베스트 가져오기 (5개까지 가져오고, 대표 키워드는 3가지로 한다) 
		List<KeywordDTO> PosKeywordBestList = keywordService.selectPosKeywordBest(pid); 
		model.addAttribute("keywordBestList", PosKeywordBestList);
				
		//부정키워드 베스트 가져오기 (5개까지 가져오고, 대표 키워드는 3가지로 한다) 
		List<KeywordDTO> NegKeywordBestList = keywordService.selectNegKeywordBest(pid); 
		model.addAttribute("keywordBestList", NegKeywordBestList);

		return "product/productdetail";
	}
	
	@RequestMapping(value = "word/analysis")
	@ResponseBody
	public Set<String> analysis(@RequestParam("test") String test) throws Exception {
		
		log.info(this.getClass().getName() + ".inputForm !");
		
		//분석할 문장
		//String text = "재질이 안좋아요";
		
		//신조어 및 새롭게 생겨난 가수 및 그룹명은 제대로 된 분석이 불가능합니다.
		// 새로운 명사 단어들은 어떻게 데이터를 처리해야 할까?? => 데이터사전의 주기적인 업데이트

		Set<String> rSet = keywordService.doWordNouns(test);
		
		if(rSet == null) {
			rSet = new HashSet<String>();
		}
		
		
		return rSet;
	}
	
}
