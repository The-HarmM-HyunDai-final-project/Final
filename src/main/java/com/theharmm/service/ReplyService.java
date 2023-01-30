package com.theharmm.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.theharmm.domain.AlarmDTO;
import com.theharmm.domain.ReplyDTO;

public interface ReplyService {
	public int register(ReplyDTO replydto);
    public List<List<ReplyDTO>> getReplyList(int post_id);
    public List<ReplyDTO> getParentReplyList(int post_id);
    public List<ReplyDTO> getChildReplyList(int post_id, int depth);
    public String getMember_email(int sid);
    
	/* insert, delete, list, 총 갯수 */
		 
	 public int insertAlarm (AlarmDTO alarm);
	 public int deleteAlarm  (int alarmid);
	 public List<AlarmDTO> getAlarmList (String receiverEmail);
	 public int countAlarm (String receiverEmail);
	 public int getAlarmid();
}
