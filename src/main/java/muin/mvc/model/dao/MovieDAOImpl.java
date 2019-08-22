package muin.mvc.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import muin.mvc.model.dto.MovieDTO;

@Repository
public class MovieDAOImpl implements MovieDAO {
	@Autowired
	private SqlSession session;

	@Override
	public List<MovieDTO> selectMovieByKeyWord(String searchKind, String keyWord) {		
		Map<String, String> map = new HashMap<String, String>();
		map.put("searchKind", searchKind);
		map.put("keyWord", keyWord);
		System.out.println(map);
		return session.selectList("movieMapper.selectMovieByKeyWord", map);
	}
}
