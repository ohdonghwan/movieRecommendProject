package muin.mvc.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import muin.mvc.model.dao.MovieDAO;
import muin.mvc.model.dto.MovieDTO;

@Service
public class MovieServiceImpl implements MovieService {
	@Autowired
	private MovieDAO movieDAO;

	@Override
	public List<MovieDTO> selectMovieByKeyWord(String searchKind, String keyWord) {	
		return 	movieDAO.selectMovieByKeyWord(searchKind, keyWord);
	}
}
