package com.theharmm.service;

import java.util.List;
import java.util.Set;

import com.theharmm.domain.KeywordDTO;

public interface KeywordService {

	List<KeywordDTO> selectKeywordBest(int pid);
	//자연어 처리 - 형태소 분석 (명사만 추출하기)
	Set<String> doWordNouns(String text) throws Exception;
}
