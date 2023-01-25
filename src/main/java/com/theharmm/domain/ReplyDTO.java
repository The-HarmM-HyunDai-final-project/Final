package com.theharmm.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ReplyDTO {
	int sid;
	String member_email;
	int post_id;
	String content;
	int parent_id;
	int depth;
	private Date regdate; // 작성 날짜
}
