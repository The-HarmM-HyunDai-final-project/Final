package com.theharmm.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.theharmm.domain.MemberAuctionDTO;
import com.theharmm.domain.BuyDTO;
import com.theharmm.domain.MemberAuthVO;
import com.theharmm.domain.MemberVO;

public interface MemberMapper {
	
	//회원가입
	public int joinMember(MemberVO member);
	//서비스 부분에서만 사용할 인증VO 넣기
	public int joinMemberAuthority(MemberAuthVO auth);
	//관리자 회원가입때 여러개의 권한을 줄 때 사용
	public int joinAdminMemberAuthority(@Param("authVOList") List<MemberAuthVO> authVOList);
	//이메일 중복여부 확인
	public int checkEmail(MemberVO member);
	//닉네임 중복여부 확인
	public int checkNickName(MemberVO member);
	//로그인
	public MemberVO login(MemberVO member);
	//유저 정보 가져오기
	public MemberVO read(MemberVO member);
	
	// 로그인 후 로그인 시간 업데이트
	public void updateLoign(String member_email);
	// SNS
	public MemberVO getBySns(MemberVO member);
	// 낙찰내역 가져오기
	public List<MemberAuctionDTO> getShowLiveChannelDTOByAuction(@Param("member_email") String member_email);
	
	//회원 구매내역 가져오기 
	public List<BuyDTO> selectMyBuyList(String member_email);
}
