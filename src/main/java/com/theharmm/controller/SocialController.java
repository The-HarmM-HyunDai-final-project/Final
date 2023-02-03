package com.theharmm.controller;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URLDecoder;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.imageio.ImageIO;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.theharmm.domain.MemberVO;
import com.theharmm.domain.SocialVO;
import com.theharmm.service.MemberService;

import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnails;

import net.coobird.thumbnailator.Thumbnails;

@Controller
@RequestMapping("/social/*")
@Log4j
public class SocialController {
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@Autowired
	ServletContext servletContext;
	
	@GetMapping("temp")
	public String bal(HttpServletRequest request) {
		String webappRoot2 = request.getSession().getServletContext().getRealPath("");
		String webappRoot = servletContext.getRealPath("/");
		String relativeFolder = "resources" + File.separator + "temp.txt";
		
		//String myPath = webappRoot.split(".metadata")[0] + "Final" + File.separator + "src" + File.separator + "main" + File.separator + "webapp" + File.separator;
		String myPath = webappRoot.split(".metadata")[0] + "Final" + File.separator + "src" + File.separator + "main" + File.separator + "webapp" + File.separator;

		log.warn(myPath);
		
//		log.warn(webappRoot);
//		log.warn(webappRoot2);
//		log.warn(relativeFolder);
//		log.warn(webappRoot+relativeFolder);

		try {
		    OutputStream output = new FileOutputStream(myPath+relativeFolder);
		    String str ="오늘 날씨는 아주 좋습니다.";
		    byte[] by=str.getBytes();
		    output.write(by);
				
		} catch (Exception e) {
	            e.getStackTrace();
		}
		
		return "temp";
	}
	
	/* 첨부 파일 업로드 */
	@PostMapping(value = "/user/uploadAjaxAction", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<List<SocialVO>> uploadAjaxActionPOST(MultipartFile[] uploadFile) {
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
			//if (!type.startsWith("image")) {
			//	List<SocialVO> list = null;
			//	return new ResponseEntity<>(list, HttpStatus.BAD_REQUEST);
			//}
		}
		
		String webappRoot = servletContext.getRealPath("/");
		
	    String myRootPath = "C:" + File.separator + "Users" + File.separator + "kosa2" + File.separator + "git" + File.separator + "Final" + File.separator + "src" + File.separator + "main" + File.separator + "webapp" + File.separator;
	    //String myRootPath = "C:" + File.separator + "Users" + File.separator + "user" + File.separator + "git" + File.separator + "Final" + File.separator + "src" + File.separator + "main" + File.separator + "webapp" + File.separator;
	    //String myRootPath = "C:" + File.separator + "sts3" + File.separator + "workspace" + File.separator + "Final" + File.separator + "src" + File.separator + "main" + File.separator + "webapp" + File.separator;
	    
		//여명이꺼
		String myRootPath2 = "C:/Users/kosa/Desktop/final_project/Final/src/main/webapp/";
		
        String relativePath = "resources" + File.separator + "images" + File.separator + "postimages" + File.separator;
	    System.out.println(relativePath);
		String uploadFolder = "C:\\upload";
		/* 날짜 폴더 경로 */
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String str = sdf.format(date);
		String datePath = str.replace("-", File.separator);

		File uploadPath = new File(myRootPath2 + relativePath);
		
		/* 이미저 정보 담는 객체 */
		List<SocialVO> list = new ArrayList();
		for (MultipartFile multipartFile : uploadFile) {
			SocialVO vo = new SocialVO();
			/* 파일 이름 */
			String uploadFileName = multipartFile.getOriginalFilename();
			vo.setFile_name(uploadFileName);
			vo.setUpload_path("resources/images/postimages");
			/* uuid 적용 파일 이름 */
			String uuid = UUID.randomUUID().toString();
			vo.setUuid(uuid);
			uploadFileName = uuid + "_" + uploadFileName;
			/* 파일 위치, 파일 이름을 합친 File 객체 */
			
			relativePath += uploadFileName;//DB에 넣을 놈
			
			File saveFile = new File(uploadPath, uploadFileName);
			/* 파일 저장 */
			try {
				multipartFile.transferTo(saveFile);
				/* 썸네일 생성(ImageIO) */
				File thumbnailFile = new File(uploadPath, "s_" + uploadFileName);
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
			list.add(vo);
		}
		ResponseEntity<List<SocialVO>> result = new ResponseEntity<List<SocialVO>>(list, HttpStatus.OK);
		return result;
	}

	/* 이미지 파일 삭제 */
	@PostMapping("/user/deleteFile")
	public ResponseEntity<String> deleteFile(String fileName) {
		logger.info("deleteFile........" + fileName);
		String myRootPath = "C:" + File.separator + "Users" + File.separator + "kosa2" + File.separator + "git" + File.separator + "Final" + File.separator + "src" + File.separator + "main" + File.separator + "webapp" + File.separator;
		String relativePath = "resources" + File.separator + "images" + File.separator + "postimages" + File.separator;
		 
		File file = null;
		try {
			/* 썸네일 파일 삭제 */
			File uploadPath = new File(myRootPath);
			file = new File(uploadPath + File.separator + fileName);
			file.delete();
			/* 원본 파일 삭제 */
			String originFileName = file.getAbsolutePath().replace("s_", "");
			logger.info("originFileName : " + originFileName);
			file = new File(originFileName);
			file.delete();
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<String>("fail", HttpStatus.NOT_IMPLEMENTED);
		} // catch
		return new ResponseEntity<String>("success", HttpStatus.OK);

	}
}
