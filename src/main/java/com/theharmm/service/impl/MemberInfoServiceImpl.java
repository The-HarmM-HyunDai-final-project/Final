package com.theharmm.service.impl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.theharmm.domain.AccountDTO;
import com.theharmm.domain.MemberAddressDTO;
import com.theharmm.mapper.MemberInfoMapper;
import com.theharmm.service.MemberInfoService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@AllArgsConstructor
@Log4j
public class MemberInfoServiceImpl implements MemberInfoService{
	
	@Autowired
	MemberInfoMapper memberInfoMapper;
	
	@Override
	public MemberAddressDTO selectMemberMainAddress(Map<String, Object> memberInfoMap) {
		return memberInfoMapper.selectMemberMainAddress(memberInfoMap);
	}

	@Override
	public AccountDTO selectMemberMainAccount(Map<String, Object> memberInfoMap) {
		return memberInfoMapper.selectMemberMainAccount(memberInfoMap);
	}

	@Override
	public int mergeAccount(AccountDTO accountDTO) {
		return memberInfoMapper.mergeAccount(accountDTO);
	}


	
	
}
