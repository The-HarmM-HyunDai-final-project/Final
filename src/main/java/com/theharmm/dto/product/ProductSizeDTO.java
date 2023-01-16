package com.theharmm.dto.product;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class ProductSizeDTO {
	
	//resell_product_size 테이블
	private int psid;         
	private int pid;
	private String model_number;
	private String model_size;
	private int s_price;
	private int s_stock;
	
	//sale 테이블
	private int saleid;
	private int price;

}
