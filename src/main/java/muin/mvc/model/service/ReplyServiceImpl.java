package muin.mvc.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import muin.mvc.model.dao.ReplyDAO;
import muin.mvc.model.dto.ReplyDTO;
import muin.mvc.model.dto.ReportReplyDTO;

@Service
public class ReplyServiceImpl implements ReplyService{

	@Autowired
	private ReplyDAO replyDAO;
	
	@Override
	public List<ReplyDTO> selectReply(int movieNo) {
		return replyDAO.selectReply(movieNo);
	}

	@Override
	public void insertReply(ReplyDTO replyDTO) {
		replyDAO.insertReply(replyDTO);
	}

	@Override
	public void replyUp(Long replyNo) {
		replyDAO.replyUp(replyNo);
	}

	@Override
	public void replyDown(Long replyNo) {
		replyDAO.replyDown(replyNo);
	}

	@Override
	public int replyDelete(Long replyNo, Long memberId) {
		return replyDAO.replyDelete(replyNo, memberId);
	}

	@Override
	public int insertReplyReport(Long memberId, Long replyNo) {		
		return replyDAO.insertReplyReport(memberId, replyNo);
	}

	@Override
	public int sumReportReply(Long replyNo) {
		return replyDAO.sumReportReply(replyNo);
	}

	@Override
	public ReportReplyDTO checkReportReply(Long memberId, Long replyNo) {
		return replyDAO.checkReportReply(memberId, replyNo);
	}
	
}
