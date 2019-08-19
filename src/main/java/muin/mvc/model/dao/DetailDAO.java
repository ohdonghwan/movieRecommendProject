package muin.mvc.model.dao;



import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import muin.mvc.model.dto.MovieDTO;

/**
 * 상세정보를 DB에 저장
 * */

@Repository
public class DetailDAO {

	@Autowired
	private SqlSession session;
	
	
	public void insertDetail(MovieDTO dDTO) {
		
		session.insert("movieDetailMapper.insert", dDTO);
	}
	        
}//클래스
