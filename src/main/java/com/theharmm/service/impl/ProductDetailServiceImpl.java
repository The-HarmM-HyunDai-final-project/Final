package com.theharmm.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.theharmm.domain.BuyDTO;
import com.theharmm.domain.ProductDTO;
import com.theharmm.domain.ProductDetailDTO;
import com.theharmm.domain.ProductSizeDTO;
import com.theharmm.domain.SellDTO;
import com.theharmm.mapper.ProductDetailMapper;
import com.theharmm.service.ProductDetailService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
/*신미림 작성*/
@Log4j
@Service
@AllArgsConstructor
public class ProductDetailServiceImpl implements ProductDetailService{
	
	private ProductDetailMapper productDetailMapper;
	

	@Override
	public ProductDetailDTO selectProductDetail(int pid) {
		return productDetailMapper.selectProductDetail(pid);
	}


	@Override
	public List<ProductSizeDTO> selectSaleProductSizeList(ProductDetailDTO productDetailDTO) {
		return productDetailMapper.selectSaleProductSizeList(productDetailDTO);
	}


	@Override
	public ProductSizeDTO selectSaleProductSize(Map<String, Object> productInfoMap) {
		return productDetailMapper.selectSaleProductSize(productInfoMap);
	}

	//판매관련 




	@Override
	public List<ProductSizeDTO> selectBuyProductSizeList(ProductDetailDTO productDetailDTO) {
		
		return productDetailMapper.selectBuyProductSizeList(productDetailDTO);
	}


	@Override
	public ProductSizeDTO selectBuyProductSize(Map<String, Object> productInfoMap) {
		
		return productDetailMapper.selectBuyProductSize(productInfoMap);
	}


	@Override
	public Long updateBuyOrder(Map<String, Object> saleInfoMap) {
		return productDetailMapper.updateBuyOrder(saleInfoMap);
	}


	@Override
	public Long updateSaleOrder(Map<String, Object> buyInfoMap) {
		return productDetailMapper.updateSaleOrder(buyInfoMap);
	}


	@Override
	public Long insertSaleOrder(Map<String, Object> saleInfoMap) {
		return productDetailMapper.insertSaleOrder(saleInfoMap);
	}


	@Override
	public Long insertBuyOrder(Map<String, Object> buyInfoMap) {
		return productDetailMapper.insertBuyOrder(buyInfoMap);
	}

	@Override
	public BuyDTO selectMaxBuyProductPrice(int pid) {
		return productDetailMapper.selectMaxBuyProductPrice(pid);
	}


	@Override
	public SellDTO selectMinSellProductPrice(int pid) {
		return productDetailMapper.selectMinSellProductPrice(pid);
	}


	@Override
	public List<BuyDTO> selectAllSignContract(int pid) {
		
		return productDetailMapper.selectAllSignContract(pid);
	}


	@Override
	public List<SellDTO> selectAllSellBid(int pid) {
		
		return productDetailMapper.selectAllSellBid(pid);
	}


	@Override
	public List<BuyDTO> selectAllBuyBid(int pid) {
		
		return productDetailMapper.selectAllBuyBid(pid);
	}


	@Override
	public List<ProductDTO> selectProductBrandList(int pid) {
		
		return productDetailMapper.selectProductBrandList(pid);
	}


	@Override
	public int selectPaySeqNextVal() {
		return productDetailMapper.selectPaySeqNextVal();
	}


	@Override
	public List<ProductDTO> selectProductList() {
		return productDetailMapper.selectProductList();
	}

}
