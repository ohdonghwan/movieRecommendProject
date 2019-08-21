package muin.mvc.model.service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Component;

import muin.mvc.model.dto.MovieDTO;


/**
 * api에서 데이터를 얻어와 json 데이터 형태로 파싱
 * 1)jsonMovieApi : open API 파싱 (전체 파싱)
 * 2)getJson : 해당 상세정보 데이터 얻어와서 movieDTO에 저장
 */

@Component
public class DetailJson {
	String title;


	// 영화이름을 입력하면 해당하는 영화의 상세정보를 JSON데이터로 가져와 상세정보 객체를 만들어 반환
	public String jsonMovieApi(String title) throws IOException {

		String secretKey = "KADA8JG2N7IJF41LZK16";

		StringBuilder sb = null;
		String result = null;

		try {

			String apiURL = "http://api.koreafilm.or.kr/openapi-data2/wisenut/search_api/"
					+ "search_json.jsp?collection=kmdb_new&ServiceKey=" + secretKey + "&title=" + title; // json 결과

			URL url = new URL(apiURL);
			HttpURLConnection con = (HttpURLConnection) url.openConnection();
			con.setRequestMethod("GET");
			int responseCode = con.getResponseCode();

			BufferedReader br;
			if (responseCode == 200) { // 정상 호출
				br = new BufferedReader(new InputStreamReader(con.getInputStream(), "UTF-8"));
			} else { // 에러 발생
				br = new BufferedReader(new InputStreamReader(con.getErrorStream(), "UTF-8"));
			}

			sb = new StringBuilder();
			String line;

			while ((line = br.readLine()) != null) {
				sb.append(line + "\n");
			}

			br.close();
			con.disconnect();

			result = sb.toString();
			System.out.println("-------------json 추출 -----------");
			System.out.println(result);

		} catch (Exception e) {
			System.out.println(e);
		}
		return result;
	}//////////////////////////////////////////////////////////////////////////// jsonMovieApi_end

	static JSONArray array;
	static JSONObject obj;

	public MovieDTO getJson(String title) {
			
		MovieDTO dto = null;
		
		try {
			JSONParser jsonParser = new JSONParser();
			JSONObject jsonObject = (JSONObject) jsonParser.parse(jsonMovieApi(title));

			MovieDTO vo = new MovieDTO();

			// 입력한 영화제목을 MovieDTO 객체(vo)에 저장합니다.
			String plot; // movie_story
			String type; // movie_genre

			JSONArray data = (JSONArray) jsonObject.get("Data");// data 배열 뽑음
			JSONObject json2 = (JSONObject)data.get(0);
//          System.out.println("json2 : " + json2);//전체 데이터 출력
//            
            JSONArray json3 =(JSONArray)json2.get("Result");
//            
            
            ////////////////////////////////////////////////////////////////////
            
            
            JSONObject json4 = (JSONObject)json3.get(0);
            
            String movieName=(String)json4.get("title");

				vo.setMovieName(movieName);
				
			JSONArray json5 =(JSONArray)json4.get("actor");
	        JSONObject json6 = (JSONObject)json5.get(0);//배우여러갠데 첫번쨰 배열에서만 갖고옴
	        String actor=(String)json6.get("actorNm");
	         vo.setMovieActor(actor);
	         
	         
	        JSONArray json7 =(JSONArray)json4.get("director");
	        JSONObject json8 = (JSONObject)json7.get(0);
	        
	        
	        String director=(String)json8.get("directorNm");
	        vo.setMovieDirector(director);
	        
				plot = (String) json4.get("plot"); // movie_story
				vo.setMovieStory(plot);

				type = (String) json4.get("genre"); // movie_genre
				vo.setMovieGenre(type);
				
				String posters =(String)json4.get("posters");
				vo.setMoviePoster(posters);
			
				
				
				dto =new MovieDTO(0, vo.getMovieName(), vo.getMovieGenre(), vo.getMovieStory(), 
						vo.getMovieActor(), vo.getMovieDirector(),vo.getMoviePoster());

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;

	}// getJson

}// 클래스
