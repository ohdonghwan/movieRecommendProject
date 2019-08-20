package muin.mvc.model.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import muin.mvc.model.dto.MovieDTO;
import muin.mvc.model.service.DetailJson;
import muin.mvc.model.service.DetailService;

@Controller
public class DetailController {
	
	
	@Autowired	 // �󼼵����͸� ������ ��ü ����
	private DetailJson dJson;
	
	@Autowired
	private DetailService sv;
	
	@RequestMapping("detail/movieDetail")
	public String detail() {
	    String title="올드보이";	    
		  
			// �󼼵����͸� JSON���·� �޾� MovieDetailVO�� ����
	    MovieDTO dto =dJson.getJson(title);
			
			// �����ͺ��̽��� ���ӿ� �����ϴ°�ü�� ����� �����ͺ��̽��� �Է�
			sv.insert(dto);
			
		return "detail/movieDetail";
	}
}
