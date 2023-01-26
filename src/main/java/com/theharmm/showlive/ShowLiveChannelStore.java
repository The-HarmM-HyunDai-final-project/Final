package com.theharmm.showlive;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.stereotype.Component;
import org.springframework.web.socket.WebSocketSession;

import com.theharmm.domain.ShowLiveChannelDTO;

import lombok.extern.log4j.Log4j;

@Component
@Log4j
public class ShowLiveChannelStore {

	// 채팅방 목록 <방 번호, ArrayList<session> >
	//ConcurrentHashMap은 Map이지만 간단하게 설명하면 Multi-Thread환경에서 사용할수 있으며 검색,업데이트시 동시성 성능 높이기위한 클래스 자세한 설명은 각자 검색
	private Map<String, ShowLiveChannel> RoomList = new ConcurrentHashMap<String, ShowLiveChannel>();
	
	private Map<String, String> roomNoOfBJ = new HashMap<String, String>();
	
	public ShowLiveChannel getChannelByRoomNo(String roomNo) {
		ShowLiveChannel showLiveChannel = RoomList.get(roomNo);
		return showLiveChannel;
	}
	
	public String getRoomNoById(String BJId) {
		return roomNoOfBJ.get(BJId);
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
		//방 생성 로직에서는 방장의 session을 가져올 수 없으므로 우선 id, roomNo로 매핑 시켜 놓기
		roomNoOfBJ.put(channel.getShow_host(), Integer.toString(channel.getShowlive_no()));

		//채널 생성후 RoomList에 넣기로직
		RoomList.put(Integer.toString(channel.getShowlive_no()), ShowLiveChannel.createForService(channel));
	}
	
	public Map<String, ShowLiveChannel> getChannelList(){
		return RoomList;
	}
	
}
