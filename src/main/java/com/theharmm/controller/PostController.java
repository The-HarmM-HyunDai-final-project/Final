package com.theharmm.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import org.json.JSONArray;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.theharmm.domain.PostCriteria;
import com.theharmm.domain.PostPageDTO;
import com.theharmm.domain.PostVO;
import com.theharmm.domain.ProductDTO;
import com.theharmm.domain.SocialVO;
import com.theharmm.security.domain.CustomUser;
import com.theharmm.service.AttachService;
import com.theharmm.service.PostService;
import com.theharmm.service.ProductService;
import com.theharmm.service.ReplyService;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class PostController {
   private static final Logger logger = LoggerFactory.getLogger(PostController.class);

   @Autowired
   private PostService postService;
   
   @Autowired
   private ProductService  productService; 
   
   @Autowired
   private ReplyService replyService;

   @Autowired
   private AttachService attachService;

   
   /* 전체 포스트 */
   @RequestMapping(value = "/social/trendings", method = RequestMethod.GET)
   public String postAllGET(PostCriteria postcri, Model model) throws Exception {
	   List<PostVO> list = postService.postGetList(postcri);
	   model.addAttribute("list", list);
	   return "social/trendings";
   }
   
   
   /* 포스트 관리(포스트목록) 페이지 접속 - 사용자 */
   @RequestMapping(value = "/social/user", method = RequestMethod.GET)
   public void postManageGET(PostCriteria postcri, Model model) throws Exception {
	      CustomUser user = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
	      String email = user.getUsername();
      log.info("postManageGET postcontroller" + email);
      /* 포스트 리스트 데이터 */
      List<PostVO> list = postService.postGetByMailList(postcri,email);    
      if (!list.isEmpty()) {
         model.addAttribute("list", list);
      } else {
         model.addAttribute("listCheck", "empty");
         
      }
      
      int listTotal = postService.postGetByMailTotal(email);
      /* 페이지 인터페이스 데이터 */
      model.addAttribute("pageMaker", new PostPageDTO(postcri, postService.postGetTotal(postcri)));

      int followerCnt = postService.countFollower(email);
      int followingCnt = postService.countFollowing(email);

      model.addAttribute("userCheck", "true");
      // 여기서 팔로잉, 팔로우 처리 필요

      log.info("email" + email);
      model.addAttribute("member_email", email);
      model.addAttribute("listTotal", listTotal);
      model.addAttribute("followerCnt", followerCnt);
      model.addAttribute("followingCnt", followingCnt);
   }
   
   /* 포스트 관리(포스트목록) 페이지 접속 - 다른 사용자 */
   @RequestMapping(value = "/social/trending", method = RequestMethod.GET)
   public String postManageGET(PostCriteria postcri, Model model, @RequestParam(defaultValue = " ") String email, @RequestParam(defaultValue = "") String member_email) throws Exception {
      
      log.info("postManageGET postcontroller" + email);
      /* 포스트 리스트 데이터 */
      List<PostVO> list = postService.postGetByMailList(postcri,email);
      if (!list.isEmpty()) {
         model.addAttribute("list", list);
      } else {
         model.addAttribute("listCheck", "empty");
         
      }
      
      int listTotal = postService.postGetByMailTotal(email);
      /* 페이지 인터페이스 데이터 */
      model.addAttribute("pageMaker", new PostPageDTO(postcri, postService.postGetTotal(postcri)));
      int followerCnt = postService.countFollower(email);
      int followingCnt = postService.countFollowing(email);

      
      // 여기서 팔로잉, 팔로우 처리 필요
      if (member_email.equals(email)) {
         model.addAttribute("userCheck", "true");
      } else {
         if (postService.checkFollow(member_email,email)) {
            model.addAttribute("userCheck", "팔로잉");
         } else {
            model.addAttribute("userCheck", "팔로우");            
         }
      }
      //model.addAttribute("userCheck", "팔로잉");
      log.info("userCheck" + postService.checkFollow(member_email,email));
      log.info("email" + email);
      model.addAttribute("member_email", email);
      model.addAttribute("listTotal", listTotal);
      model.addAttribute("followerCnt", followerCnt);
      model.addAttribute("followingCnt", followingCnt);
      
      log.info("followerCnt" + followerCnt);
      log.info("followingCnt" + followingCnt);
      return "social/trending";
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
   @GetMapping(value = "/social/user/getSocialList", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
   public ResponseEntity<List<SocialVO>> getSocialList(int post_id) {
      logger.info("getSocialList.........." + post_id);
      return new ResponseEntity<List<SocialVO>>(attachService.getSocialList(post_id), HttpStatus.OK);

   }

   /* 포스트 등록 */
   @PostMapping("/social/user/postEnroll")
   public String postEnrollPOST(PostVO post,@RequestParam List<String> keyword_list ,RedirectAttributes rttr) throws Exception{
      logger.info("postEnrollPOST......" + post);
      logger.info("퍼센트: "+post.getSentiment_percent());
      logger.info("결과: "+post.getSentiment_result());
      logger.info("키워드리스트: "+keyword_list);
    
      
      postService.postEnroll(post);
      
      postService.mergeKeywordList(post,keyword_list);
      
      rttr.addFlashAttribute("enroll_result", post.getPost_id());
      //휘발성
      return "redirect:/social/user";
   }

   /* 포스트 상세 - 사용자 */
   @GetMapping("/social/user/details")
   public String getPostDetail(int post_id, Model model,String user) {
      logger.info("getPostDetail.........." + post_id);
      PostVO postvo = postService.postGetOne(post_id);
      List<SocialVO> socials = postService.socialByPostid(post_id);

      for (int i = 0; i < socials.size(); i++) {
         if (socials.get(i).getFile_name().contains("mp4")) {
            model.addAttribute("video", socials.get(i).getUpload_path() + "/" + socials.get(i).getUuid() + "_"
                  + socials.get(i).getFile_name());
            log.info(socials.get(i).getUpload_path() + "/" + socials.get(i).getUuid() + "_"
                  + socials.get(i).getFile_name());
         } else {
            model.addAttribute("poster", socials.get(i).getUpload_path() + "/" + socials.get(i).getUuid() + "_"
                  + socials.get(i).getFile_name());
            log.info(socials.get(i).getUpload_path() + "/" + socials.get(i).getUuid() + "_"
                  + socials.get(i).getFile_name());
         }
      }
      
      model.addAttribute("post_id", postvo.getPost_id());
      model.addAttribute("contents", postvo.getContents());
      model.addAttribute("register_date",postvo.getRegister_date());
      
      List<ProductDTO> productList = new ArrayList<>();
      if (postvo.getPid0() != 0) {
         ProductDTO tmp1 = productService.getProduct(postvo.getPid0());
         productList.add(tmp1);
      }
      if (postvo.getPid1() != 0) {
         ProductDTO tmp2 = productService.getProduct(postvo.getPid1());
         productList.add(tmp2);
      }      
      if (postvo.getPid2() != 0) {
         ProductDTO tmp3 = productService.getProduct(postvo.getPid2());
         productList.add(tmp3);
      }      
      
      CustomUser member_email = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
      model.addAttribute("member_email", member_email.getUsername());
      
      model.addAttribute("user", member_email.getUsername());
      model.addAttribute("products", productList);
      model.addAttribute("pcount", productList.size());

      model.addAttribute("replyList", replyService.getReplyList(post_id));
      
      log.info(replyService.getReplyList(post_id));

      return "social/userdetail";
   }
   
   /* 포스트 상세 - 다른 사용자*/
   @GetMapping("/social/trending/details")
   public String getPostDetails(int post_id, Model model,String user) {
      logger.info("getPostDetail.........." + post_id);
      PostVO postvo = postService.postGetOne(post_id);
      List<SocialVO> socials = postService.socialByPostid(post_id);

      for (int i = 0; i < socials.size(); i++) {
         if (socials.get(i).getFile_name().contains("mp4")) {
            model.addAttribute("video", socials.get(i).getUpload_path() + "/" + socials.get(i).getUuid() + "_"
                  + socials.get(i).getFile_name());
            log.info(socials.get(i).getUpload_path() + "/" + socials.get(i).getUuid() + "_"
                  + socials.get(i).getFile_name());
         } else {
            model.addAttribute("poster", socials.get(i).getUpload_path() + "/" + socials.get(i).getUuid() + "_"
                  + socials.get(i).getFile_name());
            log.info(socials.get(i).getUpload_path() + "/" + socials.get(i).getUuid() + "_"
                  + socials.get(i).getFile_name());
         }
      }
      model.addAttribute("post_id", postvo.getPost_id());
      model.addAttribute("contents", postvo.getContents());
      
      List<ProductDTO> productList = new ArrayList<>();
      if (postvo.getPid0() != 0) {
         ProductDTO tmp1 = productService.getProduct(postvo.getPid0());
         productList.add(tmp1);
      }
      if (postvo.getPid1() != 0) {
         ProductDTO tmp2 = productService.getProduct(postvo.getPid1());
         productList.add(tmp2);
      }      
      if (postvo.getPid2() != 0) {
         ProductDTO tmp3 = productService.getProduct(postvo.getPid2());
         productList.add(tmp3);
      }      
      
      model.addAttribute("products", productList);
      model.addAttribute("pcount", productList.size());

      model.addAttribute("user", user);
      model.addAttribute("replyList", replyService.getReplyList(post_id));
      
      log.info(replyService.getReplyList(post_id));

      return "social/userdetail";
   }
   
	/* 팔로우 삽입 */
   @RequestMapping(value = "/social/insertFollow", produces = "application/json; charset=UTF-8")
   @ResponseBody
   public String insertFollow(@RequestParam("follower") String follower, @RequestParam("following") String following) {
      log.info("insertFollow 실행");
      log.info(follower);
      log.info(following);
      JSONObject jsonObject = new JSONObject();
      String json;
      
      try {
         int result = postService.insertFollow(follower, following);
         int followerCnt = postService.countFollower(following);
         List<String> followerList = postService.getFollowerList(following);
         log.info(followerCnt);
         jsonObject.put("result", result);
         jsonObject.put("followerCnt", followerCnt);
         jsonObject.put("followerList", followerList);
         log.info("성공");
      } catch (Exception e) {
         jsonObject.put("result", -1);
         jsonObject.put("followerCnt", -1);
         jsonObject.put("followerList", -1);
         log.info("실패");
      } finally {
         json = jsonObject.toString();
      }      
      return json;
   }
   
	/* 팔로우 삭제 */
   @RequestMapping(value = "/social/deleteFollow", produces = "application/json; charset=UTF-8")
   @ResponseBody
   public String deleteLike(@RequestParam("follower") String follower, @RequestParam("following") String following) {
      log.info("delete 실행");
      JSONObject jsonObject = new JSONObject();
      String json;
      
      try {
         int result = postService.deleteFollow(follower, following);
         int followerCnt = postService.countFollower(following);
         List<String> followerList = postService.getFollowerList(following);
         log.info(followerCnt);
         jsonObject.put("result", result);
         jsonObject.put("followerCnt", followerCnt);
         jsonObject.put("followerList", followerList);
         log.info("성공");
      } catch (Exception e) {
         jsonObject.put("result", -1);
         jsonObject.put("followerCnt", -1);
         jsonObject.put("followerList", -1);
         log.info("실패");
      } finally {
         json = jsonObject.toString();
      }      
      return json;   
      
   }
   
	/* 팔로워 리스트 */
   @RequestMapping(value = "/social/followList", produces = "application/json; charset=UTF-8")
   @ResponseBody
   public String followList(@RequestParam("email") String email) {
      log.info("리스트 실행");
      CustomUser user = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
      String username = user.getUsername();
      
      JSONObject jsonObject = new JSONObject();
      String json;
      
      try {
    	 List<String> followingList = postService.getFollowingList(email);
    	 List<String> followerList = postService.getFollowerList(email);

         log.info(followingList.toString());
         log.info(followerList.toString());
         
         JSONArray Object1 = new JSONArray();
         JSONArray Object2 = new JSONArray();
         for (String f : followingList) {
        	 JSONObject tmpObject = new JSONObject();
        	 tmpObject.put("user",f);  
        	 if (f.equals(username) || postService.checkFollow(username,f)) {
        		 tmpObject.put("follow", "팔로잉");
        	 } else {
        		 tmpObject.put("follow", "팔로우");
        	 }
        	 Object1.put(tmpObject);
         }
         jsonObject.put("followingList", Object1);
         
         for (String f : followerList) {
        	 JSONObject tmpObject2 = new JSONObject();
        	 tmpObject2.put("user",f);
        	 if (f.equals(username) || postService.checkFollow(username,f)) {
        		 tmpObject2.put("follow", "팔로잉"); 
        	 } else {
        		 tmpObject2.put("follow", "팔로우");
        	 }
        	 Object2.put(tmpObject2);
         }
         jsonObject.put("followerList", Object2);

         log.info("성공");
      } catch (Exception e) {
         log.info("실패");
      } finally {
    	 
         json = jsonObject.toString();
         log.info(json);
      }      
      return json;   
      
   }
}