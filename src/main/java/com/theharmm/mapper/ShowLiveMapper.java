package com.theharmm.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.theharmm.domain.ShowLiveBiddingDTO;
import com.theharmm.domain.ShowLiveChannelDTO;
import com.theharmm.domain.ShowLiveChatDTO;
import com.theharmm.showlive.ShowLiveChannel;

public interface ShowLiveMapper {
	//쇼라이브 채널 생성
	public Integer createChannel(ShowLiveChannelDTO channel);
	//채팅넣기
	public void insertChat(ShowLiveChatDTO chat);
	//경매요청넣기
	public void insertAuction(ShowLiveBiddingDTO bid);
	//라이브중인 쇼라이브 목록 가져오기
	public List<ShowLiveChannelDTO> getLiveChannels();

}
