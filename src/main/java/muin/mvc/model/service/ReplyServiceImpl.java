package muin.mvc.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import muin.mvc.model.dao.ReplyDAO;
import muin.mvc.model.dto.ReplyDTO;

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
	
}
