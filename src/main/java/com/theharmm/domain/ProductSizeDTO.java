package com.theharmm.domain;

import lombok.Data;
import lombok.NoArgsConstructor;
/*신미림 작성*/
@Data
@NoArgsConstructor
public class ProductSizeDTO {
	
	//resell_product_size 
	private int psid;         
	private int pid;
	private String model_number;
	private String model_size;
	private int s_price;
	private int s_stock;
	
	//sale
	private int saleid;
	private int price;
	
	//buy
	private int buyid;
	

}
