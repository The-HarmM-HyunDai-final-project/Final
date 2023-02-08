package com.theharmm.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.theharmm.domain.ChatMessageDTO;
import com.theharmm.domain.ChatRoomDTO;
import com.theharmm.mapper.AdminChatMapper;
import com.theharmm.service.AdminChatService;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
/*신미림 작성*/

@Service
@AllArgsConstructor
@Slf4j
public class AdminChatServiceImpl implements AdminChatService {
	@Autowired
	private AdminChatMapper adminChatMapper;
	
	@Override
	public ChatRoomDTO getChatRoom(int room_no) throws Exception {
		try {
			return adminChatMapper.getChatRoom(room_no);
		} catch (Exception e) {
			log.info(e.getMessage());
			throw e;
		}
		
	}

	@Override
	public int addMessage(ChatMessageDTO chatMessage) throws Exception {
		try {
			return adminChatMapper.addMessage(chatMessage);
		} catch (Exception e) {
			log.info(e.getMessage());
			throw e;
		}
	}


	@Override
	public List<ChatMessageDTO> selectClientChatHistory(Map<String, Object> map) throws Exception {
		try {
			return adminChatMapper.selectClientChatHistory(map);
		} catch (Exception e) {
			log.info(e.getMessage());
			throw e;
		}
	}


	@Override
	public ChatRoomDTO addChatRoom(String member_email) throws Exception {
		try {
			ChatRoomDTO chatRoomDTO = null;
			int result = adminChatMapper.addChatRoom(member_email);
			if(result != 0) {
				chatRoomDTO = adminChatMapper.selectCurrentMemberChatRoom(member_email);
			}
			return chatRoomDTO;
		} catch (Exception e) {
			log.info(e.getMessage());
			throw e;
		}
	}

	@Override
	public ChatRoomDTO selectCurrentMemberChatRoom(String member_email) throws Exception {
		try {
			return adminChatMapper.selectCurrentMemberChatRoom(member_email);
		}catch (Exception e) {
			log.info(e.getMessage());
			throw e;
		}
	}

}
