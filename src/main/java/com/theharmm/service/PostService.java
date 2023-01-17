package com.theharmm.service;

import java.util.List;

import com.theharmm.domain.PostCriteria;
import com.theharmm.domain.PostVO;

public interface PostService {

	/* 포스트 등록 */
	public void postEnroll(PostVO post);
	
	/* 포스트 리스트 */
	public List<PostVO> postGetList(PostCriteria postcri);
	
	/* 포스트 총 개수 */
	public int postGetTotal(PostCriteria postcri);	

}
