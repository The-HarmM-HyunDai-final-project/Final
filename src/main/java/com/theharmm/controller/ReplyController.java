package com.theharmm.controller;


import java.util.List;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.theharmm.domain.ReplyDTO;
import com.theharmm.service.ReplyService;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class ReplyController {
	
	@Autowired
	ReplyService replyservice;
	
	@RequestMapping(value = "social/insertReply", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String insertReply(String member_email, int post_id, String content,
				@RequestParam(defaultValue = "0") int parent_id, @RequestParam(defaultValue = "0") int depth) {
		
		ReplyDTO dto = new ReplyDTO();
		dto.setMember_email(member_email);
		dto.setPost_id(post_id);
		dto.setContent(content);
		dto.setParent_id(parent_id);
		dto.setDepth(depth);
		
		int result = 0;
		log.info("insert 실행");
		log.info(dto);
		try {
			result = replyservice.register(dto);
		} catch (Exception e){
			log.info("댓글 등록 실패");
		}
		log.info(result);
		
		String parent_member_email = replyservice.getMember_email(parent_id);
		
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("result",result);
		jsonObject.put("parent_member_email",parent_member_email);
		
		String json = jsonObject.toString();
		return json;
	}
	
	@GetMapping(value = "social/getReplyList", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String getReplyList (@RequestParam(defaultValue = "0") int post_id) {
		log.info("getReplyList 실행" + post_id);
		JSONObject jsonObject = new JSONObject();
		JSONArray jsonArray = new JSONArray();
		
		List<List<ReplyDTO>> replyList = replyservice.getReplyList(post_id);
		//List<ReplyDTO> PreplyList = replyservice.getParentReplyList(post_id);
		
		log.info(replyList);
		
		for (List<ReplyDTO> replys : replyList) {
			JSONObject tmpObject = new JSONObject();
			
			JSONObject mObject = new JSONObject();
			JSONArray sObject = new JSONArray();
			for (int i = 0; i < replys.size(); i++) {
				JSONObject sObjectTmp = new JSONObject();
				if (replys.get(i).getParent_id() == 0) {
					mObject.put("status","main");
					mObject.put("member_email", replys.get(i).getMember_email());
					mObject.put("post_id", replys.get(i).getPost_id());
					mObject.put("content", replys.get(i).getContent());
					mObject.put("parent_id", replys.get(i).getParent_id());
					mObject.put("depth", replys.get(i).getDepth());
					mObject.put("regdate", replys.get(i).getRegdate());
					mObject.put("sid", replys.get(i).getSid());
					
					
					tmpObject.put("Mreply", mObject);
				} else {
					String parent_member_email = replyservice.getMember_email(replys.get(i).getParent_id());
					sObjectTmp.put("status","sub");
					sObjectTmp.put("member_email", replys.get(i).getMember_email());
					sObjectTmp.put("post_id", replys.get(i).getPost_id());
					sObjectTmp.put("content", replys.get(i).getContent());
					sObjectTmp.put("parent_id", replys.get(i).getParent_id());
					sObjectTmp.put("depth", replys.get(i).getDepth());
					sObjectTmp.put("regdate", replys.get(i).getRegdate());
					sObjectTmp.put("sid", replys.get(i).getSid());
					sObjectTmp.put("parent_member_email", parent_member_email);
					sObject.put(sObjectTmp);
				}				
			}
			tmpObject.put("Sreplys", sObject);
			jsonArray.put(tmpObject);
		}
		
		jsonObject.put("replyList", jsonArray);
		log.info(replyList);
		String json = jsonObject.toString();
		return json;		
	}
}
