package com.theharmm.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.theharmm.domain.ShowLiveBiddingDTO;
import com.theharmm.domain.ShowLiveChannelDTO;
import com.theharmm.domain.ShowLiveChatDTO;
import com.theharmm.mapper.ProductMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;


public interface ShowLiveService {
	public void addSocket();
	
	//쇼라이브 채널 생성
	public Integer createChannel(ShowLiveChannelDTO channel);
	//채팅넣기
	public void insertChat(ShowLiveChatDTO chat);
	//경매요청넣기
	public void insertAuction(ShowLiveBiddingDTO bid);
	//라이브중인 쇼라이브 목록 가져오기
	public List<ShowLiveChannelDTO> getLiveChannels();
}
