package muin.mvc.model.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class ReportReplyDTO {
	private Long memberId;
	private Long replyNo;
	private int count;
}
