package muin.mvc.model.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import muin.mvc.model.dto.MovieDTO;
import muin.mvc.model.service.ApiJson;
import muin.mvc.model.service.ApiService;
import muin.mvc.model.service.DetailJson;
import muin.mvc.model.service.DetailService;


@Controller
public class ApiController {
	
	
	@Autowired	 // api 데이터를 얻어오는 객체 주입
	private ApiJson aJson;
	
	@Autowired
	private ApiService sv;
	
	@Autowired	 
	private DetailJson dJson;
	
	@Autowired
	private DetailService dsv;
	
	/**
	 * 전체 api 데이터 저장
	 * */
	@RequestMapping("/detail/list")
		public void insertAll() {
		List<MovieDTO> list = aJson.insertAll();
		sv.insertAll(list);
		ModelAndView mv = new ModelAndView();
		mv.addObject("list", list);
	}
	
	
	
	/**
	 * 상세보기 api 데이터
	 * */
	@RequestMapping("detail/movieDetail")
	public String detail() {
	    String title="올드보이";	    
		  
			
	    MovieDTO dto =dJson.getJson(title);
			
			
	    dsv.insert(dto);
	    
	    Map<String, String> map = new HashMap<String, String>();
	    //editing detail page!! please just a moment! I will finish today!
			
		return "detail/movieDetail";
	}
	
}
