package com.theharmm.service;

import java.util.List;

import com.theharmm.domain.SocialVO;

public interface AttachService {
	
	/* 이미지 데이터 반환 */
	public List<SocialVO> getSocialList(int post_id);	

}