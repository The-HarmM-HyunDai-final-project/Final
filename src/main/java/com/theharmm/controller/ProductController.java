package com.theharmm.controller;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.theharmm.dto.product.Criteria;
import com.theharmm.dto.product.ProductPageDTO;
import com.theharmm.dto.product.ProductDTO;
import com.theharmm.service.ProductService;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/product/*")
@RequiredArgsConstructor

public class ProductController {
	private final ProductService productservice;
	
	@GetMapping(value = "/getProductList", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String getProductList(@RequestParam(defaultValue = "1") int page, String type, String keyword, String bkeyword, @RequestParam(defaultValue = "1") int ckeyword
			, @RequestParam(defaultValue = "0") int startp, @RequestParam(defaultValue = "0") int endp, String ssize, String lsize) {
		
		log.info("ajax 제품 리스트 출력");
		log.info(type);
		log.info(keyword);
		log.info(bkeyword);
		log.info(ckeyword);
		log.info(ssize);
		Criteria cri = new Criteria();
		
		cri.setAmount(12);
		cri.setPageNum(page);
		cri.setType(type);
		//cri.setCkeyword(ckeyword)
		cri.setBkeyword(bkeyword);
		cri.setCkeyword(ckeyword);
		cri.setStartp(startp);
		cri.setEndp(endp);
		cri.setSsize(ssize);
		cri.setLsize(lsize);
		
		log.info(cri);
		ProductPageDTO products = productservice.getProducts(cri);
		log.info(products);
		
		JSONObject jsonObject = new JSONObject();
		JSONArray jsonArray = new JSONArray();
		
		for (ProductDTO p : products.getList()) {
			JSONObject tmpObject = new JSONObject();
			
			JSONObject pObject = new JSONObject(); // 제품 정보 담을 json
			pObject.put("pid", p.getPid());
			pObject.put("brand", p.getBrand());
			pObject.put("pname_e", p.getPname_e());
			pObject.put("pname_k", p.getPname_k());
			pObject.put("release_price", p.getRelease_price());
			pObject.put("img1", p.getImg1());
			
			tmpObject.put("product", pObject);
			jsonArray.put(tmpObject);
		}
		jsonObject.put("products", jsonArray);
		jsonObject.put("result", "success");
		jsonObject.put("totalCnt", products.getTotalCnt());
		
		String json = jsonObject.toString();
		log.info(json);
		return json;
	}
	
	@GetMapping("/productlist")
	public String productList(Model model) {
		log.info("제품 리스트 출력");
		// 세션에서 mid가져오기
		//String mid = principal.getName();
		// int count = mywishservice.countLikes(mid);
		
		//model.addAttribute("wishCnt",count);
		//model.addAttribute("mid", mid);
		return "product/productlist";
	}
	
}