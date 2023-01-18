package com.theharmm.showlive;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;

import com.fasterxml.jackson.databind.ObjectMapper;

import lombok.Data;
import lombok.extern.java.Log;
import lombok.extern.log4j.Log4j;

@Data
@Log4j
public class ShowLiveChannel {
	
	// "Java Object" =Serialize=> "JSON" or "JSON" =Deserialize=> "Java Object" 역할을 맡음
	private final ObjectMapper objectMapper = new ObjectMapper();
	
	//해당 채널의 방번호
	private String roomNum;
	//해당 채널에 접속한 사용자 수
	private int connectedUsers;
	//해당 채널에서 진행하는 최고 제시가격
	private int maxSuggestionPrice;
	//해당 채널에서 진행하는 최고 가격 제시한 유저
	private String maxSuggestionUser;
	//접속한 사용자들 담자는 배열 -> 아래 Map 객체떄문에 사용 안해도 될것 같음
	//private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
	// session, 유저id(email)가 들어간다.
	private Map<WebSocketSession, String> sessionsRoomNo = new ConcurrentHashMap<WebSocketSession, String>();
	
	public static ShowLiveChannel create(String roomNo) {
		ShowLiveChannel showliveChannel = new ShowLiveChannel();
		showliveChannel.roomNum = roomNo;
		showliveChannel.connectedUsers = 0;
		showliveChannel.maxSuggestionPrice = 100000; //지금 임의로 한거고 관리자가 방 만들때는 직접 입력한 금액을 여기에 넣음
		showliveChannel.maxSuggestionUser = "";
		return showliveChannel;
	}
	
	//채널에 있는 모든 사용자(session)을 반환함 -> ShowLiveChannelStore에서 만약 Channel에 아무도 없으면 치우던 생성하던가 함
	//Map객체를 ArrayList형태로 바꿀수 있구나..!
	public ArrayList<WebSocketSession> getAllSessions () {
		if (sessionsRoomNo == null || sessionsRoomNo.isEmpty()) {
			return null;
		}
		return (ArrayList)sessionsRoomNo;
	}
	
	public void handleMessage(WebSocketSession session, ShowLiveMessage showliveMessage) throws Exception {
		//해당 유저 id 가져오기
		String userId = session.getPrincipal().getName();
		
		//log.warn(sessionsRoomNo.keySet().toString());
		
		if(showliveMessage.getType() == MessageType.TALK) {				//채팅 들어왔을 때
			showliveMessage.setMessage(showliveMessage.getMessage());
		}else if(showliveMessage.getType() == MessageType.AUCTION) {	//경매 용도
			//입력받은 입찰 제시금이 지금보다 크면 모두에게 새로운 제시금을 보냄
			if(Integer.parseInt(showliveMessage.getMessage()) > maxSuggestionPrice) {
				maxSuggestionPrice = Integer.parseInt(showliveMessage.getMessage());
				maxSuggestionUser = showliveMessage.getUsername();
				showliveMessage.setChannelMaxSuggestUser(maxSuggestionUser);
				showliveMessage.setChannelMaxSuggestPrice(maxSuggestionPrice);
//				showliveMessage.setMessage(maxSuggestionPrice+"/"+maxSuggestionUser);
			}else {
				//혹시 그게 아니면 함수 그냥 끝내버리기
				return;
			}
		}else if(showliveMessage.getType() == MessageType.ENTER) {		//접속 했을시
			connectedUsers++;
			sessionsRoomNo.put(session, userId);
			showliveMessage.setChannelTotalUser(connectedUsers);
			showliveMessage.setMessage(userId + " 님이 입장하셨습니다");
			showliveMessage.setChannelMaxSuggestUser(maxSuggestionUser);
			showliveMessage.setChannelMaxSuggestPrice(maxSuggestionPrice);
			log.warn(roomNum + "번방 접속자 수 :" + connectedUsers);
		}else if(showliveMessage.getType() == MessageType.LEAVE) {		//방 나갔을 때
			connectedUsers--;
			sessionsRoomNo.remove(session);
			showliveMessage.setChannelTotalUser(connectedUsers);
			showliveMessage.setMessage(userId + " 님이 퇴장하셨습니다");
			log.warn(roomNum + "번방 접속자 수 :" + connectedUsers);
		}
		
		sendMessage(showliveMessage);
	}
	
	public void sendMessage(ShowLiveMessage showLiveMessage) throws Exception {
		TextMessage textMessage = new TextMessage(objectMapper.writeValueAsString(showLiveMessage));
		for(WebSocketSession s : sessionsRoomNo.keySet()) {
			if(s.isOpen()) {//접속 되어있는지 확인 후  메세지 보냄
				s.sendMessage(textMessage); 
			}
		}
	}
	
	
	public void addSession (WebSocketSession session, String nickname) {
		sessionsRoomNo.put(session, nickname);
	}
	
	public void removeSession (WebSocketSession session) {
		sessionsRoomNo.remove(session);
	}
	
}
