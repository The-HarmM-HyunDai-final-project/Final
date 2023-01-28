package com.theharmm.mapper;

import java.util.List;

import com.theharmm.domain.PostCriteria;
import com.theharmm.domain.PostVO;
import com.theharmm.domain.SocialVO;

public interface PostMapper {
	
	/* 포스트 등록 */
	public void postEnroll(PostVO post);
	
	/* 이미지 등록 */
	public void socialEnroll(SocialVO vo);
	
	/* 포스 리스트 */
	public List<PostVO> postGetList(PostCriteria postcri);
	
	/* 포스트 총 개수 */
	public int postGetTotal(PostCriteria postcri);
	
	/* 사용자별 포스트 가져오기 */
	public PostVO postGetOne(int post_id);

}
