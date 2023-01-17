package com.theharmm.handler;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.theharmm.security.domain.CustomUser;
import com.theharmm.showlive.MessageType;
import com.theharmm.showlive.ShowLiveChannel;
import com.theharmm.showlive.ShowLiveChannelStore;
import com.theharmm.showlive.ShowLiveMessage;

import lombok.extern.log4j.Log4j;

@Log4j
public class ChattingHandler2  extends TextWebSocketHandler{
	
	@Inject
	ShowLiveChannelStore showLiveChannelStore;
	
	// "Java Object" =Serialize=> "JSON" or "JSON" =Deserialize=> "Java Object" 역할을 맡음
	private final ObjectMapper objectMapper = new ObjectMapper();
	
    //라이브쇼에 들어온 총 인원
    private static int totalConnectedPerson;
    
    //사용자가 소켓에 연결 되었을때 
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		totalConnectedPerson++;
		
		//지금 접속한 유저를 session에서 Custom유저를 가지고와서 roomNo을 가지고옴
		Map<String,Object> map = session.getAttributes();
		String userId = session.getPrincipal().getName();
		String roomNo = (String)map.get("roomNo");
		//메세지 생성
		ShowLiveMessage showLiveMessage = createMessage(userId, roomNo, MessageType.ENTER);
		
		ShowLiveChannel showliveChannel = showLiveChannelStore.getChannelAndAddUser(session, userId, roomNo);
		showliveChannel.handleMessage(session, showLiveMessage);
		//log.warn(userId + "님이" + roomNo + " 방에 입장하셨습니다.");
		log.warn("쇼라이브 총 접속 인원 : " + totalConnectedPerson);
	}
	
	//웹 소켓 서버로 메세지를 전송했을 때 이 메서드가 호출된다. 현재 웹 소켓 서버에 접속한 Session모두에게 메세지를 전달해야 하므로 loop를 돌며 메세지를 전송함
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		log.warn("#ChattingHandler, handleMessage");
		
		//지금 접속한 유저를 session에서 Custom유저를 가지고와서 roomNo을 가지고옴
		Map<String,Object> map = session.getAttributes();
		String userId = session.getPrincipal().getName();
		String roomNo = (String)map.get("roomNo");
		
		//여기서 경매기능까지 들어올 경우 경매용인지 그냥 채팅용인지 구분하는 작업이 추후 필요
		
		//메세지 생성
		ShowLiveMessage showLiveMessage = createMessage(userId, roomNo, MessageType.TALK);
		showLiveMessage.setMessage(message.getPayload());
		
		log.warn(showLiveMessage.toString());
		ShowLiveChannel showliveChannel = showLiveChannelStore.getChannelByRoomNo(roomNo);
		showliveChannel.handleMessage(session, showLiveMessage);
	}
	//클라이언트와 연결이 끊어진 경우(채팅방을 나간 경우) remove로 해당 세션을 제거함
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		totalConnectedPerson--;
		
		//지금 접속한 유저를 session에서 Custom유저를 가지고와서 roomNo을 가지고옴
		Map<String,Object> map = session.getAttributes();
		String userId = session.getPrincipal().getName();
		String roomNo = (String)map.get("roomNo");
		
		//메세지 생성
		ShowLiveMessage showLiveMessage = createMessage(userId, roomNo, MessageType.LEAVE);
		
		ShowLiveChannel showliveChannel = showLiveChannelStore.getChannelByRoomNo(roomNo);
		showliveChannel.handleMessage(session, showLiveMessage);
		
		log.warn("쇼라이브 총 접속 인원 : " + totalConnectedPerson);
	}
	
	//커스텀 메시지를 생성하고 각 메서드에서 타입에 맞게 객체 바꾸깅
	public ShowLiveMessage createMessage(String userName, String roomNo, MessageType type) {
		ShowLiveMessage message = new ShowLiveMessage();
		message.setStudyUrl(roomNo);
		message.setUsername(userName);
		message.setType(type);
		
		return message;
	}
}
