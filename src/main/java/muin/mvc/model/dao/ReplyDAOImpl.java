package muin.mvc.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import muin.mvc.model.dto.ReplyDTO;
import muin.mvc.model.dto.ReportReplyDTO;

@Repository
public class ReplyDAOImpl implements ReplyDAO {
	@Autowired
	private SqlSession session;
	
	@Override
	public List<ReplyDTO> selectReply(int movieNo) {		
		return session.selectList("replyMapper.selectReply", movieNo);
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

	@Override
	public int replyDelete(Long replyNo, Long memberId) {
		Map<String, Long> map = new HashMap<String, Long>();
		map.put("replyNo", replyNo);
		map.put("memberId", memberId);
		return session.delete("replyMapper.replyDelete", map);
	}

	@Override
	public int insertReplyReport(Long memberId, Long replyNo) {
		Map<String, Long> map = new HashMap<String, Long>();
		map.put("memberId", memberId);
		map.put("replyNo", replyNo);
		return session.insert("replyMapper.insertReplyReport", map);
	}

	@Override
	public int sumReportReply(Long replyNo) {		
		return session.selectOne("replyMapper.sumReportReply", replyNo);
	}

	@Override
	public ReportReplyDTO checkReportReply(Long memberId, Long replyNo) {
		Map<String, Long> map = new HashMap<String, Long>();
		map.put("memberId", memberId);
		map.put("replyNo", replyNo);
		return session.selectOne("replyMapper.checkReportReply", map);
	}
}
