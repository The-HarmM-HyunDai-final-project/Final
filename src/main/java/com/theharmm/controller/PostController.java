package com.theharmm.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.util.List;

import javax.servlet.http.HttpSession;

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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.theharmm.domain.MemberVO;
import com.theharmm.domain.PostCriteria;
import com.theharmm.domain.PostVO;
import com.theharmm.domain.SocialVO;
import com.theharmm.service.AttachService;
import com.theharmm.service.PostService;

@Controller
public class PostController {
	private static final Logger logger = LoggerFactory.getLogger(PostController.class);
	
	@Autowired
	private PostService postService;
	
	@Autowired
	private AttachService attachService;
	
	/* 포스트 메인(포스트목록) 페이지 접속 */
	@RequestMapping(value = "/social/trending", method = RequestMethod.GET)
	public void postMainGET(PostCriteria postcri, Model model, HttpSession session) throws Exception{
		
		List list = postService.postGetList(postcri);
		if(!list.isEmpty()) {
			model.addAttribute("list", list);
		} else {
			model.addAttribute("listCheck", "empty");
			return;
		}
	}
	
	/* 포스트 관리(포스트목록) 페이지 접속 */
	@RequestMapping(value = "/social/user", method = RequestMethod.GET)
	public void postManageGET(PostCriteria postcri, Model model, HttpSession session) throws Exception{
		MemberVO m = new MemberVO();
		/* 포스트 리스트 데이터 */
		List list = postService.postGetList(postcri);
		if(!list.isEmpty()) {
			model.addAttribute("list", list);
		} else {
			model.addAttribute("listCheck", "empty");
			return;
		}
		/* 페이지 인터페이스 데이터 */
		//model.addAttribute("pageMaker", new PostPageDTO(postcri, postService.postGetTotal(postcri)));
	}
	
	/* 이미지 출력 */
	@GetMapping("/social/user/display")
	public ResponseEntity<byte[]> getImage(String fileName) {
		logger.info("getImage()........" + fileName);
		File file = new File(fileName);
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
	
	/* 이미지 정보 반환 */
	@GetMapping(value="/social/user/getSocialList", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<List<SocialVO>> getSocialList(int post_id){
		logger.info("getSocialList.........." + post_id);
		return new ResponseEntity<List<SocialVO>>(attachService.getSocialList(post_id), HttpStatus.OK);
		
	}
	
	/* 포스트 등록 */
	@PostMapping("/social/user/postEnroll")
	public String postEnrollPOST(PostVO post, RedirectAttributes rttr) throws Exception{
		logger.info("postEnrollPOST......" + post);
		logger.info("퍼센트: "+post.getPercent());
		logger.info("결과: "+post.getResult());
		
		
		postService.postEnroll(post);
		rttr.addFlashAttribute("enroll_result", post.getPost_id());
		//휘발성
		return "redirect:/social/user";
	}
	
	/* 포스트 상세 */
	/*
	 * @GetMapping("/social/user/details") public String getPostDetail(int post_id,
	 * Model model){ logger.info("getPostDetail.........." + post_id); PostVO postvo
	 * = postService.postGetOne(post_id); List<SocialVO> socials =
	 * postService.socialByPostid(post_id);
	 * 
	 * for (int i = 0; i < socials.size(); i++) { if
	 * (socials.get(i).getFile_name().contains("mp4")) {
	 * model.addAttribute("video",socials.get(i).getUpload_path()+"/"+socials.get(i)
	 * .getUuid()+"/"+ socials.get(i).getFile_name());
	 * log.info(socials.get(i).getUpload_path()+"/"+socials.get(i).getUuid()+"/"+
	 * socials.get(i).getFile_name()); } else {
	 * model.addAttribute("poster",socials.get(i).getUpload_path()+"/"+socials.get(i
	 * ).getUuid()+"/"+ socials.get(i).getFile_name());
	 * log.info(socials.get(i).getUpload_path()+"/"+socials.get(i).getUuid()+"/"+
	 * socials.get(i).getFile_name()); } } model.addAttribute("post_id",
	 * postvo.getPost_id()); model.addAttribute("contents", postvo.getContents());
	 * model.addAttribute("pid0", postvo.getPid0()); model.addAttribute("pid1",
	 * postvo.getPid1()); model.addAttribute("pid2", postvo.getPid2());
	 * 
	 * //model.addAttribute("post_id", postvo.getPost_id());
	 * 
	 * return "social/userdetail"; }
	 */



}