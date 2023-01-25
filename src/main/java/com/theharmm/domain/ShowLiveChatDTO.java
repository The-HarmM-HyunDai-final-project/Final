package com.theharmm.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ShowLiveChatDTO {
	private int chat_no;
	private int showlive_no;
	private String chat_user_id;
	private String chat_content;
	private Date chat_date;
}
