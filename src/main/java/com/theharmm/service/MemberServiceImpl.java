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
		//���� ������̼����� �ϳ��� Transaction���� ����
		//���� ���� �ϳ��� ���̺��� ���� �Ǿ����� �� ��� 
		
		AuthVO auth = new AuthVO();
		auth.setUsername(member.getMember_email());
		auth.setAuthority("ROLE_MEMBER");
		
		int result1 = mapper.joinMember(member);
		int result2 = mapper.joinMemberAuthority(auth);
		if( result1 == 1 && result2 == 1) {
			log.info("ȸ�������� �� �Ǿ��׿�");
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
