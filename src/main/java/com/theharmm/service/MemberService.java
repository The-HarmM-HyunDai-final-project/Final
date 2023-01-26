package com.theharmm.service;

import com.theharmm.domain.MemberVO;

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
	
	public void updateLogin(MemberVO member);
	
}
