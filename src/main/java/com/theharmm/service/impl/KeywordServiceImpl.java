package com.theharmm.service.impl;

import java.util.List;

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
	private KeywordMapper keywordMapper;
	
	@Override
	public List<KeywordDTO> selectKeywordBest(int pid) {
		
		return keywordMapper.selectKeywordBest(pid);
	}

}
