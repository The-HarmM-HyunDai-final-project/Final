package com.theharmm.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.theharmm.domain.PostCriteria;
import com.theharmm.domain.PostPageDTO;
import com.theharmm.domain.PostVO;
import com.theharmm.service.PostService;

@Controller
public class PostController {
	private static final Logger logger = LoggerFactory.getLogger(PostController.class);
	
	@Autowired
	private PostService postService;
	
	/* 포스트 관리(포스트목록) 페이지 접속 */
	@RequestMapping(value = "/social/user", method = RequestMethod.GET)
	public void postManageGET(PostCriteria postcri, Model model) throws Exception{
		/* 포스트 리스트 데이터 */
		List list = postService.postGetList(postcri);
		
		if(!list.isEmpty()) {
			model.addAttribute("list", list);
		} else {
			model.addAttribute("listCheck", "empty");
			return;
		}
		
		/* 페이지 인터페이스 데이터 */
		model.addAttribute("pageMaker", new PostPageDTO(postcri, postService.postGetTotal(postcri)));

	}
	
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
		rttr.addFlashAttribute("enroll_result", post.getPost_id());
		//휘발성
		return "redirect:/social/user";
	}
	

}
