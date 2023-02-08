package com.theharmm.mapper;

import java.util.List;
import java.util.Map;

import com.theharmm.domain.BuyDTO;
import com.theharmm.domain.ProductDTO;
import com.theharmm.domain.ProductDetailDTO;
import com.theharmm.domain.ProductSizeDTO;
import com.theharmm.domain.SellDTO;
/*신미림 작성*/

public interface ProductDetailMapper{
	
		public ProductDetailDTO selectProductDetail(int pid);

		public List<ProductSizeDTO> selectSaleProductSizeList(ProductDetailDTO productDetailDTO);

		public ProductSizeDTO selectSaleProductSize(Map<String, Object> productInfoMap);
		
		
		//구매, 판매관련

		public List<ProductSizeDTO> selectBuyProductSizeList(ProductDetailDTO productDetailDTO);

		public ProductSizeDTO selectBuyProductSize(Map<String, Object> productInfoMap);

		public Long updateBuyOrder(Map<String, Object> saleInfoMap);

		public Long updateSaleOrder(Map<String, Object> buyInfoMap);

		public Long insertSaleOrder(Map<String, Object> saleInfoMap);

		public Long insertBuyOrder(Map<String, Object> buyInfoMap);

		
		//상품상세페이지 구매 판매 가격 
		public BuyDTO selectMaxBuyProductPrice(int pid);
		
		public SellDTO selectMinSellProductPrice(int pid);
		
		
		//체결거래, 판매입찰, 구매입찰 
		public List<BuyDTO> selectAllSignContract(int pid);
		
		public List<BuyDTO> selectAllBuyBid(int pid);
		
		public List<SellDTO> selectAllSellBid(int pid);
		
		//같은 브랜드 리스트
		public List<ProductDTO> selectProductBrandList(int pid);

		//다음 결제번호 조회
		public int selectPaySeqNextVal();

		public List<ProductDTO> selectProductList();

}
