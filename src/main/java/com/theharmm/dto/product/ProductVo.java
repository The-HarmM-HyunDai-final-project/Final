package com.theharmm.dto.product;

import lombok.Data;

@Data
public class ProductVo {
	private int pid;
	private int category; // view 만들어서 가져와야 함
	private String brand;
	private String pname_e;
	private String pname_k;
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
