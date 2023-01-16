package com.theharmm.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ProductCriteria {

	private int pageNum; 
	private int amount; 


	private String type;
	private String bkeyword;
	private int ckeyword;
	private int startp;
	private int endp;
	private String ssize; 
	private String lsize;
	


	public String[] getTypeArr() {

		return (type == null) ? new String[] {} : type.split("");
	}// end getType..

	public ProductCriteria() {
		this(1, 10);
	}// end cri...

	public ProductCriteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}// end Cri
}//end class
