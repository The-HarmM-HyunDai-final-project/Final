package com.theharmm.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.theharmm.domain.AlarmDTO;
import com.theharmm.domain.ReplyDTO;

@Mapper
public interface ReplyMapper {
	 public int insert(ReplyDTO replydto);
	 public List<ReplyDTO> getReplyList(int post_id );
	 public List<ReplyDTO> getParentReplyList(int post_id);
	 public List<ReplyDTO> getChildReplyList(int post_id, int depth);
	 public String getMember_email(int sid);
	 
		/* insert, delete, list, 총 갯수 */
	 
	 public int insertAlarm (AlarmDTO alarm);
	 public int deleteAlarm (@Param("alarmid") int alarmid);
	 public List<AlarmDTO> alarmList (@Param("receiverEmail") String receiverEmail);
	 public int countAlarm (@Param("receiverEmail") String receiverEmail);
	 public int alarmid();
}
