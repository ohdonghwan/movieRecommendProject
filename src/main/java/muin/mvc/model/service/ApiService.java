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

	
	public void insertAll(List<MovieDTO> list) {
				
				for(MovieDTO dto : list) {
				dao.insertAll(dto);
				}
		
	}

}
