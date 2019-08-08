package muin.mvc.model.dao;

import java.util.List;

import muin.mvc.model.dto.MovieDTO;
import muin.mvc.model.dto.RecommendDTO;

public interface RecommendDAO {
	public int insertRecommend(RecommendDTO dto);
	
	
	public List<MovieDTO> selectRecommend();
}
