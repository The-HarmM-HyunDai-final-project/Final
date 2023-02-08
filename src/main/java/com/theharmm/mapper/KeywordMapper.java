package com.theharmm.mapper;

import java.util.List;

import com.theharmm.domain.KeywordDTO;
import com.theharmm.domain.ProductDTO;
/*신미림 작성*/
public interface KeywordMapper {

	//키워드 가지고 오기 
	public List<KeywordDTO> selectPosKeywordBest(int pid);
	
	//키워드 가지고 오기 
    public List<KeywordDTO> selectNegKeywordBest(int pid);
}
