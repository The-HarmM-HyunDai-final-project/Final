package com.theharmm.domain;

import java.sql.Date;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class BrandChatMessageDTO {
	private int chat_no;
	private int room_no;
	private String member_email;
	private String chat_message;
	private Date chat_date;
	
	
	private String brand;
	private String member_name;
	private String member_nickname;
	

}
