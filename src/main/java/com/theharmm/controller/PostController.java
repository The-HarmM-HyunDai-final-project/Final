package com.theharmm.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.theharmm.domain.PostVO;
import com.theharmm.service.PostService;

@Controller
public class PostController {
	private static final Logger logger = LoggerFactory.getLogger(PostController.class);
	
	@Autowired
	private PostService postService;
	
	/* 이미지 출력 */
	@GetMapping("/social/user/display")
	public ResponseEntity<byte[]> getImage(String fileName) {
		logger.info("getImage()........" + fileName);
		File file = new File("c:\\upload\\" + fileName);
		ResponseEntity<byte[]> result = null;
		try {
			HttpHeaders header = new HttpHeaders();
			header.add("Content-type", Files.probeContentType(file.toPath()));
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);

		} catch (IOException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	/* 포스트 등록 */
	@PostMapping("/social/user/postEnroll")
	public String postEnrollPOST(PostVO post, RedirectAttributes rttr) {
		logger.info("postEnrollPOST......" + post);
		postService.postEnroll(post);
		rttr.addFlashAttribute("enroll_result", post.getMember_email());
		return "redirect:/user/postManage";
	}
	

}
