package muin.mvc.model.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import muin.mvc.model.dto.MovieDTO;
import muin.mvc.model.dto.RecommendDTO;
import muin.mvc.model.service.RecommendService;

@Controller
public class RecommendController {
	
	@Autowired
	private RecommendService recommendService;
	
	@RequestMapping("/recommend/main")
	public void recommendMain() {}
	
	@RequestMapping("/recommend/select")
	@ResponseBody
	public List<MovieDTO> selectRecommend(Long memberId){
		List<MovieDTO> list = new ArrayList<MovieDTO>();
		list = recommendService.selectRecommend(memberId);
		return list;
	}
	
	@RequestMapping("/recommend/insert")
	@ResponseBody
	public String recommendInsert(RecommendDTO dto) {
		System.out.println(dto.getMemberId()+"\t"+dto.getMovieNo()+"\t"+dto.getRecommendGrade());
		recommendService.insertRecommend(dto);
		return "1";
	}
}
