package muin.mvc.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import muin.mvc.model.dao.ApiDAO;
import muin.mvc.model.dto.MovieDTO;

@Service
public class ApiService {

	@Autowired
	private ApiDAO dao;

	/**
	 * api 데이터 전체 저장
	 * */
	public void insertAll(List<MovieDTO> list) {
		for (MovieDTO dto : list) {
			dao.insertAll(dto);

		}

	}
	
	/**
	 * api 데이터 전체 검색
	 * */
	public List<MovieDTO> selectAll() {
		List<MovieDTO> list =dao.selectAll();
		return list;
	}
//	http://file.koreafilm.or.kr/thm/02/00/05/17/tn_DPF018219.jpg
	/**
	 * 영화 상세 검색
	 * */
	public MovieDTO detailMovie(int movieNo) {
		MovieDTO dto =dao.detailMovie(movieNo);
		System.out.println("포스터"+dto.getMoviePoster());
		String[] changePoster = dto.getMoviePoster().split(".jpg");
		dto.setMoviePoster(changePoster[0]+".jpg");
		
		return dto;
	}

	/**
	 * 배우 상세 검색
	 * */
	public Object detailMovie(String movieActor) {
		// TODO Auto-generated method stub
		return null;
	}

}
