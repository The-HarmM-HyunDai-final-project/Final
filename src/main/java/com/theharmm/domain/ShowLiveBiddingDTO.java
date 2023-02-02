package com.theharmm.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ShowLiveBiddingDTO {
	private int bid_no;
	private int showlive_no;
	private String user_name;
	private int suggest_price;
	private Date suggest_date;
}
