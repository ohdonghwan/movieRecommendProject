package muin.mvc.model.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import muin.mvc.model.dto.MovieDTO;
import muin.mvc.model.service.DetailJson;
import muin.mvc.model.service.DetailService;

@Controller
public class DetailController {
	
	
	@Autowired	 // 상세데이터를 얻어오는 객체 주입
	private DetailJson dJson;
	
	@Autowired
	private DetailService sv;
	
	@RequestMapping("detail/movieDetail")
	public String detail() {
	    String title="올드보이";	    
		  
			// 상세데이터를 JSON형태로 받아 MovieDetailVO에 저장
	    MovieDTO dto =dJson.getJson(title);
			
			// 데이터베이스에 접속에 관련하는객체를 만들고 데이터베이스에 입력
			sv.insert(dto);
			
		return "detail/movieDetail";
	}
}
