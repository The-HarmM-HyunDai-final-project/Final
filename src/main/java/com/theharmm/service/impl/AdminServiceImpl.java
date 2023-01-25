package com.theharmm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.theharmm.domain.BuySaleToday;
import com.theharmm.domain.CountToday;
import com.theharmm.domain.ProductDTO;
import com.theharmm.domain.RegisterToday;
import com.theharmm.mapper.AdminMapper;
import com.theharmm.service.AdminService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;


@Service
@AllArgsConstructor
public class AdminServiceImpl implements AdminService {
	@Autowired
	private AdminMapper mapper;
	
	
	@Override
	public List<CountToday> countToday() {
		return mapper.countToday();
	}

	@Override
	public List<RegisterToday> registerToday() {
		return mapper.registerToday();
	}
	
	@Override
	public List<BuySaleToday> buyToday() {
		return mapper.buyToday();
	}
	
	@Override
	public List<BuySaleToday> saleToday() {
		return mapper.saleToday();
	}
	
	@Override
	public List<ProductDTO> getProductList() {
		return mapper.getProductList();
	}



}
