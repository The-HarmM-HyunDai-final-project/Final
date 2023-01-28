package com.theharmm.domain;

import java.sql.Date;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class SellDTO {

	private String saleid; 
	private String member_email; 
	private int pid; 
	private int price; 
	private String size_type; 
	private String status1;
	private String status2;
	private String status3;
	private Date regdate;
	private int member_buy_no;  
}
