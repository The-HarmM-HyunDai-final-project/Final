package com.theharmm.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.RemoteEndpoint.Basic;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

@ServerEndpoint("/chatserver")
public class ChatServer {
	// 현재 채팅 서버에 접속한 클라이언트(WebSocket Session) 목록
	private static final List<Session> sessionList = new ArrayList<Session>();
	
	public ChatServer(Session session){
		System.out.println("create ChatServer");
	}
	
	@OnOpen
	public void handleOpen(Session session) {
		System.out.println("open session : " + session.getId());
		try{
			final Basic basic = session.getBasicRemote();
			basic.sendText("연결 완료");
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}
		sessionList.add(session); // 접속자 관리(****)
	}
	
	@OnMessage
	public void handleMessage(String msg, Session session) {
		// 로그인할 때: 1#유저명
		// 대화  할 때: 2유저명#메세지		
		int index = msg.indexOf("#", 2);
		String no = msg.substring(0, 1); 
		String user = msg.substring(2, index);
		String txt = msg.substring(index + 1);
		if (no.equals("1")) {
			// 누군가 접속 > 1#아무개
			for (Session s : sessionList) {
				if (s != session) { // 현재 접속자가 아닌 나머지 사람들
					try {
						s.getBasicRemote().sendText("1#" + user + "#");
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
			}
		} else if (no.equals("2")) {
			// 누군가 메세지를 전송
			for (Session s : sessionList) {
				if (s != session) { // 현재 접속자가 아닌 나머지 사람들
					try {
						s.getBasicRemote().sendText("2#" + user + ":" + txt);
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
			} 
		} else if (no.equals("3")) {
			// 누군가 접속 > 3#아무개
			for (Session s : sessionList) {
				if (s != session) { // 현재 접속자가 아닌 나머지 사람들
					try {
						s.getBasicRemote().sendText("3#" + user + "#");
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
			}
			sessionList.remove(session);
		}
	}
	
	@OnClose
	public void handleClose(Session session){
		System.out.println("Session : "+ session.getId() + " closed");
		sessionList.remove(session);
	}
	
	@OnError
	public void handleError(Throwable e, Session session){
		System.out.println(e.getMessage() + "by session : " + session.getId());
	}

}