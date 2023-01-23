package com.theharmm.domain;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class MemberAddressDTO {
	
	
	private String member_email; //회원이메일
	private String name;   //이름
	private String phone_number; //휴대폰번호
	private String zip_number; //우편번호 
	private String sub_address;//주소
	private String detail_address;//상세주소
	private String default_address;//기본배송지여부

}
