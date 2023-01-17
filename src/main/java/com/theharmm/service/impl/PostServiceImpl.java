package com.theharmm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.theharmm.domain.PostCriteria;
import com.theharmm.domain.PostVO;
import com.theharmm.mapper.MemberMapper;
import com.theharmm.mapper.PostMapper;
import com.theharmm.mapper.SocialMapper;
import com.theharmm.service.PostService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@AllArgsConstructor
@Log4j
public class PostServiceImpl implements PostService {
	@Autowired
	private PostMapper postMapper;
	
	@Autowired
	private SocialMapper socialMapper;

	/* 포스트 등록 */
	@Transactional
	@Override
	public void postEnroll(PostVO post) {
		log.info("(serviceImpl)postEnroll........");
		System.out.println("(serviceImpl)postEnroll");
		postMapper.postEnroll(post);
		if(post.getSocialList() == null || post.getSocialList().size() <= 0) {
			return;
		}
		post.getSocialList().forEach(s ->{	
			s.setPost_id(post.getPost_id());
			log.info(s.getPost_id());
			socialMapper.socialEnroll(s);
		});	
	}
	
	/* 포스트 리스트 */
	@Override
	public List<PostVO> postGetList(PostCriteria postcri) {
		log.info("postGetTotalList()..........");
		return postMapper.postGetList(postcri);
	}

	/* 포스트 총 갯수 */
	public int postGetTotal(PostCriteria postcri) {
		log.info("postGetTotal().........");
		return postMapper.postGetTotal(postcri);
	}
}
