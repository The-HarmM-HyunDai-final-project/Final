package com.theharmm.service.impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.theharmm.controller.PostController;
import com.theharmm.domain.PostCriteria;
import com.theharmm.domain.PostVO;
import com.theharmm.domain.SocialVO;
import com.theharmm.mapper.MemberMapper;
import com.theharmm.mapper.PostMapper;
import com.theharmm.mapper.SocialMapper;
import com.theharmm.service.PostService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@AllArgsConstructor
public class PostServiceImpl implements PostService {
   private static final Logger logger = LoggerFactory.getLogger(PostController.class);

   @Autowired
   private PostMapper postMapper;

   @Autowired
   private SocialMapper socialMapper;

   /* 포스트 등록 */
   @Transactional
   @Override
   public void postEnroll(PostVO post) {
      logger.info("(serviceImpl)postEnroll........");
      System.out.println("(serviceImpl)postEnroll");
      postMapper.postEnroll(post);
      if (post.getSocialList() == null || post.getSocialList().size() <= 0) {
         return;
      }

      post.getSocialList().forEach(s -> {
         //s.setPost_id(post.getPost_id());
         String[] upload = s.getUpload_path().split(",");
         String[] uuid = s.getUuid().split(",");
         String[] file_name = s.getFile_name().split(",");
         for (int i = 0; i < upload.length; i++) {
            SocialVO svo = new SocialVO();
            svo.setPost_id(post.getPost_id());
            svo.setUpload_path("resources/images/postimages");
            svo.setFile_name(file_name[i]);
            svo.setUuid(uuid[i]);
            socialMapper.socialEnroll(svo);
         }

      });
   }

   /* 포스트 리스트 */
   @Override
   public List<PostVO> postGetList(PostCriteria postcri) {
      logger.info("postGetTotalList()..........");
      return postMapper.postGetList(postcri);
   }

   /* 포스트 총 갯수 */
   public int postGetTotal(PostCriteria postcri) {
      logger.info("postGetTotal().........");
      return postMapper.postGetTotal(postcri);
   }

   @Override
   public PostVO postGetOne(int post_id) {
      return postMapper.postGetOne(post_id);
   }

   @Override
   public List<SocialVO> socialByPostid(int post_id) {
      return socialMapper.socialByPostid(post_id);
   }
   
   @Override
   public List<PostVO> selectPositivePostList(int pid) {
      return postMapper.selectPositivePostList(pid);
   }

   @Override
   public List<PostVO> selectNegativePostList(int pid) {
      return postMapper.selectNegativePostList(pid);
   }


   @Override
   public List<PostVO> postGetByMailList(PostCriteria postcri, String member_email) {
      return postMapper.postGetByMailList(postcri,member_email);
   }

   @Override
   public int postGetByMailTotal(String member_email) {
      return postMapper.postGetByMailTotal(member_email);
   }

   @Override
   public int insertFollow(String follower, String following) {
      return postMapper.insertFollow(follower, following);
   }

   @Override
   public List<String> getFollowerList(String member_email) {
      return postMapper.followerList(member_email);
   }

   @Override
   public List<String> getFollowingList(String member_email) {
      return postMapper.followingList(member_email);
   }

   @Override
   public int countFollower(String member_email) {
      return postMapper.followerTotal(member_email);
   }

   @Override
   public int countFollowing(String member_email) {
      return postMapper.followingTotal(member_email);
   }

   @Override
   public int deleteFollow(String follower, String following) {
      return postMapper.deleteFollow(follower, following);
   }

   @Override
   public boolean checkFollow(String follower, String following) {
      int cnt = postMapper.countFollow(follower, following);
      if (cnt == 0) {
         return false;
      } else {
         return true;
      }
   }   
}