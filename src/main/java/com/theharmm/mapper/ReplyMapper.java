package com.theharmm.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.theharmm.domain.AlarmDTO;
import com.theharmm.domain.ReplyDTO;

@Mapper
public interface ReplyMapper {
	 public int insert(ReplyDTO replydto); // 댓글 등록
	 public List<ReplyDTO> getReplyList(int post_id ); // 포스트 별로 댓글 리스트 가져오기
	 public String getMember_email(int sid); // 댓글을 작성한 member email 가져오기
	 
	 
	 public int insertAlarm (AlarmDTO alarm); // 알람 등록
	 public int deleteAlarm (@Param("alarmid") int alarmid); // 알람 삭제
	 public List<AlarmDTO> alarmList (@Param("receiverEmail") String receiverEmail); // 알람 리스트
	 public int countAlarm (@Param("receiverEmail") String receiverEmail); // 알람 개수 세기
	 public int alarmid(); // 알람 id 불러오기
	 
	 
	 public List<ReplyDTO> getParentReplyList(int post_id); //
	 public List<ReplyDTO> getChildReplyList(int post_id, int depth);
}
