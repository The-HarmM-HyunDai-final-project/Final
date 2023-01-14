package com.theharmm.dto.product;

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
	private String b; 
	
}
