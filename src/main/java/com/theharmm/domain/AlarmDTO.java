package com.theharmm.domain;

import java.util.Date;

import lombok.Data;

@Data
public class AlarmDTO {
	int alarmid; // 알람 id
	String cmd; // 알람 type
	String caller; // 알람 호출자
	String receiver; // 알람 수신자
	String receiverEmail; // 알람 수진자 email
	String seq;	// 알람에서 필요한 text
}
