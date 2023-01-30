package com.theharmm.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.theharmm.domain.ShowLiveAuctionFinalPersonDTO;
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
	//최종 낙찰 넣기
	public void insertAuctionFinalPerson(ShowLiveAuctionFinalPersonDTO finalPerson);
	//라이브중인 쇼라이브 목록 가져오기
	public List<ShowLiveChannelDTO> getLiveChannels();
	//쇼라이브 라이브 상태 변경
	public int changeLiveStatus(ShowLiveChannelDTO channel);
	//방금 생선된 라이브쇼 객체 가져오기
	public ShowLiveChannelDTO getShowLiveChannelInfo();
}	
