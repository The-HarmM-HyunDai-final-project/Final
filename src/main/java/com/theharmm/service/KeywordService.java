package com.theharmm.service;

import java.util.List;


import com.theharmm.domain.KeywordDTO;

public interface KeywordService {

	List<KeywordDTO> selectKeywordBest(int pid);
}
