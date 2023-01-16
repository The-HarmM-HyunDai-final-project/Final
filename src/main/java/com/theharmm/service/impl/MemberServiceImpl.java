package com.theharmm.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.theharmm.domain.AuthVO;
import com.theharmm.domain.MemberVO;
import com.theharmm.mapper.MemberMapper;
import com.theharmm.service.MemberService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@AllArgsConstructor
@Log4j
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberMapper mapper;

	// ȸ������ (ȸ���� �������̺� ���ÿ� ���� ����)
	@Override
	public int joinMember(MemberVO member) {
		// ���� ������̼����� �ϳ��� Transaction���� ����
		// ���� ���� �ϳ��� ���̺��� ���� �Ǿ����� �� ���

		AuthVO auth = new AuthVO();
		auth.setUsername(member.getMember_email());
		auth.setAuthority("ROLE_MEMBER");

		int result1 = mapper.joinMember(member);
		int result2 = mapper.joinMemberAuthority(auth);
		if (result1 == 1 && result2 == 1) {
			log.info("ȸ�������� �� �Ǿ��׿�");
		}

		return result1 + result2;
	}

	// �̸��� �ߺ� üũ
	@Override
	public int checkEmail(MemberVO member) {
		return mapper.checkEmail(member);
	}

	// �г��� �ߺ� üũ
	@Override
	public int checkNickName(MemberVO member) {
		// TODO Auto-generated method stub
		return mapper.checkNickName(member);
	}

	// �α���
	@Override
	public MemberVO login(MemberVO member) {
		return mapper.login(member);
	}

	// ȸ������ �� ���ѱ��� ��������
	@Override
	public MemberVO read(MemberVO member) {
		return mapper.read(member);
	}

}
