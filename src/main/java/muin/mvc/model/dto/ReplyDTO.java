package muin.mvc.model.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class ReplyDTO {
	private Long replyNo;
	private String replyContent;
	private String replyDate;
	private int movieNo;
	private Long memberId;
	private String memberName;
}