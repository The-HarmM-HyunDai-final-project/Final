package com.theharmm.domain;

import java.sql.Date;

import lombok.Data;
import lombok.NoArgsConstructor;
/*신미림 작성*/
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
	private Date biddate; 
	private Date nowdate; 
	//상세페이지에 체결거래, 판매입찰, 구매입찰 탭에서 사용
	private int amount;
	private String img1;
	private String pname_e;
	private String pname_k;
}
