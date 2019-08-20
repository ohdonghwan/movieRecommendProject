package muin.mvc.model.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import muin.mvc.model.dto.MovieDTO;
import muin.mvc.model.service.ApiJson;
import muin.mvc.model.service.ApiService;


@Controller
public class ListController {
	
	
	@Autowired	 // api 데이터를 얻어오는 객체 주입
	private ApiJson aJson;
	
	@Autowired
	private ApiService sv;
	
	@RequestMapping("/detail/list")
		public void insertAll() {
		List<MovieDTO> list = aJson.insertAll();
		sv.insertAll(list);
		ModelAndView mv = new ModelAndView();
		mv.addObject("list", list);
	}
	
}
