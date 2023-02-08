package com.theharmm.service;

import java.util.List;
import java.util.Set;

import com.theharmm.domain.KeywordDTO;
/*신미림 작성*/
public interface KeywordService {

	public List<KeywordDTO> selectPosKeywordBest(int pid);
	
	public List<KeywordDTO> selectNegKeywordBest(int pid);
	
}
