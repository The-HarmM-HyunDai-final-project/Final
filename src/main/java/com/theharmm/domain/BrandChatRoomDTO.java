package com.theharmm.domain;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class BrandChatRoomDTO {
	private int room_no;
	private String brand;
	private String brand_img;
	private String room_info;
	private int member_count;
	
	

}
