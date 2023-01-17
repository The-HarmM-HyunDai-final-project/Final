package com.theharmm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.theharmm.domain.SocialVO;
import com.theharmm.mapper.AttachMapper;
import com.theharmm.service.AttachService;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class AttachServiceImpl implements AttachService{

	@Autowired
	private AttachMapper attachMapper;
	
	/* 이미지 데이터 반환 */
	@Override
	public List<SocialVO> getSocialList(int post_id) {
		log.info("getSocialList.........");
		return attachMapper.getSocialList(post_id);
	}
	

}