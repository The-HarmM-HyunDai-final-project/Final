package com.theharmm.controller;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.imageio.ImageIO;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.theharmm.domain.BuySaleToday;
import com.theharmm.domain.CountToday;
import com.theharmm.domain.MemberVO;
import com.theharmm.domain.ProductDTO;
import com.theharmm.domain.RegisterToday;
import com.theharmm.domain.ShowLiveChannelDTO;
import com.theharmm.domain.SocialVO;
import com.theharmm.domain.TopProduct;
import com.theharmm.security.domain.CustomUser;
import com.theharmm.service.AdminService;
import com.theharmm.service.ShowLiveService;

import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnails;

@Controller
@RequestMapping("/admin/*")
@Log4j
public class AdminController {
	
	@Autowired
	private AdminService adminService;
	
	@Autowired
	private ShowLiveService showLiveService;
 
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
    
    /* TOP5 구매 */
    @RequestMapping(value="buyTop", method = RequestMethod.GET)
    public @ResponseBody List<TopProduct> adminTop5BuyList(Model model){
        logger.info(" TOP5 구매 ");
        List<TopProduct> buyTop = adminService.getTop5BuyList();
		model.addAttribute("buyTop", buyTop);
		return buyTop;
    }
    
    /* TOP5 판매 */
    @RequestMapping(value="saleTop", method = RequestMethod.GET)
    public @ResponseBody List<TopProduct> adminTop5SaleList(Model model){
        logger.info(" TOP5 판매 ");
        List<TopProduct> saleTop = adminService.getTop5SaleList();
		model.addAttribute("saleTop", saleTop);
		return saleTop;
    }
    
    @RequestMapping(value="main", method = RequestMethod.GET)
    public void adminMainGET() throws Exception{
        logger.info("관리자 페이지 이동");
    }
    
    /* 관리자  구매판매 페이지 이동 */
    @RequestMapping(value="charts", method = RequestMethod.GET)
    public void adminChartsGET() throws Exception{
    	logger.info("관리자 구매판매 이동");
    }
    
    /* 관리자 상품 페이지 이동 */
    @GetMapping(value="product")
    public List<ProductDTO> adminProductGET(Model model){
        logger.info("관리자 상품 페이지 이동");
        List<ProductDTO> product = adminService.getProductList();
		model.addAttribute("product", product);
        return product;
    }
    
    /* 관리자 회원 페이지 이동 */
    @GetMapping(value="member")
    public List<MemberVO> adminMemberGET(Model model){
        logger.info("관리자 회원 페이지 이동");
        List<MemberVO> member = adminService.getMemberList();
		model.addAttribute("member", member);
        return member;
    }
    
    /* 관리자  라이브쇼 페이지 이동 */
    @RequestMapping(value="showliveCreate", method = RequestMethod.GET)
    public void adminLiveshowGET() throws Exception{
        logger.info("관리자 라이브쇼 생성창 이동");
        
    }
    
    /* 쇼라이브 등록 */
	@PostMapping("/showliveEnroll")
	public String showliveEnrollPOST(ShowLiveChannelDTO createdChannel, RedirectAttributes rttr, Model model) throws Exception{
		log.warn("showliveEnroll......");
		
		//방을 만든 BJ 아이디 가져오기
		CustomUser bjUser = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String bjUsername = bjUser.getUsername();
		//방을 생성하는 날짜
		Date curDate = new java.util.Date();
		
		//생성할 채널인 ShowLiveChannelDTO에 값을 넣어주기
		createdChannel.setShow_host(bjUsername);
		createdChannel.setLive_status(1);
		createdChannel.setShowlive_start_date(curDate);
		//createdChannel.setProduct_name(createdChannel.getProduct_name().replace("&#39;", "'"));
		log.warn(createdChannel.getProduct_name());
		
		//log.warn(createdChannel.toString());
		
		//db에 채널  DTO를 넣고
		//ShowLiveChannelStore에도 방을 만들듬과 동시에 방 번호를 return 받음
		int roomNo = showLiveService.createChannel(createdChannel);
		
		//ShowLiveChannelDTO recent = showLiveService.getShowLiveChannelInfo();
		createdChannel.setShowlive_no(roomNo);
		if(roomNo != 0) {
			log.warn(roomNo + " : 방번호 ");
			log.warn("방이 잘 만들어졌습니다.");
			log.warn(createdChannel.getRestricted_grade());
		}
		
		model.addAttribute("channelDTO", createdChannel);

		return "admin/showliveonair";
	}
	
	/* 첨부 파일 업로드 */
	@PostMapping(value = "/uploadAjaxAction", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<List<String>> uploadAjaxActionPOST(MultipartFile[] uploadFile) {
		logger.info("uploadAjaxActionPOST..........");
		/* 이미지 파일 체크 */
		for (MultipartFile multipartFile : uploadFile) {
			File checkfile = new File(multipartFile.getOriginalFilename());
			String type = null;
			try {
				type = Files.probeContentType(checkfile.toPath());
				logger.info("MIME TYPE : " + type);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
//		String webappRoot = servletContext.getRealPath("/");
//	      
//	    String myRootPath = webappRoot.split(".metadata")[0] + "Final" + File.separator + "src" + File.separator + "main" + File.separator + "webapp" + File.separator;
//        String relativePath = "resources" + File.separator + "images" + File.separator + "postimages" + File.separator;
	    //System.out.println(relativePath);
		String uploadFolder = "C:\\showlive";

		File uploadPathFolder = new File(uploadFolder);
		
		//폴더 없으면 생성
		if(!uploadPathFolder.exists()) {
			try{
				uploadPathFolder.mkdir(); //폴더 생성합니다. ("새폴더"만 생성)
			    System.out.println("폴더가 생성완료.");
		        } 
		        catch(Exception e){
			    e.getStackTrace();
			}    
		}else {
			System.out.println("폴더가 이미 존재합니다.");
		}
		
		/* 이미저 정보 담는 객체 */
		List<String> imgNameList = new ArrayList();
		for (MultipartFile multipartFile : uploadFile) {
			/* 파일 이름 */
			String uploadFileName = multipartFile.getOriginalFilename();
			/* uuid 적용 파일 이름 */
			String uuid = UUID.randomUUID().toString();
			uploadFileName = uuid + "_" + uploadFileName;
			/* 파일 위치, 파일 이름을 합친 File 객체 */
			
			//relativePath += uploadFileName;//DB에 넣을 놈
			
			File saveFile = new File(uploadPathFolder, uploadFileName);
			/* 파일 저장 */
			try {
				multipartFile.transferTo(saveFile);
				/* 썸네일 생성(ImageIO) */
				File thumbnailFile = new File(uploadPathFolder, "s_" + uploadFileName);
				BufferedImage bo_image = ImageIO.read(saveFile);
				// 비율
				double ratio = 3;
				// 넓이 높이
				int width = (int) (bo_image.getWidth() / ratio);
				int height = (int) (bo_image.getHeight() / ratio);
				Thumbnails.of(saveFile).size(width, height).toFile(thumbnailFile);
			} catch (Exception e) {
				e.printStackTrace();
			}
			imgNameList.add(uploadFileName);
		}
		
		ResponseEntity<List<String>> result = new ResponseEntity<List<String>>(imgNameList, HttpStatus.OK);
		
		return result;
	}
	
	//쇼라이브 생방송 페이지
	@RequestMapping(value = "onAir", method= RequestMethod.GET)
	public String onAir() {
		return "admin/showliveonair";
	}
}