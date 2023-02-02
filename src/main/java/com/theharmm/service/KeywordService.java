package com.theharmm.service;

import java.util.List;
import java.util.Set;

import com.theharmm.domain.KeywordDTO;

public interface KeywordService {

	public List<KeywordDTO> selectPosKeywordBest(int pid);
	
	public List<KeywordDTO> selectNegKeywordBest(int pid);
	
}
