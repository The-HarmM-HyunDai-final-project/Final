package com.theharmm.domain;

import java.util.Date;

import lombok.Data;

@Data
public class AlarmDTO {
	int alarmid;
	String cmd;
	String caller; 
	String receiver;
	String receiverEmail;
	String seq;	
}
