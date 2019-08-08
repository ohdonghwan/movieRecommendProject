package muin.mvc.model.service;

import java.util.List;

import muin.mvc.model.dto.MovieDTO;
import muin.mvc.model.dto.RecommendDTO;

public interface RecommendService {
	public int insertRecommend(RecommendDTO dto);
	
	
	public List<MovieDTO> selectRecommend();
}
