package com.theharmm.mapper;

import com.theharmm.domain.PostVO;
import com.theharmm.domain.SocialVO;

public interface PostMapper {
	
	/* 포스트 등록 */
	public void postEnroll(PostVO post);
	
	/* 이미지 등록 */
	public void socialEnroll(SocialVO vo);

}
