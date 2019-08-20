package muin.mvc.model.service;

import java.io.IOException;
import java.util.List;

import org.apache.mahout.cf.taste.common.TasteException;

import com.opencsv.exceptions.CsvDataTypeMismatchException;
import com.opencsv.exceptions.CsvRequiredFieldEmptyException;

import muin.mvc.model.dto.MovieDTO;
import muin.mvc.model.dto.RecommendDTO;

public interface RecommendService {
	public int insertRecommend(RecommendDTO dto);	
	
	public List<MovieDTO> selectRecommend(Long memberId);
	
	public void createCsv() throws IOException, CsvDataTypeMismatchException, CsvRequiredFieldEmptyException;
	
	public List<MovieDTO> recommendMovie(Long memberId) throws IOException, TasteException;
	
	public List<RecommendDTO> myRecommendGrade(Long memberId);
}
