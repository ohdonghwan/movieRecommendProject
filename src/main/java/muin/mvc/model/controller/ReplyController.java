package muin.mvc.model.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import muin.mvc.model.dto.ReplyDTO;
import muin.mvc.model.service.ReplyService;

@Controller
public class ReplyController {
	
	@Autowired
	private ReplyService replyService;
	
	//실험용 index에서 TEST누르면 화면 옮겨주기 위함.
	@RequestMapping("/reply/replyPage")
	public String replyPage() {
		return "detail/movieDetail2";
	}
	
	//movie넘버에 해당하는 영화 상세보기 시, movie넘버를 parameter로 갖고 들어가서 select한다.
	//ajax처리해서 insert할때마다 select 뿌려준다.
	@RequestMapping("/reply/selectReply")
	@ResponseBody
	public List<ReplyDTO> selectReply(int movieNo){		
		return replyService.selectReply(movieNo);
	}
	
	//댓글 입력 컨트롤러
	@RequestMapping("reply/insertReply")
	@ResponseBody
	public int insertReply(ReplyDTO replyDTO) {
		replyService.insertReply(replyDTO);
		return 0;
	}
	
	//리플 공감
	@RequestMapping("reply/replyUp")
	@ResponseBody
	public int replyUp(Long replyNo) {
		replyService.replyUp(replyNo);
		return 0;
	}
	
	//리플 비공감
	@RequestMapping("reply/replyDown")
	@ResponseBody
	public int replyDown(Long replyNo) {
		replyService.replyDown(replyNo);
		return 0;
	}
}
