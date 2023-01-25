package com.theharmm.mapper;

import java.util.Map;

import com.theharmm.domain.AccountDTO;
import com.theharmm.domain.MemberAddressDTO;

public interface MemberInfoMapper {
	
	public MemberAddressDTO selectMemberMainAddress(Map<String, Object> memberInfoMap);
	
	public AccountDTO selectMemberMainAccount(Map<String, Object> memberInfoMap);

	public int mergeAccount(AccountDTO accountDTO);

	public AccountDTO selectMemberAccount(Map<String, Object> accountInfoMap);
}
