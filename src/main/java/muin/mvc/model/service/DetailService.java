package muin.mvc.model.service;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import muin.mvc.model.dao.DetailDAO;
import muin.mvc.model.dto.MovieDTO;



@Service

public class DetailService {

	@Autowired
	private DetailDAO dDAO;

	
	
	
	public void insert(MovieDTO dto) {
		
		dDAO.insertDetail(dto);
	}

}
