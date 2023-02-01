package com.theharmm.handler;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.theharmm.domain.ShowLiveBiddingDTO;
import com.theharmm.domain.ShowLiveChatDTO;
import com.theharmm.security.domain.CustomUser;
import com.theharmm.service.ShowLiveService;
import com.theharmm.showlive.MessageType;
import com.theharmm.showlive.ShowLiveChannel;
import com.theharmm.showlive.ShowLiveChannelStore;
import com.theharmm.showlive.ShowLiveMessage;

import lombok.extern.log4j.Log4j;


@Log4j
public class ChattingHandler extends TextWebSocketHandler{
	
	@Autowired
	ShowLiveService showLiveService;
	
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
		log.warn(map.toString());
		String userId = session.getPrincipal().getName();
		String roomNo = (String)map.get("roomNo");
		//메세지 생성
		ShowLiveMessage showLiveMessage = createMessage(userId, roomNo, "ENTER");
		
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
		log.warn(map.toString());
		
		String userId = session.getPrincipal().getName();
		String roomNo = (String)map.get("roomNo");
		
		//여기서 경매기능까지 들어올 경우 경매용인지 그냥 채팅용인지 구분하는 작업이 추후 필요
		//테스트용
		try {
            // convert JSON string to Map
            Map<String, String> dataFromJsp = objectMapper.readValue(message.getPayload(), Map.class);
            //ShowLiveMessage showLiveMessageFromJsp = objectMapper.readValue(message.getPayload(), ShowLiveMessage.class);

            log.warn("=============================");
            log.warn(dataFromJsp.toString());
            String contentMessage = dataFromJsp.get("message");
            String type = dataFromJsp.get("mType");
            //String question_yn = dataFromJsp.get("question_yn");
            
            //메시지 생성
    		ShowLiveMessage showLiveMessage = createMessage(userId, roomNo, type);
    		
    		showLiveMessage.setUsername(userId);
    		showLiveMessage.setRoomNo(roomNo);
    		showLiveMessage.setMessage(contentMessage);
    		//showLiveMessage.setQuestionYn(question_yn);//여기로 들어노는 massage는 경매, 채팅(추후 방닫기 등등이 있음)인데 채팅이 질문인지 아닌지 값을 넣어줌 -> ShowLiveChannel의 handleMessage에서 처리할꺼임
            
			// it works
            //Map<String, String> map = mapper.readValue(json, new TypeReference<Map<String, String>>() {});
            
    		ShowLiveChannel showliveChannel = showLiveChannelStore.getChannelByRoomNo(roomNo);
    		showliveChannel.handleMessage(session, showLiveMessage);
    		
    		insertShowliveInfostoDB(showLiveMessage);//DB저장! 왜 Channel객체에서는 안되는거야 ..

        } catch (IOException e) {
            e.printStackTrace();
        }
		//-------------
		
		
		
		
//		//메시지 타입이 경매, 채팅인지 구분
//		String messageType = message.getPayload().split(":")[0];
//		
//		
//		//초기 타입, 메시지(메시지는 "TALK:~~~~" or "AUCTION:~~~" 이런식으로 js에서 보내지는 String을 : 기준으로 앞에는 TYPE을 뒤에는 순수 메시지를 가져옴)
//		MessageType sendType = MessageType.TALK;
//		String sendMessage = getMessageFromPayLoad(message.getPayload());
//		
//		//TYPE: 메시지내용 으로 메시지가 오기때문에 처음 :(콜론)이 오는 위치 이후가 우리가 원하는 메시지 내용이므로 그렇게 날려버림 
//		if(messageType.equals("AUCTION")) {
//			log.warn("옥션이구만!");
//			sendType = MessageType.AUCTION;
//		}
//		
//		//메시지 생성
//		ShowLiveMessage showLiveMessage = createMessage(userId, roomNo, sendType);
//		showLiveMessage.setMessage(sendMessage);
//		
//		log.warn(showLiveMessage.toString());
//		ShowLiveChannel showliveChannel = showLiveChannelStore.getChannelByRoomNo(roomNo);
//		showliveChannel.handleMessage(session, showLiveMessage);
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
		ShowLiveMessage showLiveMessage = createMessage(userId, roomNo, "LEAVE");
		
		ShowLiveChannel showliveChannel = showLiveChannelStore.getChannelByRoomNo(roomNo);
		
		//이부분 방이 사라지고 나서 방에다가 메시지를 보내니까 null exception이 나서 예외 처리를 해줌
		if(showliveChannel != null) {
			showliveChannel.handleMessage(session, showLiveMessage);
		}
		
		log.warn("쇼라이브 총 접속 인원 : " + totalConnectedPerson);
	}
	
	//커스텀 메시지를 생성하고 각 메서드에서 타입에 맞게 객체 바꾸깅 
	public ShowLiveMessage createMessage(String userName, String roomNo, String type) {
		ShowLiveMessage message = new ShowLiveMessage();
		message.setRoomNo(roomNo);
		message.setUsername(userName);
		switch(type) {
			case "ENTER":
				message.setType(MessageType.ENTER);
				break;
			case "LEAVE":
				message.setType(MessageType.LEAVE);
				break;
			case "TALK":
				message.setType(MessageType.TALK);
				break;
			case "QUESTION":
				message.setType(MessageType.QUESTION);
				break;
			case "AUCTION":
				message.setType(MessageType.AUCTION);
				break;
			case "AUCTION_END":
				message.setType(MessageType.AUCTION_END);
				break;
			case "LIVE_END":
				message.setType(MessageType.LIVE_END);
				break;
		}
		
		return message;
	}
	
	private String getMessageFromPayLoad(String message) {
		String target = ":";
        int target_num = message.indexOf(target)+1; 
        String result; 
        result = message.substring(target_num);
		
		return result;
		
	}
	private void insertShowliveInfostoDB(ShowLiveMessage message) {
		switch(message.getType()) {
			case QUESTION: case TALK:
				insertChatDTOtoDB(message);
				break;
			case AUCTION:
				insertShowLiveBiddingDTOtoDB(message);
				break;
		}
		
	}
	
	//메시지가 TALK, QUESTION일때 DB에 채팅 내역으로  저장해버리기
	private void insertChatDTOtoDB(ShowLiveMessage message) {
		ShowLiveChatDTO chatDTO = new ShowLiveChatDTO();
		chatDTO.setShowlive_no(Integer.parseInt(message.getRoomNo()));
		chatDTO.setChat_user_id(message.getUsername());
		chatDTO.setChat_content(message.getMessage());
		chatDTO.setChat_date(message.getInsertDate());
		//메시지가 단순 채팅이면 false, 질문이면 true
		if(message.getType() == MessageType.QUESTION) {
			chatDTO.setQuestion_yn("true");
		}else {
			chatDTO.setQuestion_yn("false");
		}
		log.warn(chatDTO.toString());
		showLiveService.insertChat(chatDTO);
	}
	private void insertShowLiveBiddingDTOtoDB(ShowLiveMessage message){
		ShowLiveBiddingDTO bidDTO = new ShowLiveBiddingDTO();
		bidDTO.setShowlive_no(Integer.parseInt(message.getRoomNo()));
		bidDTO.setUser_name(message.getUsername());
		bidDTO.setSuggest_price(Integer.parseInt(message.getMessage()));
		bidDTO.setSuggest_date(message.getInsertDate());
		
		showLiveService.insertAuction(bidDTO);
	}
}
