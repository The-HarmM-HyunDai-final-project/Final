package com.theharmm.service;

import java.util.List;
import java.util.Map;

import com.theharmm.domain.BrandChatMessageDTO;
import com.theharmm.domain.BrandChatRoomDTO;
/*신미림 작성*/
public interface BrandChatService {
	
	List<BrandChatRoomDTO> getChatRoomList(Map<String, Object> map) throws Exception;
	
	BrandChatRoomDTO getChatRoom(int room_no) throws Exception;

	List<BrandChatMessageDTO> selectChatHistory(Map<String, Object> map) throws Exception;
	
	int addMessage(BrandChatMessageDTO chatMessage) throws Exception;
	
	int addUserCount(int room_no) throws Exception;
	
	int subtractUserCount(int room_no) throws Exception;
	
	int selectRoomMemberCount(int room_no) throws Exception;
	
	
	
	

}
