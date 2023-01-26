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
	}
	
	//웹 소켓 서버로 메세지를 전송했을 때 이 메서드가 호출된다. 현재 웹 소켓 서버에 접속한 Session모두에게 메세지를 전달해야 하므로 loop를 돌며 메세지를 전송함
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {

	}
	//BJ와 연결이 끊어진 경우(채팅방을 나간 경우)Channle을 삭제 해버리자
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {

	}
}
