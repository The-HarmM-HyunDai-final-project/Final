package com.theharmm.mapper;

import java.util.List;

import com.theharmm.domain.BuySaleToday;
import com.theharmm.domain.CountToday;
import com.theharmm.domain.ProductDTO;
import com.theharmm.domain.RegisterToday;

public interface AdminMapper {
	// 오늘 방문자 수
	public List<CountToday> countToday();
	
	// 오늘 신규가입자 수
	public List<RegisterToday> registerToday();
	
	// 거래금액
	public List<BuySaleToday> buyToday();
		
	// 판매금액
	public List<BuySaleToday> saleToday();
	
	// 상품
	public List<ProductDTO> getProductList();
}
