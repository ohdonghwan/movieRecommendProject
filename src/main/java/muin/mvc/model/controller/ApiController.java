package muin.mvc.model.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import muin.mvc.model.dto.MovieDTO;
import muin.mvc.model.service.ApiJson;
import muin.mvc.model.service.ApiService;


@Controller
public class ApiController {
	
	
	@Autowired	 // api 데이터를 얻어오는 객체 주입
	private ApiJson aJson;
	
	@Autowired
	private ApiService sv;
	
	
	/**
	 * 전체 api 데이터 저장
	 * */
	@RequestMapping("api/insert")
		public void insertAll() {
		List<MovieDTO> list = aJson.insertAll();
		sv.insertAll(list);
	}
	
	
	/**
	 * 전체 api 데이터 목록 출력
	 * */
	@RequestMapping("api/list")
		public ModelAndView selectAll() {
		List<MovieDTO> list = sv.selectAll();
		ModelAndView mv = new ModelAndView();
		mv.addObject("list", list);
		return mv;
	}
	
	
	/**
	 * 상세보기 api 데이터
	 * */
	@RequestMapping("api/movieDetail/{movieNo}")
	public ModelAndView detail(@PathVariable("movieNo") int movieNo, ModelAndView mv) {
	
		mv.setViewName("api/movieDetail");
		mv.addObject("MovieDTO",sv.detailMovie(movieNo));
		System.out.println("detail 시작 . . .");
	//	System.out.println("받은 값 "+request.getParameter("movieNo"));
		return mv;
	}
	
	
	/**
	 * 배우 상세보기
	 * */
//	@RequestMapping("api/actiorDetail/{movieActor}")
//	public ModelAndView detailActor(@PathVariable("movieActor") String movieActor, ModelAndView mv) {
//		mv.setViewName("api/actiorDetail");
//		mv.addObject("MovieDTO",sv.detailMovie(movieActor));
//		System.out.println("Actor Detail Start . . .");
//		return mv;
//	}
	
}
