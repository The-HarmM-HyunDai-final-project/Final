package com.theharmm.service;

import java.util.List;
import java.util.Map;

import com.theharmm.domain.ChatMessageDTO;
import com.theharmm.domain.ChatRoomDTO;

public interface AdminChatService {
	ChatRoomDTO getChatRoom(int room_no) throws Exception;

	int addMessage(ChatMessageDTO chatMessage) throws Exception;

	List<ChatMessageDTO> selectClientChatHistory(Map<String, Object> map) throws Exception;

	ChatRoomDTO addChatRoom(String member_email) throws Exception;

	ChatRoomDTO selectCurrentMemberChatRoom(String member_email) throws Exception;
	
	

}
