package com.theharmm.util;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import lombok.Builder;

@Builder
public class JoinUtil {
	
	public String GetCurDate() {
	    LocalDate now = LocalDate.now();	    								// 현재 날짜 구하기
	    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy/MM/dd");// 포맷 정의
	    String formatedNow = now.format(formatter);	    						// 포맷 적용
	    
		return formatedNow;
	}

}
