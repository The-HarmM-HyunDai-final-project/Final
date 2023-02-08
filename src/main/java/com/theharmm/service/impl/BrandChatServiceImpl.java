package com.theharmm.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.theharmm.domain.BrandChatMessageDTO;
import com.theharmm.domain.BrandChatRoomDTO;
import com.theharmm.mapper.BrandChatMapper;
import com.theharmm.service.BrandChatService;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

/*신미림 작성*/
@Service
@AllArgsConstructor
@Slf4j
public class BrandChatServiceImpl implements BrandChatService {
	@Autowired
	private BrandChatMapper brandChatMapper;
	
	@Override
	public BrandChatRoomDTO getChatRoom(int room_no) throws Exception {
		try {
			return brandChatMapper.getChatRoom(room_no);
		} catch (Exception e) {
			log.info(e.getMessage());
			throw e;
		}
		
	}
	

	@Override
	public List<BrandChatRoomDTO> getChatRoomList(Map<String, Object> map) throws Exception {
		try {
			return brandChatMapper.getChatRoomList(map);
		}catch (Exception e) {
			log.info(e.getMessage());
			throw e;
		}
	}

	@Override
	public int addMessage(BrandChatMessageDTO chatMessage) throws Exception {
		try {
			return brandChatMapper.addMessage(chatMessage);
		} catch (Exception e) {
			log.info(e.getMessage());
			throw e;
		}
	}


	@Override
	public List<BrandChatMessageDTO> selectChatHistory(Map<String, Object> map) throws Exception {
		try {
			return brandChatMapper.selectChatHistory(map);
		} catch (Exception e) {
			log.info(e.getMessage());
			throw e;
		}
	}


	@Override
	public int addUserCount(int room_no) throws Exception {
		try {
			return brandChatMapper.addUserCount(room_no);
		} catch (Exception e) {
			log.info(e.getMessage());
			throw e;
		}
	}


	@Override
	public int subtractUserCount(int room_no) throws Exception {
		try {
			return brandChatMapper.subtractUserCount(room_no);
		} catch (Exception e) {
			log.info(e.getMessage());
			throw e;
		}
	}


	@Override
	public int selectRoomMemberCount(int room_no) throws Exception {
		try {
			return brandChatMapper.selectRoomMemberCount(room_no);
		} catch (Exception e) {
			log.info(e.getMessage());
			throw e;
		}
	}




}
