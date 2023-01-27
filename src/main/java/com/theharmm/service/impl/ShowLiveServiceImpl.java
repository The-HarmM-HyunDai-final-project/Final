package com.theharmm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.theharmm.domain.ShowLiveBiddingDTO;
import com.theharmm.domain.ShowLiveChannelDTO;
import com.theharmm.domain.ShowLiveChatDTO;
import com.theharmm.mapper.MemberMapper;
import com.theharmm.mapper.ShowLiveMapper;
import com.theharmm.service.ShowLiveService;
import com.theharmm.showlive.ShowLiveChannel;
import com.theharmm.showlive.ShowLiveChannelStore;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class ShowLiveServiceImpl implements ShowLiveService{
	
	@Autowired
	private ShowLiveMapper showLivemapper;
	
	@Autowired
	private ShowLiveChannelStore showLiveChannelStore;
	
	@Override
	public void addSocket() {
		// 
	}
	
	//쇼라이브 채널 생성
	@Override
	public Integer createChannel(ShowLiveChannelDTO channel) {
		showLivemapper.createChannel(channel);
		showLiveChannelStore.createNewChannel(channel);
		log.warn("지금까지 채널은 다음과 같습니다" + showLiveChannelStore.getChannelList().toString());
		
		return channel.getShowlive_no();
	}
	//채팅넣기
	@Override
	public void insertChat(ShowLiveChatDTO chat) {
		showLivemapper.insertChat(chat);
	}
	//경매요청넣기
	@Override
	public void insertAuction(ShowLiveBiddingDTO bid) {
		showLivemapper.insertAuction(bid);
		
	}
	//라이브중인 쇼라이브 목록 가져오기
	@Override
	public List<ShowLiveChannelDTO> getLiveChannels() {
		//DB에서 생방 상태인 채널들을 가져오는게 아니라 ShowLiveChannelStore에 등록되있는 채널 즉 생방중인 목록을 가져오게 하자
		List<ShowLiveChannelDTO> channelList = showLivemapper.getLiveChannels();
		log.warn("채널목록들 !!! : " + channelList.toString());
		return channelList;
	}
	//방 번호로 쇼라이브 목록 가져오기
	@Override
	public ShowLiveChannelDTO getChannelDTOByRoomNo(String roomNo) {
		ShowLiveChannelDTO channel = showLiveChannelStore.getChannelDTOByRoomNo(roomNo);
		return channel;
	}

	//쇼라이브 라이브 상태 변경
	@Override
	public int changeLiveStatus(ShowLiveChannelDTO channel) {
		return showLivemapper.changeLiveStatus(channel);
	}



}
