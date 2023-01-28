package com.theharmm.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.theharmm.domain.ReplyDTO;

@Mapper
public interface ReplyMapper {
	public int insert(ReplyDTO replydto);
	 public List<ReplyDTO> getReplyList(int post_id );
	 public List<ReplyDTO> getParentReplyList(int post_id);
	 public List<ReplyDTO> getChildReplyList(int post_id, int depth);
}
