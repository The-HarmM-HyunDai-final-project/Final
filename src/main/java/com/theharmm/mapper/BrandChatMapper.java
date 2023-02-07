package com.theharmm.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.theharmm.domain.BrandChatMessageDTO;
import com.theharmm.domain.BrandChatRoomDTO;
import com.theharmm.domain.ChatMessageDTO;
import com.theharmm.domain.ChatRoomDTO;

public interface BrandChatMapper {
	BrandChatRoomDTO getChatRoom(int room_no) throws SQLException;

	int addMessage(BrandChatMessageDTO chatMessage) throws SQLException;
	
	List<BrandChatRoomDTO> getChatRoomList(Map<String, Object> map) throws SQLException;

	List<BrandChatMessageDTO> selectChatHistory(Map<String, Object> map)throws SQLException;

	int addUserCount(int room_no)throws SQLException;

	int subtractUserCount(int room_no)throws SQLException;

	int selectRoomMemberCount(int room_no)throws SQLException;
}
