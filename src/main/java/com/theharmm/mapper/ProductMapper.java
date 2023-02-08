package com.theharmm.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;


import com.theharmm.domain.ProductDTO;


@Mapper
public interface ProductMapper {
	// 카테고리, 브랜드, 페이징 처리 파라미터를 해시맵에 담아 제품 리스트 출력
	public List<ProductDTO> selectProducts(HashMap<String, Object> categoryPager); 
	// 카테고리, 브랜드 별 제품 개수
	public int countProducts(HashMap<String, Object> categoryPager);
	// pid로 제품 하나 가져오기
	public ProductDTO selectOneProduct(int pid);
}
