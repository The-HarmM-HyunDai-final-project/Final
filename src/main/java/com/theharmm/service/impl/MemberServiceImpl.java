package com.theharmm.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.theharmm.domain.AuthVO;
import com.theharmm.domain.MemberVO;
import com.theharmm.mapper.MemberMapper;
import com.theharmm.service.MemberService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@AllArgsConstructor
@Log4j
public class MemberServiceImpl implements MemberService{

	@Autowired
	private MemberMapper mapper;
	//회원가입 (회원과 인증테이블 동시에 값을 넣음)
	@Override
	public void joinMember(MemberVO member) {
		//위의 어노테이션으로 하나의 Transaction으로 묶임
		//따라서 둘중 하나의 테이블에만 삽입 되었을때 다 취소 
		
		AuthVO auth = new AuthVO();
		auth.setUsername(member.getMember_email());
		auth.setAuthority("ROLE_MEMBER");
		
		int result1 = mapper.joinMember(member);
		int result2 = mapper.joinMemberAuthority(auth);
		if( result1 == 1 && result2 == 1) {
			log.info("회원가입이 잘 되었네용");
		}
	}
	//이메일 중복 체크
	@Override
	public int checkEmail(MemberVO member) {
		return mapper.checkEmail(member);
	}
	//닉네임 중복 체크
	@Override
	public int checkNickName(MemberVO member) {
		// TODO Auto-generated method stub
		return mapper.checkNickName(member);
	}

	//로그인
	@Override
	public MemberVO login(MemberVO member) {
		return mapper.login(member);
	}
	//회원정보 및 권한까지 가져오기
	@Override
	public MemberVO read(MemberVO member) {
		return mapper.read(member);
	}


	
	
}
