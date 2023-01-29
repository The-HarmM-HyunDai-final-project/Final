package com.theharmm.handler;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.theharmm.domain.AlarmDTO;
import com.theharmm.domain.MemberVO;
import com.theharmm.service.ReplyService;

import lombok.extern.log4j.Log4j;

@Log4j
public class EchoHandler extends TextWebSocketHandler {
	
	//로그인 한 전체
	List<WebSocketSession> sessions = new ArrayList<WebSocketSession>();
	
	@Autowired
	ReplyService replyservice;
	
	// 1대1
	Map<String, WebSocketSession> userSessionsMap = new HashMap<String, WebSocketSession>();
	
	//서버에 접속이 성공 했을때
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		sessions.add(session);
		
		// 로그인한 사용자를 map에 저장
		String sendUsername = session.getPrincipal().getName();
		userSessionsMap.put(sendUsername , session);
		
	}
	
	//소켓에 메세지를 보냈을때 이 메소드가 실행
	
	//protocol : cmd , 댓글작성자, 게시글 작성자 , seq (reply , user2 , user1 , 12)
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		String msg = message.getPayload();
		if(StringUtils.isNotEmpty(msg)) {
			String[] strs = msg.split(",");
			
			if(strs != null && strs.length == 5) {
				String cmd = strs[0];
				String caller = strs[1]; 
				String receiver = strs[2];
				String receiverUsername = strs[3];
				String seq = strs[4];	
				
				// 작성자가 로그인해서 있다면
				WebSocketSession boardWriterSession = userSessionsMap.get(receiverUsername);
				
				if("reply".equals(cmd) && boardWriterSession != null) {					
					TextMessage tmpMsg = new TextMessage(caller + "님이 " + 
										"<a type='external' href='${pageContext.request.contextPath}/social/user/details?post_id="+seq+"'>" + seq + "</a> 번 게시글에 댓글을 남겼습니다.");
					boardWriterSession.sendMessage(tmpMsg); //로그인해있는 유저에게 보내기
					log.info("소켓 실행");
					AlarmDTO alarm = new AlarmDTO();
					alarm.setAlarmid(0);
					alarm.setCaller(caller);
					alarm.setCmd(cmd);
					alarm.setReceiver(receiver);
					alarm.setReceiverEmail(receiverUsername);
					alarm.setSeq(seq);
					
					int result = replyservice.insertAlarm(alarm);
					log.info("알람 insert " + result);
					
				}else if("followin".equals(cmd) && boardWriterSession != null) {
					log.info("소켓 실행");
					AlarmDTO alarm = new AlarmDTO();
					alarm.setAlarmid(0);
					alarm.setCaller(caller);
					alarm.setCmd(cmd);
					alarm.setReceiver(receiver);
					alarm.setReceiverEmail(receiverUsername);
					alarm.setSeq(seq);
					
					int result = replyservice.insertAlarm(alarm);
					log.info("알람 insert " + result);
					
					int nowAlarmid = replyservice.getAlarmid();
					
					TextMessage tmpMsg = new TextMessage(caller + "님이 " + receiver +
							 "님을 팔로우를 시작했습니다.!"+ nowAlarmid);
					boardWriterSession.sendMessage(tmpMsg);
					
					
					
				}else if("followdel".equals(cmd) && boardWriterSession != null) {
					log.info("소켓 실행");
					AlarmDTO alarm = new AlarmDTO();
					alarm.setAlarmid(0);
					alarm.setCaller(caller);
					alarm.setCmd(cmd);
					alarm.setReceiver(receiver);
					alarm.setReceiverEmail(receiverUsername);
					alarm.setSeq(seq);
					
					int result = replyservice.insertAlarm(alarm);
					log.info("알람 delete " + result);
					
					int nowAlarmid = replyservice.getAlarmid();
					
					TextMessage tmpMsg = new TextMessage(caller + "님이 " + receiver +
							 "님을 팔로우 취소 했습니다.!"+ nowAlarmid);
					boardWriterSession.sendMessage(tmpMsg);

				}
			}
		}
	}
	
	//연결 해제될때 -> 사용자 제거
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		System.out.println("afterConnectionClosed " + session + ", " + status);
		userSessionsMap.remove(session.getId());
		sessions.remove(session);
	}
	
	//웹소켓에 member email 가져오기
	//접속한 유저의 http세션을 조회하여 member_email 을 얻는 함수

	/*
	 * private String getEmail(WebSocketSession session) { Map<String, Object>
	 * httpSession = session.getAttributes(); log.info(httpSession); MemberVO
	 * loginUser = (MemberVO) httpSession.get("membervo");
	 * 
	 * if (loginUser == null) { return session.getId(); } else { return
	 * loginUser.getMember_email(); } }
	 */
	
	// 로그 메시지
	private void log(String logmsg) {
		System.out.println(new Date() + " : " + logmsg);
	}

}
