package com.theharmm.service;

import com.theharmm.domain.MemberVO;

public interface MemberService {
	
	//ȸ������
	public void joinMember(MemberVO member);
	//�α���
	public MemberVO login(MemberVO member);
	//ȸ������, ���� ��������
	public MemberVO read(MemberVO member);
}
