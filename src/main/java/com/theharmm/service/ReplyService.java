package com.theharmm.service;

import java.util.ArrayList;
import java.util.List;

import com.theharmm.domain.ReplyDTO;

public interface ReplyService {
	public int register(ReplyDTO replydto);
    public List<List<ReplyDTO>> getReplyList(int post_id);
    public List<ReplyDTO> getParentReplyList(int post_id);
    public List<ReplyDTO> getChildReplyList(int post_id, int depth);
}
