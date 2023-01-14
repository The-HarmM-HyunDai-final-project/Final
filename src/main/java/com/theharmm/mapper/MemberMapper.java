package com.theharmm.mapper;

import com.theharmm.domain.AuthVO;
import com.theharmm.domain.MemberVO;

public interface MemberMapper {
	
	//회원가입
	public int joinMember(MemberVO member);
	//회원가입에서 인증까지 주기
	public int joinMemberAuthority(AuthVO auth);
	//로그인
	public MemberVO login(MemberVO member);
	//회원정보, 인증 가져오기
	public MemberVO read(MemberVO member);
}
