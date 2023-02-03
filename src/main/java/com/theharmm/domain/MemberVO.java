package com.theharmm.domain;

import java.util.List;

import lombok.Data;

@Data
public class MemberVO {
	
	private String member_grade;
	private String member_email;
	private String member_password;
	private String member_name;
	private String member_nickname;
	private String member_phone;
	private int member_shoes_size;
	private String member_register;
	private String member_login;
	private String member_messege_info;
	private String member_email_info;
	
	private List<MemberAuthVO> authList;
	
	private String naverid;
}
