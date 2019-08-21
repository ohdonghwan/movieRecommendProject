package muin.mvc.model.dao;

import java.util.List;

import muin.mvc.model.dto.ReplyDTO;

public interface ReplyDAO {
public List<ReplyDTO> selectReply(int movieNo);
	
	public void insertReply(ReplyDTO replyDTO);
	
	public void replyUp(Long replyNo);
	
	public void replyDown(Long replyNo);
	
	public int replyDelete(Long replyNo, Long memberId);
}
