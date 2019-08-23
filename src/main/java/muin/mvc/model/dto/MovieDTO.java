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
	

	public MovieDTO(int movieNo, String movieName, String movieGenre, String movieStory, String movieActor,
			String movieDirector, String moviePoster) {
		super();
		this.movieNo = movieNo;
		this.movieName = movieName;
		this.movieGenre = movieGenre;
		this.movieStory = movieStory;
		this.movieActor = movieActor;
		this.movieDirector = movieDirector;
		this.moviePoster = moviePoster;
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
