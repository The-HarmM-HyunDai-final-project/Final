package com.theharmm.showlive;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.stereotype.Component;
import org.springframework.web.socket.WebSocketSession;

import com.theharmm.domain.ShowLiveChannelDTO;

import lombok.extern.log4j.Log4j;

@Component
@Log4j
public class ShowLiveChannelStore {

	// 채팅방 목록 <방 번호, ShowLiveChannelDTO>
	private Map<String, ShowLiveChannelDTO> channelDTOList = new ConcurrentHashMap<String, ShowLiveChannelDTO>();
	// 채팅방 목록 <방 번호, ArrayList<session> >
	//ConcurrentHashMap은 Map이지만 간단하게 설명하면 Multi-Thread환경에서 사용할수 있으며 검색,업데이트시 동시성 성능 높이기위한 클래스 자세한 설명은 각자 검색
	private Map<String, ShowLiveChannel> RoomList = new ConcurrentHashMap<String, ShowLiveChannel>();
	//BJ아이디, BJ가 만든 방번호
	private Map<String, String> roomNoOfBJ = new HashMap<String, String>();
	
	//시청자가 방입장을 요청할때 그 방이 있는지를 DTO로 가져오게끔 하자
	public ShowLiveChannelDTO getChannelDTOByRoomNo(String roomNo) {
		ShowLiveChannelDTO showLiveChannel = channelDTOList.get(roomNo);
		return showLiveChannel;
	}
	//방번호로 채널 그 자체를 반환하게끔!
	public ShowLiveChannel  getChannelByRoomNo(String roomNo) {
		ShowLiveChannel showLiveChannel = RoomList.get(roomNo);
		return showLiveChannel;
	}
	
	public String getRoomNoById(String BJId) {
		return roomNoOfBJ.get(BJId);
	}
	//BJ가 방을 나가거나 방송 종료를 하면 방송 채털을 지우고 방번호를 저장한 roomNoOfBJ의 값도 지워주자!
	public void removeBJandRoomNoandChannel(String BJId, String roomNo) {
		channelDTOList.remove(roomNo);
		RoomList.remove(roomNo);
		roomNoOfBJ.remove(BJId);
	}
	
	
	//채널 저장소니까 채널번호로 채널을 가지고오도록
	public ShowLiveChannel getChannelAndAddUser(WebSocketSession session, String userId, String roomNo) {
		ShowLiveChannel showliveChannel = RoomList.get(roomNo);
		
		log.warn(RoomList.toString());
		
		//만약 해당 룸번호로 채널객체가 없다면 만들어주고 해당 유저를 넣어주고 채널 반환
		if(showliveChannel == null) {
			showliveChannel = ShowLiveChannel.create(roomNo);
			showliveChannel.addSession(session, userId);
			RoomList.put(roomNo, showliveChannel);
		}else {
			showliveChannel.addSession(session, userId);
		}
		
		return showliveChannel;
	}
	
	public void createNewChannel(ShowLiveChannelDTO channel) {
		//생성할때 DTO도 넣어야지
		channelDTOList.put(Integer.toString(channel.getShowlive_no()), channel);
		//방 생성 로직에서는 방장의 session을 가져올 수 없으므로 우선 id, roomNo로 매핑 시켜 놓기
		roomNoOfBJ.put(channel.getShow_host(), Integer.toString(channel.getShowlive_no()));
		//채널 생성후 RoomList에 넣기로직
		RoomList.put(Integer.toString(channel.getShowlive_no()), ShowLiveChannel.createForService(channel));
	}
	
	public Map<String, ShowLiveChannel> getChannelList(){
		return RoomList;
	}
	public List<ShowLiveChannelDTO> getChannelDTO(){
		List<ShowLiveChannelDTO> channelList = new ArrayList<ShowLiveChannelDTO>();
		for(String roomNo : channelDTOList.keySet()) {
			channelList.add(channelDTOList.get(roomNo));
		}
		return channelList;
	}
	
}
