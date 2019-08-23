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
	
	/**
	 * 영화 상세 검색
	 * */
	public MovieDTO detailMovie(int movieNo) {
		MovieDTO dto =dao.detailMovie(movieNo);
		//dto.setMoviePoster(dto.getMoviePoster().split("|")[0]);
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
