package com.theharmm.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.theharmm.domain.ShowLiveAuctionFinalPersonDTO;
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
	//최종 낙찰 넣기
	public void insertAuctionFinalPerson(ShowLiveAuctionFinalPersonDTO finalPerson);
	//Room번호로 해당 채널을 가져오기
	public ShowLiveChannelDTO getChannelDTOByRoomNo(String roomNo);
	//라이브중인 쇼라이브 목록 가져오기
	public List<ShowLiveChannelDTO> getLiveChannels();
	//라이브중인 쇼라이브 목록 가져옥 - ShowLiveChannelStore에 저장된 channelDTO들은 모두 생방송인걸로 생각하니까 Store에서 channelDTO를 가져옴
	public List<ShowLiveChannelDTO> getLiveChannelsFromChannelStore();
	//쇼라이브 라이브 상태 변경
	public int changeLiveStatus(ShowLiveChannelDTO channel);
	//방금 생선된 라이브쇼 객체 가져오기
	public ShowLiveChannelDTO getShowLiveChannelInfo();
}

