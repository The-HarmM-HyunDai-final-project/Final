package com.theharmm.domain;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class ChatRoomDTO {
	private int room_no;
	private String room_host;
	private int member_count;

}
