package com.theharmm.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.theharmm.domain.AlarmDTO;
import com.theharmm.domain.ReplyDTO;
import com.theharmm.mapper.ReplyMapper;
import com.theharmm.service.ReplyService;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class ReplyServiceImpl implements ReplyService {

	@Autowired
	private ReplyMapper replymapper;

	@Override
	public int register(ReplyDTO replydto) {
		return replymapper.insert(replydto);
	}

	@Override
	public List<List<ReplyDTO>> getReplyList(int post_id) {

		List<ReplyDTO> boardReplyList = replymapper.getReplyList(post_id);

		// 부모
		List<ReplyDTO> boardReplyListParent = new ArrayList<ReplyDTO>();
		// 자식
		List<ReplyDTO> boardReplyListChild = new ArrayList<ReplyDTO>();
		// 통합
		List<List<ReplyDTO>> newBoardReplyList = new ArrayList<>();

		// parentid가 없으면 부모 -> 내가 답글 달고자 하는 사람의 id // depth 에 최상위 부모id 입력

		// 1.부모와 자식 분리
		/*
		 * for (ReplyDTO boardReply: boardReplyList) { if (boardReply.getParent_id() ==
		 * 0) { boardReplyListParent.add(boardReply); } else {
		 * boardReplyListChild.add(boardReply); } }
		 * 
		 * // 2.부모를 돌린다. for (ReplyDTO boardReplyParent: boardReplyListParent) { //2-1.
		 * 부모는무조건 넣는다. newBoardReplyList.add(boardReplyParent); // 3.자식을 돌린다. for
		 * (ReplyDTO boardReplyChild: boardReplyListChild) { // 3-1. 부모의 자식인 것들만 넣는다. if
		 * (boardReplyParent.getSid() == boardReplyChild.getParent_id()) {
		 * newBoardReplyList.add(boardReplyChild); }
		 * 
		 * } }
		 */

		for (ReplyDTO boardReply : boardReplyList) {
			if (boardReply.getParent_id() == 0) {
				boardReplyListParent.add(boardReply);
			} else {
				boardReplyListChild.add(boardReply);
			}
		}
		
		for (int i = 0; i < boardReplyListParent.size(); i++) {
			List<ReplyDTO> tmp = new ArrayList<>();
			tmp.add(boardReplyListParent.get(i));
			newBoardReplyList.add(tmp);
			// 자식 돌리기
			for (int j = 0; j < boardReplyListChild.size(); j++) {
				if (boardReplyListChild.get(j).getDepth() == boardReplyListParent.get(i).getSid()) {
					newBoardReplyList.get(i).add(boardReplyListChild.get(j));
				}
			}
		}

		// 정리한 list return
		return newBoardReplyList;
	}

	@Override
	public List<ReplyDTO> getParentReplyList(int post_id) {
		return replymapper.getParentReplyList(post_id);
	}

	@Override
	public List<ReplyDTO> getChildReplyList(int post_id, int depth) {
		return replymapper.getChildReplyList(post_id, depth);
	}

	@Override
	public int insertAlarm(AlarmDTO alarm) {
		return replymapper.insertAlarm(alarm);
	}

	@Override
	public int deleteAlarm(int alarmid) {
		return replymapper.deleteAlarm(alarmid);
	}

	@Override
	public List<AlarmDTO> getAlarmList(String receiverEmail) {
		return replymapper.alarmList(receiverEmail);
	}

	@Override
	public int countAlarm(String receiverEmail) {
		return replymapper.countAlarm(receiverEmail);
	}

	@Override
	public int getAlarmid() {
		return replymapper.alarmid() ;
	}

	@Override
	public String getMember_email(int sid) {
		return replymapper.getMember_email(sid);
	}

}
