package com.theharmm.domain;

import java.sql.Date;

import lombok.Data;
import lombok.NoArgsConstructor;
/*신미림 작성*/
@Data
@NoArgsConstructor
public class ChatMessageDTO {
	private int chat_no;
	private int room_no;
	private String member_email;
	private String chat_message;
	private Date chat_date;
	
	
	
	private String room_host;
	private String member_name;
	private String member_nickname;
	
	private String chat_type;
	

}
