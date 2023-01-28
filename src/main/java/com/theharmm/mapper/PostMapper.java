package com.theharmm.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

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
	
	/* 사용자별 포스 리스트 */
	public List<PostVO> postGetByMailList(PostCriteria postcri, @Param("member_email")String member_email);
	
	/* member_id 별로 포스트 총 개수 */
	public int postGetByMailTotal(String member_emial);
	
	/* 팔로우 팔로잉 등록 */
	public int insertFollow (@Param("follower_id") String follower_id, @Param("following_id") String following_id);

	/* 멤버 별로 팔로워 불러오기 */
	public List<String> followerList (@Param("member_email") String member_email);
	
	/* 멤버 별로 팔로잉 불러오기 */
	public List<String> followingList (@Param("member_email") String member_email);
	
	/* 멤버 별로 팔로워 갯수 */
	public int followerTotal (@Param("member_email") String member_email);
	
	/* 멤버 별로 팔로잉 갯수 */
	public int followingTotal (@Param("member_email") String member_email);
	
	/* 팔로잉 취소 */
	public int deleteFollow(@Param("follower_id") String follower_id, @Param("following_id") String following_id);

	public List<PostVO> selectPositivePostList(int pid);

	public List<PostVO> selectNegativePostList(int pid);

}
