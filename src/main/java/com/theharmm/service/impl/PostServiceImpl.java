package com.theharmm.service.impl;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.theharmm.controller.PostController;
import com.theharmm.domain.KeywordDTO;
import com.theharmm.domain.PostCriteria;
import com.theharmm.domain.PostVO;
import com.theharmm.domain.SocialVO;
import com.theharmm.mapper.PostMapper;
import com.theharmm.mapper.SocialMapper;
import com.theharmm.service.PostService;

import lombok.AllArgsConstructor;

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

   /* 전체 포스트 리스트 */
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

   /* 포스트 id로 포스트 하나 가져오기 */
   @Override
   public PostVO postGetOne(int post_id) {
      return postMapper.postGetOne(post_id);
   }

   /* 포스트 id로 소셜 가져오기 */
   @Override
   public List<SocialVO> socialByPostid(int post_id) {
      return socialMapper.socialByPostid(post_id);
   }
   
	/* 사용자 별로 포스트 가져오기 */
   @Override
   public List<PostVO> postGetByMailList(PostCriteria postcri, String member_email) {
      return postMapper.postGetByMailList(postcri,member_email);
   }

	/* 사용자별 포스트 전체 갯수 가져오기 */
   @Override
   public int postGetByMailTotal(String member_email) {
      return postMapper.postGetByMailTotal(member_email);
   }
   
   @Override
   public List<PostVO> selectPositivePostList(int pid) {
      return postMapper.selectPositivePostList(pid);
   }

   @Override
   public List<PostVO> selectNegativePostList(int pid) {
      return postMapper.selectNegativePostList(pid);
   }

	/* 팔로우 삽입 */
   @Override
   public int insertFollow(String follower, String following) {
      return postMapper.insertFollow(follower, following);
   }

	/* 팔로우 리스트 */
   @Override
   public List<String> getFollowerList(String member_email) {
      return postMapper.followerList(member_email);
   }

	/* 팔로잉 리스트 */
   @Override
   public List<String> getFollowingList(String member_email) {
      return postMapper.followingList(member_email);
   }

	/* 팔로우 개수 세기 */
   @Override
   public int countFollower(String member_email) {
      return postMapper.followerTotal(member_email);
   }

	/* 팔로잉 개수 세기 */
   @Override
   public int countFollowing(String member_email) {
      return postMapper.followingTotal(member_email);
   }

	/* 팔로우 삭제 */
   @Override
   public int deleteFollow(String follower, String following) {
      return postMapper.deleteFollow(follower, following);
   }

	/* 팔로잉 중인지 체크 */
   @Override
   public boolean checkFollow(String follower, String following) {
      int cnt = postMapper.countFollow(follower, following);
      if (cnt == 1) {
         return true;
      } else {
         return false;
      }
   }

	@Override
	public int mergeKeywordList(PostVO post, List<String> keyword_list) {
		int cnt = 0;
		KeywordDTO keywordDTO = new KeywordDTO();
		for(String keyword:keyword_list) {
			keywordDTO.setCount(1);
			keywordDTO.setKeyword(keyword);
			keywordDTO.setSentiment_result(post.getSentiment_result());
			if(post.getPid0()!=0) {
				keywordDTO.setPid(post.getPid0());
				cnt += postMapper.mergeKeywordList(keywordDTO);
				
			}
			if(post.getPid1()!=0) {
				keywordDTO.setPid(post.getPid1());
				cnt += postMapper.mergeKeywordList(keywordDTO);
				
			}
			if(post.getPid2()!=0) {
				keywordDTO.setPid(post.getPid2());
				cnt += postMapper.mergeKeywordList(keywordDTO);
				
			}
		}
		
		return cnt;
	}  
	
	@Override
	public List<PostVO> selectKeywordPostList(Map<String, Object> postInfo) {
		return postMapper.selectKeywordPostList(postInfo);
	}

	@Override
	public double selectPositivePostAvg(int pid) {
		return postMapper.selectPositivePostAvg(pid);
	}

	@Override
	public double selectNegativePostAvg(int pid) {
		return postMapper.selectNegativePostAvg(pid);
	}   
}