package muin.mvc.model.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import muin.mvc.model.dto.MovieDTO;
import muin.mvc.model.service.MovieService;

@Controller
public class MovieController {
	
	@Autowired
	private MovieService movieService;
	
	@RequestMapping("movie/selectMovieView")
	public String selectMovieView() {
		return "select/selectMovie";
	}
	
	@RequestMapping("movie/selectMovie")
	@ResponseBody
	public List<MovieDTO> selectMovieByKeyWord(String keyWord) {
		List<MovieDTO> list = movieService.selectMovieByKeyWord(keyWord);
		return list;
	}
}
