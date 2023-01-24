package com.theharmm.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ShowLiveChannelDTO {
	private int showlive_no;
	private String showlive_name;
	private String show_host;
	private String product_name;
	private int live_status;
	private Date showlive_start_date;
	private Date showlive_end_date;
	private int showlive_start_price;
	private String restricted_grade;
	private String aws_stream_key;
	private String aws_endpoint;
	private String aws_channel_url;
	private String prouct_img1;
	private String prouct_img2;
	private String prouct_img3;
}
