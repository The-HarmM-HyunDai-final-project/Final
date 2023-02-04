package com.theharmm.handler;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.theharmm.domain.ChatMessageDTO;
import com.theharmm.domain.ChatRoomDTO;
import com.theharmm.service.AdminChatService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class AdminChatHandler extends TextWebSocketHandler{
	
	@Autowired
	AdminChatService adminChatService;
	
	private Map<String, ArrayList<WebSocketSession>> RoomList = new ConcurrentHashMap<String, ArrayList<WebSocketSession>>();
	private Map<WebSocketSession, String> sessionList = new ConcurrentHashMap<WebSocketSession, String>();
	   
	private final ObjectMapper objectMapper = new ObjectMapper();
	private static int count = 0;
	
	
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		
		count++;
		log.info("[ChatSys] {} 연결성공 => 총 접속 인원 : {} 명", session.getId(), count);
		//log.info("[chat system] " + "채팅방 입장자 : " + session.getPrincipal().getName());
		//sessionList.add(session);
	}
	   
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		   
	      String msg = message.getPayload();
	      ChatMessageDTO chatMessage = objectMapper.readValue(msg, ChatMessageDTO.class);
	      log.info("[CyatSys] 메시지 -> {}", chatMessage.toString());
	      ChatRoomDTO chatRoom = null;
	      if(chatMessage.getChat_type().equals("enter") && chatMessage.getRoom_no()==0) {
	    	  chatRoom = new ChatRoomDTO();
	    	  chatRoom.setRoom_no(0);
	      }
	      else if(chatMessage.getRoom_no()==0){
	    	  chatRoom = adminChatService.selectCurrentMemberChatRoom(chatMessage.getMember_email());
	      }
	      else {
	    	  chatRoom = adminChatService.getChatRoom(chatMessage.getChat_no());
	      }
	      
	      
	      //채팅방 생성
	      if(RoomList.get(Integer.toString(chatRoom.getRoom_no())) == null && chatMessage.getChat_message().equals("ENTER-CHAT")) {
	         chatRoom = adminChatService.addChatRoom(chatMessage.getMember_email());
	         
	    	 ArrayList<WebSocketSession> sessionInfo = new ArrayList<WebSocketSession>();
	         sessionInfo.add(session);
	         sessionList.put(session, Integer.toString(chatRoom.getRoom_no()));
	         RoomList.put(Integer.toString(chatRoom.getRoom_no()), sessionInfo);
	         log.info("[ChatSys] {} 번 채팅방 생성", chatRoom.getRoom_no());
	         TextMessage textMessage = new TextMessage(chatMessage.getMember_name() + "," + chatMessage.getMember_email() + "," + chatMessage.getChat_message() +","+ chatMessage.getChat_type() + "," + chatMessage.getChat_no() + "," + chatMessage.getChat_date() );
	         for(WebSocketSession sess : RoomList.get(Integer.toString(chatRoom.getRoom_no()))) {
	             log.info("[ChatSys] {} 방 접속인원 {} " , Integer.toString(chatRoom.getRoom_no()), sess);
	             sess.sendMessage(textMessage);
	          }
	         
	      } 
	      //채팅방 입장
	      else if(RoomList.get(Integer.toString(chatRoom.getRoom_no())) != null && chatMessage.getChat_message().equals("ENTER-CHAT") && chatRoom != null) {
	         RoomList.get(Integer.toString(chatRoom.getRoom_no())).add(session);
	         sessionList.put(session, Integer.toString(chatRoom.getRoom_no()));
	         log.info("[ChatSys] {} 번 채팅방 입장", Integer.toString(chatRoom.getRoom_no()));
	         TextMessage textMessage = new TextMessage(chatMessage.getMember_name() + "," + chatMessage.getMember_email() + "," + chatMessage.getChat_message() +","+ chatMessage.getChat_type() + "," + chatMessage.getChat_no()+ "," + chatMessage.getChat_date());
	         
	         for(WebSocketSession sess : RoomList.get(Integer.toString(chatRoom.getRoom_no()))) {
	             log.info("[ChatSys] {} 방 접속인원 {} " , Integer.toString(chatRoom.getRoom_no()), sess);
	             sess.sendMessage(textMessage);
	          }
	         
	        
	      } 
	      //메세지 전송
	      else if(RoomList.get(Integer.toString(chatRoom.getRoom_no())) != null && !chatMessage.getChat_message().equals("ENTER-CHAT") && chatRoom != null) {
	         TextMessage textMessage = new TextMessage(chatMessage.getMember_name() + "," + chatMessage.getMember_email() + "," + chatMessage.getChat_message() +","+ chatMessage.getChat_type() + "," + chatMessage.getChat_no()+ "," + chatMessage.getChat_date());

	         int sessionCount = 0;  
        	 for(WebSocketSession sess : RoomList.get(Integer.toString(chatRoom.getRoom_no()))) {
                 log.info("[ChatSys] {} 방 접속인원 {} " , Integer.toString(chatRoom.getRoom_no()), sess);
                 sess.sendMessage(textMessage);
                 sessionCount++;
              }
	         
	         int ret = 0;
	         try {
	            log.info("[ChatSys]저장될 채팅데이터 : " + chatMessage.toString());
	            
	            ret = adminChatService.addMessage(chatMessage);
	         } catch(Exception e) {
	            log.info(e.getMessage());
	         } finally {
	            if(ret == 1) {
	               log.info("[ChatSys]메세지 전송 및 DB 저장 성공");
	               
	            } else {
	               log.info("[ChatSys]메세지 전송 실패");
	            }
	         }
	         
	         
	      }
	      
	   
	   }
	   
	   @Override
	   public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
	      count--;
	      log.info("[ChatSys] {} 연결끊김 => 총 접속 인원 : {} 명", session.getId(), count);
	      if(sessionList.get(session) != null) {
	         RoomList.get(sessionList.get(session)).remove(session);
	      }
	      
	   }
	   
	
	   @GetMapping(value = "/{room_no}")
	   public String selectClientChatHistory(@PathVariable int room_no, WebSocketSession session) {
			
			try {
				
				
				log.info("[ChatSys]현재 로그인한 유저 정보 불러오기...");
				String session_member_email = session.getPrincipal().getName();
			    
			      
			    log.info("[ChatSys]현재 로그인한 유저 정보 {}", session_member_email);
			    
			     
			     List<ChatMessageDTO> chatHistory = null;
			     ChatRoomDTO roomInfo = null;
			     
		         log.info("[ChatSys]채팅 히스토리 불러오기...");
		         
		         Map<String,Object> map = new HashMap<>();
		         map.put("room_no",room_no);
		         chatHistory = adminChatService.selectClientChatHistory(map);
		         
		         
		         log.info("[ChatSys]채팅 히스토리 불러오기...완료 {}", chatHistory.size());
		         
		         log.info("[ChatSys]채팅방 불러오기...");
		         roomInfo = adminChatService.getChatRoom(room_no);
		         log.info("[ChatSys]채팅방 불러오기...완료 {}", roomInfo.getRoom_host());
		         
		         
		         return "/adminChatRoom";
		         
				
			} catch (Exception e) {
				log.info(e.getMessage());
			}
			return "/500";
			
		}
	
}
