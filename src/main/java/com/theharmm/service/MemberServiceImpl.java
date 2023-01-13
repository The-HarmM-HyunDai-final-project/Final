package com.theharmm.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.theharmm.domain.MemberVO;
import com.theharmm.mapper.MemberMapper;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class MemberServiceImpl implements MemberService{

	@Autowired
	private MemberMapper mapper;
	
	@Override
	public MemberVO login(MemberVO member) {
		return mapper.login(member);
	}
}
