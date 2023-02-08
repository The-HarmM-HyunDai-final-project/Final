package com.theharmm.service.impl;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.theharmm.domain.KeywordDTO;
import com.theharmm.mapper.KeywordMapper;
import com.theharmm.service.KeywordService;


import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
/*신미림 작성*/
@Log4j
@Service
@AllArgsConstructor
public class KeywordServiceImpl implements KeywordService{
	
	@Autowired
	private KeywordMapper keywordMapper;
	
	@Override
	public List<KeywordDTO> selectPosKeywordBest(int pid) {
		
		return keywordMapper.selectPosKeywordBest(pid);
	}
	

	@Override
	public List<KeywordDTO> selectNegKeywordBest(int pid) {
		
		return keywordMapper.selectNegKeywordBest(pid);
	}

	

}
