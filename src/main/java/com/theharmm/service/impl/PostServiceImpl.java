package com.theharmm.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.theharmm.domain.PostVO;
import com.theharmm.mapper.MemberMapper;
import com.theharmm.mapper.PostMapper;
import com.theharmm.service.PostService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@AllArgsConstructor
@Log4j
public class PostServiceImpl implements PostService {
	@Autowired
	private PostMapper postMapper;

	/* 상품 등록 */
	@Transactional
	@Override
	public void postEnroll(PostVO post) {
		
		log.info("(service)postEnroll........");
		
		postMapper.postEnroll(post);
		
		if(post.getSocialList() == null || post.getSocialList().size() <= 0) {
			return;
		}
		
		post.getSocialList().forEach(s ->{
			
			s.setPost_id(post.getPost_id());
			postMapper.socialEnroll(s);
			
		});	
	}
}
