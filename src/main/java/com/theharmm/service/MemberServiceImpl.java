package com.theharmm.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.theharmm.domain.AuthVO;
import com.theharmm.domain.MemberVO;
import com.theharmm.mapper.MemberMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@AllArgsConstructor
@Log4j
public class MemberServiceImpl implements MemberService{

	@Autowired
	private MemberMapper mapper;
	
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
	
	@Override
	public MemberVO login(MemberVO member) {
		return mapper.login(member);
	}

	@Override
	public MemberVO read(MemberVO member) {
		return mapper.read(member);
	}

	
	
}
