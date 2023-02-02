package com.theharmm.service;

import java.util.List;
import java.util.Map;

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
   
   //긍정 리뷰 리스트 조회
   public List<PostVO> selectPositivePostList(int pid);

   //부정 리뷰 리스트 조회
   public List<PostVO> selectNegativePostList(int pid);

   
   /* 사용자별 포스트 리스트 */
   public List<PostVO> postGetByMailList(PostCriteria postcri , String member_email);
   
   /* 사용자별 포스트 리스트 갯수*/
   public int postGetByMailTotal(String member_email);
   
   /* 팔로우 삽입 */
   public int insertFollow(String follower, String following);
   
   /* 팔로워 가져오기 */
   public List<String> getFollowerList(String member_email);
   
   /* 팔로잉 가져오기 */
   public List<String> getFollowingList(String member_email);   
   
   /* 팔로워 갯수 세기 */
   public int countFollower(String member_email);
   
   /* 팔로잉 갯수 */
   public int countFollowing(String member_email);
   
   /* 팔로우 취소 */
   public int deleteFollow(String follower, String following);
   
   /* 팔로우 하고 있는 사람인지 아닌지 확인 */
   public boolean checkFollow(String follower, String following);

   /* 키워드 리스트 저장 */
   public int mergeKeywordList(PostVO post, List<String> keyword_list);

   /* 키워드를 포함한 리뷰 조회 */
   public List<PostVO> selectKeywordPostList(Map<String, Object> postInfo);



}