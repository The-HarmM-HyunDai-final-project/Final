package com.theharmm.mapper;

import com.theharmm.domain.AuthVO;
import com.theharmm.domain.MemberVO;

public interface MemberMapper {
	
	//ȸ������
	public int joinMember(MemberVO member);
	//ȸ�����Կ��� �������� �ֱ�
	public int joinMemberAuthority(AuthVO auth);
	//�α���
	public MemberVO login(MemberVO member);
	//ȸ������, ���� ��������
	public MemberVO read(MemberVO member);
}
