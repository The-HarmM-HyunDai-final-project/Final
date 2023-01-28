package com.theharmm.showlive;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.theharmm.domain.ShowLiveChannelDTO;

import lombok.Data;
import lombok.extern.java.Log;
import lombok.extern.log4j.Log4j;

@Data
@Log4j
public class ShowLiveChannel {
	
	// "Java Object" =Serialize=> "JSON" or "JSON" =Deserialize=> "Java Object" 역할을 맡음
	private final ObjectMapper objectMapper = new ObjectMapper();
	
	//채널의 BJ id
	private String BjID;
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
	private Map<WebSocketSession, String> bjList = new ConcurrentHashMap<WebSocketSession, String>();
	// session, 유저id(email)가 들어간다.
	private Map<WebSocketSession, String> sessionsRoomNo = new ConcurrentHashMap<WebSocketSession, String>();
	
	//관리자가 방을 만들때 생성하는 메소드
	public static ShowLiveChannel createForService(ShowLiveChannelDTO channelDTO) {
		ShowLiveChannel showliveChannel = new ShowLiveChannel();
		showliveChannel.BjID = channelDTO.getShow_host();
		showliveChannel.roomNum = Integer.toString(channelDTO.getShowlive_no());
		showliveChannel.connectedUsers = 0;
		showliveChannel.maxSuggestionPrice = channelDTO.getShowlive_start_price(); //지금 임의로 한거고 관리자가 방 만들때는 직접 입력한 금액을 여기에 넣음
		showliveChannel.maxSuggestionUser = "";
		return showliveChannel;
	}
	
	
	//관리장가 방을만들때 ShowLiveChannelDTO로 Store에 만들꺼니까 아마 이거는 필요 없을듯
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
//			if(showliveMessage.getQuestionYn().equals("1")) {			//채팅이 질문일 때
//				//관리자에게만 따로 소켓 통신으로 메시지 보내기
//				log.warn("이거 질문이니까 따로보여주기");
//			}
			showliveMessage.setMessage(showliveMessage.getMessage());
		}else if (showliveMessage.getType() == MessageType.QUESTION){
			showliveMessage.setMessage(showliveMessage.getMessage());
			//BJ한테 우선적으로 보내주기! -> 이거까지하면 2개 가서 일단 취소
			//sendMessageToBJ(showliveMessage);
		}
			if(showliveMessage.getType() == MessageType.AUCTION) {	//경매 용도
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
		}else if(showliveMessage.getType() == MessageType.AUCTION_END) {	//라이브가 종료 되었을 때
			log.warn(roomNum + "낙찰 완료!" + roomNum +" 방 경매가 종료 되었습니다");
		}else if(showliveMessage.getType() == MessageType.LIVE_END) {	//라이브가 종료 되었을 때
			connectedUsers--;
			sessionsRoomNo.remove(session);

			log.warn(roomNum + "번방 이 종료 되었습니다");
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
	//질문이면 BJ에게만 따로 보여지게 해야함
	public void sendMessageToBJ(ShowLiveMessage showLiveMessage) throws Exception {
		TextMessage textMessage = new TextMessage(objectMapper.writeValueAsString(showLiveMessage));
		for(WebSocketSession s : bjList.keySet()) {
			if(s.isOpen()) {//접속 되어있는지 확인 후  메세지 보냄
				s.sendMessage(textMessage); 
			}
		}
	}
	//BJ들어오면 BJList에 추가
	public void addBJSession(WebSocketSession session, String BJId) {
		bjList.put(session, BJId);			//bj목록에도 넣어주고
		sessionsRoomNo.put(session, BJId);	//일반 사용자 목록에도 넣어줘야 일반 채팅들도 볼 수 있겠지
	}
	//BJ나가면 BJList, 유저list에서 모두 제거
	public void removeBJSession (WebSocketSession session) {
		bjList.remove(session);
		sessionsRoomNo.remove(session);
	}
	//일반 사용자 List에 추가
	public void addSession (WebSocketSession session, String nickname) {
		sessionsRoomNo.put(session, nickname);
	}
	//사용자 나가면 List에 제거
	public void removeSession (WebSocketSession session) {
		sessionsRoomNo.remove(session);
	}
	
}
