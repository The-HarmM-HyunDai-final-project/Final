package com.theharmm.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.theharmm.domain.BuySaleToday;
import com.theharmm.domain.CountToday;
import com.theharmm.domain.ProductDTO;
import com.theharmm.domain.RegisterToday;
import com.theharmm.domain.ShowLiveChannelDTO;
import com.theharmm.service.AdminService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/admin/*")
@Log4j
public class AdminController {
	
	@Autowired
	private AdminService adminService;
 
    private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
    
    /* 관리자 오늘방문자수 */
    @RequestMapping(value="countToday", method = RequestMethod.GET)
    public @ResponseBody List<CountToday> adminCountTodyGET(Model model){
        logger.info("관리자 오늘방문자수");
        List<CountToday> countToday = adminService.countToday();
		model.addAttribute("countToday", countToday);
		return countToday;
    }
    
    /* 관리자 신규가입자수 */
    @RequestMapping(value="registerToday", method = RequestMethod.GET)
    public @ResponseBody List<RegisterToday> adminRegisterTodyGET(Model model){
        logger.info("관리자 신규가입자수");
        List<RegisterToday> registerToday = adminService.registerToday();
		model.addAttribute("registerToday", registerToday);
		return registerToday;
    }
    
    /* 거래금액 */
    @RequestMapping(value="buyToday", method = RequestMethod.GET)
    public @ResponseBody List<BuySaleToday> adminBuyTodyGET(Model model){
        logger.info("거래금액");
        List<BuySaleToday> buyToday = adminService.buyToday();
		model.addAttribute("buyToday", buyToday);
		return buyToday;
    }
    
    /* 판매금액 */
    @RequestMapping(value="saleToday", method = RequestMethod.GET)
    public @ResponseBody List<BuySaleToday> adminSaleTodyGET(Model model){
        logger.info("판매금액");
        List<BuySaleToday> saleToday = adminService.saleToday();
		model.addAttribute("saleToday", saleToday);
		return saleToday;
    }
    
    @RequestMapping(value="main", method = RequestMethod.GET)
    public void adminMainGET() throws Exception{
        
        logger.info("관리자 페이지 이동");
        
    }
    
    /* 관리자  차트 페이지 이동 */
    @RequestMapping(value="charts", method = RequestMethod.GET)
    public void adminChartsGET() throws Exception{
        
        logger.info("관리자 페이지 이동");
        
    }
    
    /* 관리자 상품 페이지 이동 */
    @GetMapping(value="product")
    public List<ProductDTO> adminProductGET(Model model){
        logger.info("관리자 상품 페이지 이동");
        List<ProductDTO> product = adminService.getProductList();
		model.addAttribute("product", product);
        return product;
    }
    
    /* 관리자  라이브쇼 페이지 이동 */
    @RequestMapping(value="showlive", method = RequestMethod.GET)
    public void adminLiveshowGET() throws Exception{
        
        logger.info("관리자 라이브쇼 이동");
        
    }
    
    /* 관리자  구매판매 페이지 이동 */
    @RequestMapping(value="buyAndSell", method = RequestMethod.GET)
    public void adminBuyAndSellGET() throws Exception{
        
        logger.info("관리자 구매판매 이동");
        
    }
    
    /* 쇼라이브 등록 */
	@PostMapping("/showliveEnroll")
	public String showliveEnrollPOST(ShowLiveChannelDTO slcd, RedirectAttributes rttr) throws Exception{
		log.warn("showliveEnroll......");
		log.warn(slcd.toString());
		
		return "redirect:/admin/main";
	}
	
	//쇼라이브 생방송 페이지
	@RequestMapping(value = "onAir", method= RequestMethod.GET)
	public String onAir() {
		return "admin/showliveonair";
	}
}