package muin.mvc.model.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class MovieDTO {
	
	public MovieDTO(int i, String movieName2, String movieGenre2, String movieStory2, String movieActor2,
			String movieDirector2, String moviePoster2) {
		// TODO Auto-generated constructor stub
	}


	private int movieNo;
	private String movieName;
	private String movieGenre;
	private String movieStory;
	private String movieActor;
	private String movieDirector;
	private String moviePoster;
	
	
	private RecommendDTO recommendDTO;
	
	private WishListDTO wishListDTO;
	
}
