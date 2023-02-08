package com.theharmm.handler;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.theharmm.domain.BrandChatMessageDTO;
import com.theharmm.domain.BrandChatRoomDTO;
import com.theharmm.domain.MemberVO;
import com.theharmm.security.domain.CustomUser;
import com.theharmm.service.BrandChatService;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class BrandChatHandler extends TextWebSocketHandler{
	
	@Autowired
	BrandChatService brandChatService;
	
	private Map<String, ArrayList<WebSocketSession>> RoomList = new ConcurrentHashMap<String, ArrayList<WebSocketSession>>();
	private Map<WebSocketSession, String> sessionList = new ConcurrentHashMap<WebSocketSession, String>();
	   
	private final ObjectMapper objectMapper = new ObjectMapper();
	private static int count = 0;
	
	
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		
		count++;
		log.info("[ChatSys] "+session.getId()+" 연결성공 => 총 접속 인원 : "+count+" 명");
		//log.info("[chat system] " + "채팅방 입장자 : " + session.getPrincipal().getName());
		//sessionList.add(session);
	}
	   
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		   
	      String msg = message.getPayload();
	      BrandChatMessageDTO chatMessage = objectMapper.readValue(msg, BrandChatMessageDTO.class);
	      log.info("[CyatSys] 메시지 -> "+chatMessage.toString() );
	      BrandChatRoomDTO chatRoom = null;
	      
	      Calendar cal = Calendar.getInstance();
		  cal.setTime(chatMessage.getChat_date());
		  DateFormat df = new SimpleDateFormat("a hh:mm");
		  String chatTime = df.format(cal.getTime());
	      
	      
	     chatRoom = brandChatService.getChatRoom(chatMessage.getRoom_no());
	     chatMessage.setRoom_no(chatRoom.getRoom_no());
	     log.info("방정보: "+chatRoom.toString());
	      
	      
	      
	      //채팅방 생성
	      if(RoomList.get(Integer.toString(chatRoom.getRoom_no())) == null && chatMessage.getChat_message().equals("ENTER-CHAT")) {
	        
	    	 
	    	 ArrayList<WebSocketSession> sessionInfo = new ArrayList<WebSocketSession>();
	    	 chatMessage.setChat_message(chatMessage.getMember_name()+"님이 대화방을 생성 하였습니다.");
	         sessionInfo.add(session);
	         sessionList.put(session, Integer.toString(chatRoom.getRoom_no()));
	         RoomList.put(Integer.toString(chatRoom.getRoom_no()), sessionInfo);
	         brandChatService.addUserCount(chatRoom.getRoom_no());
	         log.info("[ChatSys] "+chatRoom.getRoom_no()+" 번 채팅방 생성");
	         TextMessage textMessage = new TextMessage(chatMessage.getMember_name() + "," + chatMessage.getMember_email() + "," + chatMessage.getChat_message() +","+ + chatMessage.getChat_no() + "," + chatTime );
	         for(WebSocketSession sess : RoomList.get(Integer.toString(chatRoom.getRoom_no()))) {
	             log.info("[ChatSys] "+Integer.toString(chatRoom.getRoom_no())+" 방 접속인원  "+sess );
	             sess.sendMessage(textMessage);
	          }
	         
	      } 
	      //채팅방 입장
	      else if(RoomList.get(Integer.toString(chatRoom.getRoom_no())) != null && chatMessage.getChat_message().equals("ENTER-CHAT") && chatRoom != null) {
	         chatMessage.setChat_message(chatMessage.getMember_name()+"님이 입장하였습니다.");
	    	  RoomList.get(Integer.toString(chatRoom.getRoom_no())).add(session);
	         sessionList.put(session, Integer.toString(chatRoom.getRoom_no()));
	         brandChatService.addUserCount(chatRoom.getRoom_no());
	         log.info("[ChatSys] "+Integer.toString(chatRoom.getRoom_no())+" 번 채팅방 입장");
	         TextMessage textMessage = new TextMessage(chatMessage.getMember_name() + "," + chatMessage.getMember_email() + "," + chatMessage.getChat_message() +","+  chatMessage.getChat_no()+ "," + chatTime);
	         
	         for(WebSocketSession sess : RoomList.get(Integer.toString(chatRoom.getRoom_no()))) {
	             log.info("[ChatSys] "+Integer.toString(chatRoom.getRoom_no())+" 방 접속인원 "+sess);
	             sess.sendMessage(textMessage);
	          }
	         
	        
	      } 
	      //메세지 전송
	      else if(RoomList.get(Integer.toString(chatRoom.getRoom_no())) != null && !chatMessage.getChat_message().equals("ENTER-CHAT") && chatRoom != null) {
	    	  boolean closeYn = false;
	    	  if(chatMessage.getChat_message().equals("CLOSE-CHAT")) {
	    		  closeYn = true;
	    		  chatMessage.setChat_message(chatMessage.getMember_name()+"님이 퇴장하였습니다.");
	    	  }
	    	  TextMessage textMessage = new TextMessage(chatMessage.getMember_name() + "," + chatMessage.getMember_email() + "," + chatMessage.getChat_message() +","+  + chatMessage.getChat_no()+ "," + chatTime);
	         
	         int sessionCount = 0;  
        	 for(WebSocketSession sess : RoomList.get(Integer.toString(chatRoom.getRoom_no()))) {
                 log.info("[ChatSys] "+Integer.toString(chatRoom.getRoom_no())+" 방 접속인원 "+ sess);
                 sess.sendMessage(textMessage);
                 sessionCount++;
              }
	         
	         int ret = 0;
	         try {
	            log.info("[ChatSys]저장될 채팅데이터 : " + chatMessage.toString());
	            if(!closeYn) {
	            	ret = brandChatService.addMessage(chatMessage);
	            }
	           
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
	      log.info("[ChatSys] "+session.getId()+" 연결끊김 => 총 접속 인원 : "+count+" 명" );
	      if(sessionList.get(session) != null) {
	         RoomList.get(sessionList.get(session)).remove(session);
	      }
	      
	   }

	  
	   
	
	   
	
}
