package muin.mvc.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import muin.mvc.model.dto.MovieDTO;
import muin.mvc.model.dto.RecommendDTO;

@Repository
public class RecommendDAOImpl implements RecommendDAO {

	@Autowired
	private SqlSession session;
	
	@Override
	public int insertRecommend(RecommendDTO dto) {		
		return session.insert("recommendMapper.insertRecommend", dto);
	}

	@Override
	public List<MovieDTO> selectRecommend() {		
		return session.selectList("recommendMapper.selectRecommed");
	}
	

}
