package com.theharmm.domain;

import java.sql.Date;

import lombok.Data;
import lombok.NoArgsConstructor;
/*신미림 작성*/
@Data 
@NoArgsConstructor
public class KeywordDTO {

	private String keyword;
	private int count; 
	private int pid; 
	private String sentiment_result;
}
