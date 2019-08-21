package muin.mvc.model.service;

import java.util.List;

import muin.mvc.model.dto.ReplyDTO;

public interface ReplyService {
	public List<ReplyDTO> selectReply(int movieNo);
	
	public void insertReply(ReplyDTO replyDTO);
	
	public void replyUp(Long replyNo);
	
	public void replyDown(Long replyNo);
}
