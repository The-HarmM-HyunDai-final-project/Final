package com.theharmm.service;

import com.theharmm.domain.MemberVO;

public interface MemberService {
	
	//ȸ������
	public int joinMember(MemberVO member);
	//�̸���üũ
	public int checkEmail(MemberVO member);
	//�г��� �ߺ� ����
	public int checkNickName(MemberVO member);
	//�α���
	public MemberVO login(MemberVO member);
	//ȸ������, ���� ��������
	public MemberVO read(MemberVO member);
	
}
