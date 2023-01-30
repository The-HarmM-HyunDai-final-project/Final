package com.theharmm.handler;

import java.io.IOException;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.theharmm.service.ShowLiveService;
import com.theharmm.showlive.MessageType;
import com.theharmm.showlive.ShowLiveChannel;
import com.theharmm.showlive.ShowLiveChannelStore;
import com.theharmm.showlive.ShowLiveMessage;

import lombok.extern.log4j.Log4j;

@Log4j
public class BJChattingHandler extends TextWebSocketHandler{
	
	@Autowired
	ShowLiveService showliveService;
	
	// "Java Object" =Serialize=> "JSON" or "JSON" =Deserialize=> "Java Object" 역할을 맡음
	private final ObjectMapper objectMapper = new ObjectMapper();
	
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
		log.warn("BJ 텍스트핸들러왔엉");
		//BJ id를 가지고오고 -> 그 id로 방번호를 가져오고 -> 그 방번호로 채널을 가져오기
		String BJId = session.getPrincipal().getName();
		String roomNoOfBj = showLiveChannelStore.getRoomNoById(BJId);
		ShowLiveChannel showLiveChannel = showLiveChannelStore.getChannelByRoomNo(roomNoOfBj);
		
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
    		ShowLiveMessage showLiveMessage = createMessage(BJId, roomNoOfBj, type);
    		
    		showLiveMessage.setUsername(BJId);
    		showLiveMessage.setRoomNo(roomNoOfBj);
    		showLiveMessage.setMessage(contentMessage);
    		//showLiveMessage.setQuestionYn(question_yn);//여기로 들어노는 massage는 경매, 채팅(추후 방닫기 등등이 있음)인데 채팅이 질문인지 아닌지 값을 넣어줌 -> ShowLiveChannel의 handleMessage에서 처리할꺼임
            
			// it works
            //Map<String, String> map = mapper.readValue(json, new TypeReference<Map<String, String>>() {});
            
    		ShowLiveChannel showliveChannel = showLiveChannelStore.getChannelByRoomNo(roomNoOfBj);
    		showliveChannel.handleMessage(session, showLiveMessage);

        } catch (IOException e) {
            e.printStackTrace();
        }
	}
	//BJ와 연결이 끊어진 경우(채팅방을 나간 경우)Channle을 삭제 해버리자
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		String BJId = session.getPrincipal().getName();
		String roomNoOfBj = showLiveChannelStore.getRoomNoById(BJId);
		ShowLiveChannel showLiveChannel = showLiveChannelStore.getChannelByRoomNo(roomNoOfBj);
		
		ShowLiveMessage msg = new ShowLiveMessage();
		msg.setType(MessageType.LIVE_END);
		
		//사용자들에게 방송이 끝났다는걸 알리고 view에서는 아무 조작이 안되고 홈버튼 혹은 뒤로가기만 가능하게끔!
		showLiveChannel.handleMessage(session, msg);
		//db에도 라이브 상태를 바꿔주고
		showliveService.changeLiveStatus(showLiveChannelStore.getChannelDTOByRoomNo(roomNoOfBj));
		//store에서 channel을 완전 지워버리자!
		showLiveChannelStore.removeBJandRoomNoandChannel(BJId,roomNoOfBj);
		
		//지웠으면 Store에 잘 지워졌는지 확인!
		log.warn("채널 개수 : " + showLiveChannelStore.getChannelList().keySet().size());
		log.warn(showLiveChannelStore.getChannelList().toString());
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
	
}
