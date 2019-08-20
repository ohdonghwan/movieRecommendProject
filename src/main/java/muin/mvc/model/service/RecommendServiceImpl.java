package muin.mvc.model.service;

import java.io.IOException;
import java.util.List;

import org.apache.mahout.cf.taste.common.TasteException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.opencsv.exceptions.CsvDataTypeMismatchException;
import com.opencsv.exceptions.CsvRequiredFieldEmptyException;

import muin.mvc.model.dao.RecommendDAO;
import muin.mvc.model.dto.MovieDTO;
import muin.mvc.model.dto.RecommendDTO;

@Service
public class RecommendServiceImpl implements RecommendService {
	
	@Autowired
	private RecommendDAO recommendDAO;
	
	@Override
	public int insertRecommend(RecommendDTO dto) {		
		return recommendDAO.insertRecommend(dto);
	}

	@Override
	public List<MovieDTO> selectRecommend(Long memberId) {
		return recommendDAO.selectRecommend(memberId);
	}

	@Override
	public void createCsv() throws IOException, CsvDataTypeMismatchException, CsvRequiredFieldEmptyException {
		recommendDAO.createCsv();
	}

	@Override
	public List<MovieDTO> recommendMovie(Long memberId) throws IOException, TasteException {
		return recommendDAO.recommendMovie(memberId);
	}

	@Override
	public List<RecommendDTO> myRecommendGrade(Long memberId) {
		return recommendDAO.myRecommendGrade(memberId);
	}
}
