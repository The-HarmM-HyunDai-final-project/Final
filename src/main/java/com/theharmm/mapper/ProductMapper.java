package com.theharmm.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.theharmm.vo.product.ProductVo;


@Mapper
public interface ProductMapper {
	// 카테고리, 브랜드, 페이징 처리 파라미터를 해시맵에 담아 제품 리스트 출력
		public List<ProductVo> selectProducts(HashMap<String, Object> categoryPager);
		public int countProducts(HashMap<String, Object> categoryPager);
}
