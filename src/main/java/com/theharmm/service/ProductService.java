package com.theharmm.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.theharmm.domain.ProductCriteria;
import com.theharmm.domain.ProductPageDTO;
import com.theharmm.domain.ProductVo;
import com.theharmm.mapper.ProductMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class ProductService {
	private ProductMapper mapper;
	

}
