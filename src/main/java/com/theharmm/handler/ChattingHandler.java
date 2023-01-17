package com.theharmm.handler;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import javax.servlet.http.HttpSession;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.theharmm.security.domain.CustomUser;

import lombok.extern.log4j.Log4j;

@Log4j
public class ChattingHandler  extends TextWebSocketHandler{
	
	// "Java Object" =Serialize=> "JSON" or "JSON" =Deserialize=> "Java Object" 역할을 맡음
	//private final ObjectMapper objectMapper = new ObjectMapper();
	
	// 채팅방 목록 <방 번호, ArrayList<session> >
	//ConcurrentHashMap은 Map이지만 간단하게 설명하면 Multi-Thread환경에서 사용할수 있으며 검색,업데이트시 동시성 성능 높이기위한 클래스 자세한 설명은 각자 검색
	//private Map<String, ArrayList<WebSocketSession>> RoomList = new ConcurrentHashMap<String, ArrayList<WebSocketSession>>();
	
	// session, 방 번호가 들어간다.
	// private Map<WebSocketSession, String> sessionList = new ConcurrentHashMap<WebSocketSession, String>();    
	private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
    
    //라이브쇼에 들어온 총 인원
    //private static int totalConnectedPerson;
    
    //각 방마다 인원수
    //private Map<String, Integer> RoomsPersons = new ConcurrentHashMap<String, Integer>();
    
	//채팅을 위해 해당 페이지에 들어오면(본 포스트에서는 /chat) 클라이언트가 연결된 후 해당 클라이언트의 세션을 sessionList에 add함
	
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
//		totalConnectedPerson++;
//		log.info("쇼라이브 총 접속 인원 : " + totalConnectedPerson);
		
		//CustomUser user = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		
		
		log.info(session.getPrincipal().toString());
		//log.info(user.getRoomNo());
	
		log.warn(" 여기는 핸들러 입장");
		sessionList.add(session);
		
		//log.info(session.getPrincipal().getName() + "님이" + user.getRoomNo() + " 방에 입장하셨습니다.");
	}
	
	//웹 소켓 서버로 메세지를 전송했을 때 이 메서드가 호출된다. 현재 웹 소켓 서버에 접속한 Session모두에게 메세지를 전달해야 하므로 loop를 돌며 메세지를 전송함
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		log.warn("#ChattingHandler, handleMessage");
		log.warn(session.getId() + ": " + message);
		
		
		for(WebSocketSession s : sessionList) {
			s.sendMessage(new TextMessage(session.getPrincipal().getName() + ": " + message.getPayload()));
		}
		
		
	}
	//클라이언트와 연결이 끊어진 경우(채팅방을 나간 경우) remove로 해당 세션을 제거함
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		log.info("#ChattingHandler, afterConnectionClosed");

		sessionList.remove(session);
		
		log.info(session.getPrincipal().getName() + "님이 퇴장하셨습니다.");
	}
}
