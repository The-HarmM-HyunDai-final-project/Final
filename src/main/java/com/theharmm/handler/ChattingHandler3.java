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
public class ChattingHandler3  extends TextWebSocketHandler{
	
	// "Java Object" =Serialize=> "JSON" or "JSON" =Deserialize=> "Java Object" 역할을 맡음
	private final ObjectMapper objectMapper = new ObjectMapper();
	
	// 채팅방 목록 <방 번호, ArrayList<session> >
	//ConcurrentHashMap은 Map이지만 간단하게 설명하면 Multi-Thread환경에서 사용할수 있으며 검색,업데이트시 동시성 성능 높이기위한 클래스 자세한 설명은 각자 검색
	private Map<String, ArrayList<WebSocketSession>> RoomList = new ConcurrentHashMap<String, ArrayList<WebSocketSession>>();
	
	// session, 방 번호가 들어간다.
	private Map<WebSocketSession, String> sessionsRoomNo = new ConcurrentHashMap<WebSocketSession, String>();    
	//private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
    
    //라이브쇼에 들어온 총 인원
    private static int totalConnectedPerson;
    
    //각 방마다 인원수
    private Map<String, Integer> RoomsPersonsCount = new ConcurrentHashMap<String, Integer>();

    //사용자가 소켓에 연결 되었을때 
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		totalConnectedPerson++;
		
		//지금 접속한 유저를 session에서 Custom유저를 가지고와서 roomNo을 가지고옴
		Map<String,Object> map = session.getAttributes();
		String roomNo = (String)map.get("roomNo");
		String username = session.getPrincipal().getName();
		
		//log.warn(map.toString());
		
		//접속한 사람들의 session을 담는 RoomList item이 없으면 룸번호로 ArrayList 생성(누군가 방에 처음 들어왔을때 생성됨)
		if(RoomList.get(roomNo) == null) {
			RoomList.put(roomNo, new ArrayList<WebSocketSession>());
		}
		//방에 누군가 처음 들어왔을때 그 방에 몇명들어가는지 생성
		if(RoomsPersonsCount.get(roomNo) == null) {
			RoomsPersonsCount.put(roomNo, 0);
		}
		
		//방번호로 사용자들(session들)이 담긴 배열에 지금 접속한 사용자 추가 
		RoomList.get(roomNo).add(session);
		//해당 사용자가 몇번 방에 들어가 있는지 추가
		sessionsRoomNo.put(session, roomNo);
		//해당 방에 인원수 추가
		RoomsPersonsCount.put(roomNo, RoomsPersonsCount.get(roomNo)+1) ;
		
		log.warn(roomNo + "번 방에 " + username + "이 입장하셧습니다.");
		log.warn(roomNo +" 번 방 접속  인원 수 : " + RoomsPersonsCount.get(roomNo));
		log.warn("쇼라이브 총 접속 인원 : " + totalConnectedPerson);
		//log.info(session.getPrincipal().getName() + "님이" + user.getRoomNo() + " 방에 입장하셨습니다.");
	}
	
	//웹 소켓 서버로 메세지를 전송했을 때 이 메서드가 호출된다. 현재 웹 소켓 서버에 접속한 Session모두에게 메세지를 전달해야 하므로 loop를 돌며 메세지를 전송함
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		log.warn("#ChattingHandler, handleMessage");
		log.warn(session.getId() + ": " + message);
		//세션을 통해서 그 유저의 방번호를 알고
		String roomNo = sessionsRoomNo.get(session);
		//그 방번호의 session list를 가지고 와서
		ArrayList<WebSocketSession> sessionlist = RoomList.get(roomNo);
		//메세지들 다 뿌려주기
		for(WebSocketSession s : sessionlist) {
			s.sendMessage(new TextMessage(session.getPrincipal().getName() + ": " + message.getPayload()));
		}
		
		
	}
	//클라이언트와 연결이 끊어진 경우(채팅방을 나간 경우) remove로 해당 세션을 제거함
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		totalConnectedPerson--;
		
		//세션을 통해서 그 유저의 방번호를 알고
		String roomNo = sessionsRoomNo.get(session);
		
		//그 방번호의 session리스트에서 해당session(사용자)제거
		RoomList.get(roomNo).remove(session);
		//사용자가 어떤방에 있었는지 정보 제거
		sessionsRoomNo.remove(session);
		//해당 방에 인원수 감소
		RoomsPersonsCount.put(roomNo, RoomsPersonsCount.get(roomNo)-1) ;
		//log.warn(RoomList.get(roomNo).size());
		
		
		log.warn(roomNo + "번 방에 " + session.getPrincipal().getName() + "이 퇴장하셧습니다.");
		log.warn(roomNo +" 번 방에 접속 인원 수 : " + RoomsPersonsCount.get(roomNo));
		log.warn("쇼라이브 총 접속 인원 : " + totalConnectedPerson);
	}
}
