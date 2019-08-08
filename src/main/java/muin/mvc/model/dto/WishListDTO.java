package muin.mvc.model.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class WishListDTO {
	private int wishNo;              //찜리스트 번호
	private String wishMovie;        //영화제목
	private String wishDirector;	 //감독
	private String wishActor;		 //배우
	private String wishGenre;		 //장르
}
