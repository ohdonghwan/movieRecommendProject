package muin.mvc.model.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class RecommendDTO {
	private int recommendNo;
	private int memberId;
	private int movieNo;
	private int recommendGrade;
}
