package muin.mvc.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import muin.mvc.model.dto.MovieDTO;

@Repository
public class MovieDAOImpl implements MovieDAO {
	@Autowired
	private SqlSession session;

	@Override
	public List<MovieDTO> selectMovieByKeyWord(String keyWord) {		
		return session.selectList("movieMapper.selectMovieByKeyWord", keyWord);
	}
}
