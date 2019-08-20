package muin.mvc.model.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.apache.mahout.cf.taste.common.TasteException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.opencsv.exceptions.CsvDataTypeMismatchException;
import com.opencsv.exceptions.CsvRequiredFieldEmptyException;

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
		recommendService.insertRecommend(dto);
		return "1";
	}
	
	//추천을 위한 CSV파일을 만든다
	@RequestMapping("/recommend/createCsv")
	public String exportcsv() throws CsvDataTypeMismatchException, CsvRequiredFieldEmptyException, IOException {
		recommendService.createCsv();
		return "recommend/recommendMovie";	 //뷰이름
	}
	
	//드디어 추천!
	@RequestMapping("/recommend/recommendMovie")
	@ResponseBody
	public List<MovieDTO> recommendMovie(Long memberId) throws IOException, TasteException {
		List<MovieDTO> list = recommendService.recommendMovie(memberId);
		return list;
	}
	
	@RequestMapping("/member/myRecommendGrade")
	public ModelAndView myRecommendGrade(Long memberId){
		List<RecommendDTO> list = recommendService.myRecommendGrade(memberId);
		return new ModelAndView("member/myRecommendGrade", "list", list);	
	}
}
