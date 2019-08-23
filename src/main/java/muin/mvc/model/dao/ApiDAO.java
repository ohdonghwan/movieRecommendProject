package muin.mvc.model.dao;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import muin.mvc.model.dto.MovieDTO;

/**
 * 상세정보를 DB에 저장
 * */

@Repository
public class ApiDAO {

	@Autowired
	private SqlSession session;
	
	/**
	 * api 데이터 전체 저장
	 * */
	public void insertAll(MovieDTO dDTO) {
		session.insert("movieApiMapper.insertall", dDTO);
	}
	
	/**
	 * api 데이터 전체 검색
	 * */
	public List<MovieDTO> selectAll() {
		List<MovieDTO> list =session.selectList("movieApiMapper.selectAll");
		return list;
	}
	
	/**
	 * 상세보기
	 * */
	public MovieDTO detailMovie(int movieNo) {
		
		return session.selectOne("movieApiMapper.selectMovie", movieNo);
	}
	        
}//클래스
