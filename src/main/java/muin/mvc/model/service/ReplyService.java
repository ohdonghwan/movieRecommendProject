package muin.mvc.model.service;

import java.util.List;

import muin.mvc.model.dto.ReplyDTO;
import muin.mvc.model.dto.ReportReplyDTO;

public interface ReplyService {
	public List<ReplyDTO> selectReply(int movieNo);
	
	public void insertReply(ReplyDTO replyDTO);
	
	public void replyUp(Long replyNo);
	
	public void replyDown(Long replyNo);
	
	public int replyDelete(Long replyNo, Long memberId);
	
	public int insertReplyReport(Long memberId, Long replyNo);
	
	public int sumReportReply(Long replyNo);
	
	public ReportReplyDTO checkReportReply(Long memberId, Long replyNo);
}
