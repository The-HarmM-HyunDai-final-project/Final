package com.theharmm.domain;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class MemberAddressDTO {
	
	
	private String member_email;
	private String name;   
	private String phone_number;
	private String zip_number;
	private String sub_address;
	private String detail_address;
	private String default_address;

}
