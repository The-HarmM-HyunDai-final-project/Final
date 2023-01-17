package com.theharmm.service.impl;

import org.springframework.stereotype.Service;

import com.theharmm.mapper.BuyMapper;
import com.theharmm.service.BuyService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class BuyServiceImpl implements BuyService{
	
	private BuyMapper buyMapper;

}
