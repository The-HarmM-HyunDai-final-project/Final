package com.theharmm.service;

import java.util.List;

import com.theharmm.domain.BuySaleToday;
import com.theharmm.domain.CountToday;
import com.theharmm.domain.ProductDTO;
import com.theharmm.domain.RegisterToday;

public interface AdminService {
	public List<CountToday> countToday();
	
	public List<RegisterToday> registerToday();
	
	public List<BuySaleToday> buyToday();
	
	public List<BuySaleToday> saleToday();
	
	public List<ProductDTO> getProductList();
}
