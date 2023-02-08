package com.theharmm.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.theharmm.domain.AlarmDTO;
import com.theharmm.domain.ReplyDTO;

public interface ReplyService {
	public int register(ReplyDTO replydto); //댓글 등록
    public List<List<ReplyDTO>> getReplyList(int post_id); //댓글 가져오기

    public List<ReplyDTO> getParentReplyList(int post_id);
    public List<ReplyDTO> getChildReplyList(int post_id, int depth);
    public String getMember_email(int sid);
    
	/* insert, delete, list, 총 갯수 */
		 
	 public int insertAlarm (AlarmDTO alarm); //알람 등록
	 public int deleteAlarm  (int alarmid); //알람 삭제
	 public List<AlarmDTO> getAlarmList (String receiverEmail); //알람 리스트
	 public int countAlarm (String receiverEmail); //알람 개수 세기
	 public int getAlarmid(); //알람 id 가져오기
}
