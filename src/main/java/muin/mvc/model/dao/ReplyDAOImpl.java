package muin.mvc.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import muin.mvc.model.dto.ReplyDTO;

@Repository
public class ReplyDAOImpl implements ReplyDAO {
	@Autowired
	private SqlSession session;
	
	@Override
	public List<ReplyDTO> selectReply(int movieNo) {		
		return session.selectList("replyMapper.selectReply");
	}

	@Override
	public void insertReply(ReplyDTO replyDTO) {
		session.insert("replyMapper.insertReply", replyDTO);
	}

	@Override
	public void replyUp(Long replyNo) {
		session.update("replyMapper.replyUp", replyNo);
	}

	@Override
	public void replyDown(Long replyNo) {
		session.update("replyMapper.replyDown", replyNo);
	}

}
