package muin.mvc.model.service;

import java.util.List;

import muin.mvc.model.dto.MovieDTO;

public interface MovieService {
	public List<MovieDTO> selectMovieByKeyWord(String keyWord);
}
