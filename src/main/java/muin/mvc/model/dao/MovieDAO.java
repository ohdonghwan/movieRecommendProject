package muin.mvc.model.dao;

import java.util.List;

import muin.mvc.model.dto.MovieDTO;

public interface MovieDAO {
	public List<MovieDTO> selectMovieByKeyWord(String keyWord);
}
