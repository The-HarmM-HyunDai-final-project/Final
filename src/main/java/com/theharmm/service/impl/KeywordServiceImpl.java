package com.theharmm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.theharmm.domain.KeywordDTO;
import com.theharmm.mapper.KeywordMapper;
import com.theharmm.mapper.ProductDetailMapper;
import com.theharmm.service.KeywordService;
import com.theharmm.service.ProductDetailService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

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
