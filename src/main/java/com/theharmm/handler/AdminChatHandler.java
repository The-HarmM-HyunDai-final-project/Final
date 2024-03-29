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
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.theharmm.domain.ChatMessageDTO;
import com.theharmm.domain.ChatRoomDTO;
import com.theharmm.domain.MemberVO;
import com.theharmm.security.domain.CustomUser;
import com.theharmm.service.AdminChatService;

import lombok.extern.log4j.Log4j;

@Log4j
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
		log.info("[ChatSys] "+session.getId()+" 연결성공 => 총 접속 인원 : "+count+" 명");
		//log.info("[chat system] " + "채팅방 입장자 : " + session.getPrincipal().getName());
		//sessionList.add(session);
	}
	   
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		   
	      String msg = message.getPayload();
	      ChatMessageDTO chatMessage = objectMapper.readValue(msg, ChatMessageDTO.class);
	      log.info("[CyatSys] 메시지 -> "+chatMessage.toString() );
	      ChatRoomDTO chatRoom = null;
	      
	      Calendar cal = Calendar.getInstance();
		  cal.setTime(chatMessage.getChat_date());
		  DateFormat df = new SimpleDateFormat("a hh:mm");
		  String chatTime = df.format(cal.getTime());
	      
	      
	      if(chatMessage.getChat_type().equals("enter") && chatMessage.getRoom_no()==0) {
	    	  chatRoom = new ChatRoomDTO();
	    	  chatRoom.setRoom_no(0);
	      }
	      else if(chatMessage.getRoom_no()==0){
	    	  
	    	  chatRoom = adminChatService.selectCurrentMemberChatRoom(chatMessage.getMember_email());
	    	  chatMessage.setRoom_no(chatRoom.getRoom_no());
	    	  chatMessage.setRoom_host(chatRoom.getRoom_host());
	    	  System.out.println("문의: "+chatRoom.toString());
	      }
	      else {
	    	  chatRoom = adminChatService.getChatRoom(chatMessage.getRoom_no());
	    	  chatMessage.setRoom_no(chatRoom.getRoom_no());
	    	  chatMessage.setRoom_host(chatRoom.getRoom_host());
	    	  System.out.println("상담사: "+chatRoom.toString());
	      }
	      
	      
	      //채팅방 생성
	      if(RoomList.get(Integer.toString(chatRoom.getRoom_no())) == null && chatMessage.getChat_message().equals("ENTER-CHAT")) {
	         chatRoom = adminChatService.addChatRoom(chatMessage.getMember_email());
	         chatMessage.setChat_message("상담사 연결을 요청하셨습니다. \n연결 후 빠른 답변을 위해 문의 내용을 남겨주세요.");
	         chatMessage.setMember_email("admin");
	         
	    	 ArrayList<WebSocketSession> sessionInfo = new ArrayList<WebSocketSession>();
	         sessionInfo.add(session);
	         sessionList.put(session, Integer.toString(chatRoom.getRoom_no()));
	         RoomList.put(Integer.toString(chatRoom.getRoom_no()), sessionInfo);
	         log.info("[ChatSys] "+chatRoom.getRoom_no()+" 번 채팅방 생성");
	         TextMessage textMessage = new TextMessage(chatMessage.getMember_name() + "," + chatMessage.getMember_email() + "," + chatMessage.getChat_message() +","+ chatMessage.getChat_type() + "," + chatMessage.getChat_no() + "," + chatTime );
	         for(WebSocketSession sess : RoomList.get(Integer.toString(chatRoom.getRoom_no()))) {
	             log.info("[ChatSys] "+Integer.toString(chatRoom.getRoom_no())+" 방 접속인원  "+sess );
	             sess.sendMessage(textMessage);
	          }
	         
	      } 
	      //채팅방 입장
	      else if(RoomList.get(Integer.toString(chatRoom.getRoom_no())) != null && chatMessage.getChat_message().equals("ENTER-CHAT") && chatRoom != null) {
	         RoomList.get(Integer.toString(chatRoom.getRoom_no())).add(session);
	         sessionList.put(session, Integer.toString(chatRoom.getRoom_no()));
	         chatMessage.setChat_message("상담사가 연결되었습니다.");
	         chatMessage.setMember_email("admin");
	         log.info("[ChatSys] "+Integer.toString(chatRoom.getRoom_no())+" 번 채팅방 입장");
	         TextMessage textMessage = new TextMessage(chatMessage.getMember_name() + "," + chatMessage.getMember_email() + "," + chatMessage.getChat_message() +","+ chatMessage.getChat_type() + "," + chatMessage.getChat_no()+ "," + chatTime);
	         
	         for(WebSocketSession sess : RoomList.get(Integer.toString(chatRoom.getRoom_no()))) {
	             log.info("[ChatSys] "+Integer.toString(chatRoom.getRoom_no())+" 방 접속인원 "+sess);
	             sess.sendMessage(textMessage);
	          }
	         
	        
	      } 
	      //메세지 전송
	      else if(RoomList.get(Integer.toString(chatRoom.getRoom_no())) != null && !chatMessage.getChat_message().equals("ENTER-CHAT") && chatRoom != null) {
	         TextMessage textMessage = new TextMessage(chatMessage.getMember_name() + "," + chatMessage.getMember_email() + "," + chatMessage.getChat_message() +","+ chatMessage.getChat_type() + "," + chatMessage.getChat_no()+ "," + chatTime);

	         int sessionCount = 0;  
        	 for(WebSocketSession sess : RoomList.get(Integer.toString(chatRoom.getRoom_no()))) {
                 log.info("[ChatSys] "+Integer.toString(chatRoom.getRoom_no())+" 방 접속인원 "+ sess);
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
	      log.info("[ChatSys] "+session.getId()+" 연결끊김 => 총 접속 인원 : "+count+" 명" );
	      if(sessionList.get(session) != null) {
	         RoomList.get(sessionList.get(session)).remove(session);
	      }
	      
	   }
	   
	   
	  
	   
	
	   @GetMapping(value = "/{room_no}")
	   public String selectClientChatHistory(@PathVariable int room_no, WebSocketSession session) {
			
			try {
				
				
				log.info("[ChatSys]현재 로그인한 유저 정보 불러오기...");
				String session_member_email = session.getPrincipal().getName();
			    
			      
			    log.info("[ChatSys]현재 로그인한 유저 정보 "+ session_member_email);
			    
			     
			     List<ChatMessageDTO> chatHistory = null;
			     ChatRoomDTO roomInfo = null;
			     
		         log.info("[ChatSys]채팅 히스토리 불러오기...");
		         
		         Map<String,Object> map = new HashMap<>();
		         map.put("room_no",room_no);
		         chatHistory = adminChatService.selectClientChatHistory(map);
		         
		         
		         log.info("[ChatSys]채팅 히스토리 불러오기...완료 "+ chatHistory.size());
		         
		         log.info("[ChatSys]채팅방 불러오기...");
		         roomInfo = adminChatService.getChatRoom(room_no);
		         log.info("[ChatSys]채팅방 불러오기...완료 "+ roomInfo.getRoom_host());
		         
		         
		         return "/adminChatRoom";
		         
				
			} catch (Exception e) {
				log.info(e.getMessage());
			}
			return "/500";
			
		}
	
}
