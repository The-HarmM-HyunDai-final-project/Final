package com.theharmm.util;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import lombok.Builder;

@Builder
public class JoinUtil {
	
	public String GetCurDate() {
	    LocalDate now = LocalDate.now();	    								// ���� ��¥ ���ϱ�
	    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy/MM/dd");// ���� ����
	    String formatedNow = now.format(formatter);	    						// ���� ����
	    
		return formatedNow;
	}

}
