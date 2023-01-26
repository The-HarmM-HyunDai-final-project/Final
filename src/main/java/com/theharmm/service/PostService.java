package com.theharmm.service;

import java.util.List;

import com.theharmm.domain.PostCriteria;
import com.theharmm.domain.PostVO;
import com.theharmm.domain.SocialVO;

public interface PostService {

	/* 포스트 등록 */
	public void postEnroll(PostVO post);
	
	/* 포스트 리스트 */
	public List<PostVO> postGetList(PostCriteria postcri);
	
	/* 포스트 총 개수 */
	public int postGetTotal(PostCriteria postcri);	
	
	/* 포스트 하나 가져오기 */
	public PostVO postGetOne(int post_id);
	
	public List<SocialVO> socialByPostid(int post_id);
	
	/* 포스트 리스트 */
	public List<PostVO> postGetByMailList(PostCriteria postcri , String member_email);

}
