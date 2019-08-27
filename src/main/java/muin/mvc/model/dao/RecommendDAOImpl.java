package muin.mvc.model.dao;

import java.io.File;
import java.io.IOException;
import java.io.Writer;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.mahout.cf.taste.common.TasteException;
import org.apache.mahout.cf.taste.impl.model.file.FileDataModel;
import org.apache.mahout.cf.taste.impl.neighborhood.ThresholdUserNeighborhood;
import org.apache.mahout.cf.taste.impl.recommender.GenericUserBasedRecommender;
import org.apache.mahout.cf.taste.impl.similarity.PearsonCorrelationSimilarity;
import org.apache.mahout.cf.taste.model.DataModel;
import org.apache.mahout.cf.taste.neighborhood.UserNeighborhood;
import org.apache.mahout.cf.taste.recommender.RecommendedItem;
import org.apache.mahout.cf.taste.recommender.UserBasedRecommender;
import org.apache.mahout.cf.taste.similarity.UserSimilarity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.opencsv.CSVWriter;
import com.opencsv.exceptions.CsvDataTypeMismatchException;
import com.opencsv.exceptions.CsvRequiredFieldEmptyException;

import muin.mvc.model.dto.MovieDTO;
import muin.mvc.model.dto.RecommendDTO;

@Repository
public class RecommendDAOImpl implements RecommendDAO {

	@Autowired
	private SqlSession session;
	
	@Override
	public int insertRecommend(RecommendDTO dto) {		
		return session.insert("recommendMapper.insertRecommend", dto);
	}

	@Override
	public List<MovieDTO> selectRecommend(Long memberId) {		
		return session.selectList("recommendMapper.selectRecommed", memberId);
	}
	
	public void createCsv() throws IOException, CsvDataTypeMismatchException, CsvRequiredFieldEmptyException {
		//openCSV를 통해 select 값 .csv로 저장
		List<RecommendDTO> list = session.selectList("recommendMapper.selectAllRecommend");
		try (
			Writer writer = Files.newBufferedWriter(Paths.get("C:\\Users\\dhehd\\eclipse-workspace\\test.csv"));
			CSVWriter csvWriter = new CSVWriter(writer,
					CSVWriter.DEFAULT_SEPARATOR,
					CSVWriter.NO_QUOTE_CHARACTER,
					CSVWriter.DEFAULT_ESCAPE_CHARACTER,
					CSVWriter.DEFAULT_LINE_END);
		){			
			for(RecommendDTO dto : list) {
				csvWriter.writeNext(new String[] {Integer.toString(dto.getMemberId()),Integer.toString(dto.getMovieNo()), Integer.toString((dto.getRecommendGrade()))});
			}
		}
	}
	public List<MovieDTO> recommendMovie(Long memberId) throws IOException, TasteException{
		//mahout 쓰는 코드
		DataModel model = new FileDataModel(new File("C:\\Users\\dhehd\\eclipse-workspace\\test.csv"));
		UserSimilarity similarity = new PearsonCorrelationSimilarity(model);
		UserNeighborhood neighborhood = new ThresholdUserNeighborhood(0.1,
				similarity, model);
		UserBasedRecommender recommender = new GenericUserBasedRecommender(
				model, neighborhood, similarity);
		List<RecommendedItem> recommendations = recommender.recommend(memberId,12);
		
		
		List<MovieDTO> movieList = new ArrayList<MovieDTO>();
		for (RecommendedItem recommendation : recommendations) {
			int movieNo = (int) recommendation.getItemID();
			MovieDTO movieDTO = session.selectOne("recommendMapper.recommendMovie", movieNo);
			movieList.add(movieDTO);
		}
		return movieList;
	}

	@Override
	public List<RecommendDTO> myRecommendGrade(Long memberId) {
		List<RecommendDTO> list = session.selectList("memberMapper.myRecommendGrade", memberId);
		return list;
	}

}
