package com.theharmm.dto.product;

import java.sql.Date;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data 
@NoArgsConstructor
public class BuyDTO {

	private String buyid; 
	private String member_email; 
	private int pid; 
	private int price; 
	private String size_type; 
	private String status1;
	private String status2;
	private String status3;
	private Date regdate;
	private int member_sale_no;  
}
