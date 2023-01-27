package com.theharmm.handler;

import java.io.IOException;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.theharmm.showlive.ShowLiveChannel;
import com.theharmm.showlive.ShowLiveChannelStore;
import com.theharmm.showlive.ShowLiveMessage;

import lombok.extern.log4j.Log4j;

@Log4j
public class BJChattingHandler extends TextWebSocketHandler{
	@Inject
	ShowLiveChannelStore showLiveChannelStore;
	
    //BJ가 소켓에 연결 되었을때 
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		log.warn("비제이 들어왔으요 ");
		//BJ id를 가지고옴
		String BJId = session.getPrincipal().getName();
		String roomNoOfBj = showLiveChannelStore.getRoomNoById(BJId);
		ShowLiveChannel showLiveChannel = showLiveChannelStore.getChannelByRoomNo(roomNoOfBj);
		
		//channel을 가져왔으니 이제 BJ의 session을 Channel에 넣어주기!
		if(showLiveChannel != null) {
			showLiveChannel.addBJSession(session, BJId);
		}
		//null이면 방을 만들어서 db에 저장도 안하고 ShowLiveStore에 저장도 안한거겠지!
		
		
		//일단 Store에 Channel이 잘 있는지 확인~
		log.warn("채널 개수 : " + showLiveChannelStore.getChannelList().keySet().size());
		log.warn(showLiveChannelStore.getChannelList().toString());
	}
	
	//웹 소켓 서버로 메세지를 전송했을 때 이 메서드가 호출된다. 현재 웹 소켓 서버에 접속한 Session모두에게 메세지를 전달해야 하므로 loop를 돌며 메세지를 전송함
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {

	}
	//BJ와 연결이 끊어진 경우(채팅방을 나간 경우)Channle을 삭제 해버리자
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		String BJId = session.getPrincipal().getName();
		String roomNoOfBj = showLiveChannelStore.getRoomNoById(BJId);
		ShowLiveChannel showLiveChannel = showLiveChannelStore.getChannelByRoomNo(roomNoOfBj);
		
		//사용자들에게 방송이 끝났다는걸 알리고 view에서는 아무 조작이 안되고 홈버튼 혹은 뒤로가기만 가능하게끔!
		
		//db에도 라이브 상태를 바꿔주고
		
		//store에서 channel을 완전 지워버리자!
		showLiveChannelStore.removeBJandRoomNoandChannel(BJId,roomNoOfBj);
		
		//지웠으면 Store에 잘 지워졌는지 확인!
		log.warn("채널 개수 : " + showLiveChannelStore.getChannelList().keySet().size());
		log.warn(showLiveChannelStore.getChannelList().toString());
	}
}
