package com.theharmm.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.theharmm.domain.ChatMessageDTO;
import com.theharmm.domain.ChatRoomDTO;
/*신미림 작성*/
public interface AdminChatMapper {
	ChatRoomDTO getChatRoom(int room_no) throws SQLException;

	int addMessage(ChatMessageDTO chatMessage) throws SQLException;

	List<ChatMessageDTO> selectClientChatHistory(Map<String, Object> map) throws SQLException;

	int addChatRoom(String member_email) throws SQLException;
	
	ChatRoomDTO selectCurrentMemberChatRoom(String member_email) throws SQLException;
}
