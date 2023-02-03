package com.theharmm.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.theharmm.domain.MemberAuctionDTO;

import com.theharmm.domain.BuyDTO;

import com.theharmm.domain.MemberVO;
import com.theharmm.domain.SellDTO;

public interface MemberService {
	
	//회원가임
	public int joinMember(MemberVO member);
	//관리자 회원가입
	public int joinAdminMember(MemberVO admin);
	//이메일 중복여부 확인
	public int checkEmail(MemberVO member);
	//닉네임 중복여부 확인
	public int checkNickName(MemberVO member);
	//로그인
	public MemberVO login(MemberVO member);
	//유저 정보 가져오기
	public MemberVO read(MemberVO member);
	
	public void updateLogin(String member_email);
	
	public MemberVO getBySns(MemberVO member);
	
	// 낙찰내역 가져오기
	public List<MemberAuctionDTO> getShowLiveChannelDTOByAuction(String member_email);	
	
	//회원 구매내역 가져오기 
	public List<BuyDTO> selectMyBuyList(String member_email);
	//회원 판매내역 가져오기 
	public List<SellDTO> selectMySellList(String member_email);
}
