package com.theharmm.domain;

import lombok.Data;
import lombok.NoArgsConstructor;
/*신미림 작성*/
@Data
@NoArgsConstructor
public class AccountDTO {
	private String member_email; //회원이메일
	private String bank; //은행명
	private String bank_number; //계좌번호
	private String bank_name; //예금주

}
