package com.theharmm.service;

import java.util.List;

import com.theharmm.domain.BuySaleToday;
import com.theharmm.domain.CountToday;
import com.theharmm.domain.MemberVO;
import com.theharmm.domain.ProductDTO;
import com.theharmm.domain.RegisterToday;
import com.theharmm.domain.ShowLiveChannelDTO;
import com.theharmm.domain.TopProduct;

public interface AdminService {
	public List<CountToday> countToday();
	
	public List<RegisterToday> registerToday();
	
	public List<BuySaleToday> buyToday();
	
	public List<BuySaleToday> saleToday();
	
	public List<ProductDTO> getProductList();
	
	public List<MemberVO> getMemberList();
	
	public List<TopProduct> getTop5BuyList();
	
	public List<TopProduct> getTop5SaleList();
	
	public void createChannel(ShowLiveChannelDTO channel);
}
