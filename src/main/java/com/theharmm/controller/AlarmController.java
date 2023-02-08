package com.theharmm.controller;

import java.util.List;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.theharmm.domain.AlarmDTO;
import com.theharmm.security.domain.CustomUser;
import com.theharmm.service.ReplyService;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/alarm/*")
public class AlarmController {
	
	@Autowired
	ReplyService replyservice;
	
	// 알람 개수 세기
	@RequestMapping(value = "/countAlarm", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public int countAlarm() {
		CustomUser user = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String receiverEmail = user.getUsername();
		int alarmCnt = replyservice.countAlarm(receiverEmail);
		return alarmCnt;
	}
	
	// 알람 삭제
	@RequestMapping(value = "/deleteAlarm", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public int deleteAlarm(@RequestParam("alarmid") int alarmid) {
		
		int result = replyservice.deleteAlarm(alarmid);
		return result;
	}
	
	// 알람 리스트
	@RequestMapping(value = "/getAlarmList", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String getAlarmList() {
		log.info("getAlarmList 실행");
		CustomUser user = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String receiverEmail = user.getUsername();
		
		JSONObject jsonObject = new JSONObject();
		JSONArray jsonArray = new JSONArray();
		
		List<AlarmDTO> alarmList = replyservice.getAlarmList(receiverEmail);
		for(AlarmDTO alarm : alarmList) {
			JSONObject tmpObject = new JSONObject();
			
			JSONObject pObject = new JSONObject();
			pObject.put("alarmid", alarm.getAlarmid());
			pObject.put("cmd", alarm.getCmd());
			pObject.put("caller", alarm.getCaller());
			pObject.put("receiver", alarm.getReceiver());
			pObject.put("receiverEmail", alarm.getReceiverEmail());
			pObject.put("seq", alarm.getSeq());
			
			//tmpObject.put("alarm", pObject);
			jsonArray.put(pObject);
		}
		
		jsonObject.put("alarms", jsonArray);
		String json = jsonObject.toString();
		
		log.info(json);
		return json.toString();
	}
}
