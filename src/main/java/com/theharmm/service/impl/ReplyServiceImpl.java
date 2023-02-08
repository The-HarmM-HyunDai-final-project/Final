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

		// 전체 댓글 리스트를 조회하며 부모 댓글, 자식 댓글을 분리 한다
		for (ReplyDTO boardReply : boardReplyList) {
			if (boardReply.getParent_id() == 0) {
				boardReplyListParent.add(boardReply);
			} else {
				boardReplyListChild.add(boardReply);
			}
		}
		
		// 부모댓글당 달리는 자식 댓글을 모아 리스트를 만든다
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

	// 알람 등록
	@Override
	public int insertAlarm(AlarmDTO alarm) {
		return replymapper.insertAlarm(alarm);
	}

	// 알람 삭제
	@Override
	public int deleteAlarm(int alarmid) {
		return replymapper.deleteAlarm(alarmid);
	}

	// 알람 리스트
	@Override
	public List<AlarmDTO> getAlarmList(String receiverEmail) {
		return replymapper.alarmList(receiverEmail);
	}

	// 알람 개수
	@Override
	public int countAlarm(String receiverEmail) {
		return replymapper.countAlarm(receiverEmail);
	}

	// 알람 id 불러오기
	@Override
	public int getAlarmid() {
		return replymapper.alarmid() ;
	}

	// sid로 member email 가져오기
	@Override
	public String getMember_email(int sid) {
		return replymapper.getMember_email(sid);
	}

}
