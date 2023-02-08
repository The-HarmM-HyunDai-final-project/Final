package com.theharmm.domain;

import lombok.Data;

@Data
public class ProductDTO {
	private int pid; // 제품 id
	private int category; // 제품 카테고리
	private String brand; // 브랜드
	private String pname_e; // 제품 영어 이름
	private String pname_k; // 제품 한국 이름
	private String model_number; // 모델 번호
	private String release_date; // 발매일
	private String color; // 색깔
	private String release_price; // 발매 가격
	private String img1; 
	private String img2;
	private String img3;
	private String img4;
	private String img5;	
}
