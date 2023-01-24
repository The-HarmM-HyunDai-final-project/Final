package com.theharmm.mapper;

import java.util.List;

import com.theharmm.domain.SocialVO;

public interface SocialMapper {
	
	/* 피드 등록 */
	public void socialEnroll(SocialVO social);
	
	/* post_id로 socialvo가져오기 */
	public List<SocialVO> socialByPostid(int post_id);
	
}
