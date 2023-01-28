package com.theharmm.service;

import com.theharmm.domain.MemberVO;

public interface MemberService {
	
	//회원가입
	public int joinMember(MemberVO member);
	//이메일체크
	public int checkEmail(MemberVO member);
	//닉네임 중복 여부
	public int checkNickName(MemberVO member);
	//로그인
	public MemberVO login(MemberVO member);
	//회원정보, 인증 가져오기
	public MemberVO read(MemberVO member);
}
