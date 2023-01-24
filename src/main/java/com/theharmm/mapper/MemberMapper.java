package com.theharmm.mapper;

import com.theharmm.domain.MemberAuthVO;
import com.theharmm.domain.MemberVO;

public interface MemberMapper {
	
	//ȸ������
	public int joinMember(MemberVO member);
	
	//ȸ�����Կ��� �������� �ֱ�
	public int joinMemberAuthority(MemberAuthVO auth);
	
	//�̸��� �ߺ� ����
	public int checkEmail(MemberVO member);
	
	//�г��� �ߺ� ����
	public int checkNickName(MemberVO member);
	
	//�α���
	public MemberVO login(MemberVO member);
	
	//ȸ������, ���� ��������
	public MemberVO read(MemberVO member);
	
	// 로그인 후 로그인 시간 업데이트
	public void updateLoign(MemberVO member);
}
