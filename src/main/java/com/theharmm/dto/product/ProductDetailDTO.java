package com.theharmm.dto.product;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class ProductDetailDTO {
	
	private int pid;
	private int category;
	private String brand;
	private String pname_e;
	private String pname_k;
	private int bg_r;
	private int bg_g;
	private int bg_b;
	private String model_number;
	private String release_date;
	private String color;
	private String release_price;
	private String img1;
	private String img2;
	private String img3;
	private String img4;
	private String img5;
	
	

}
