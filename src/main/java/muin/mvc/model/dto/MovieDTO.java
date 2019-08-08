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
	private int movieNo;
	private String movieName;
	private String movieGenre;
	private String movieStory;
	private String movieActor;
	private String movieDirector;
	private String moviePoster;
}
