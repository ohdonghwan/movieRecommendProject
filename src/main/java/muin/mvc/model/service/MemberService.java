package muin.mvc.model.service;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;

import muin.mvc.model.dto.AuthorityDTO;
import muin.mvc.model.dto.MemberDTO;
import muin.mvc.model.dto.WishListDTO;

public interface MemberService {
	MemberDTO findMemberById(String id);

	List<String> getAddressList();

	List<MemberDTO> findMemberListByAddress(String address);

	MemberDTO login(MemberDTO memberVO);

	int getMemberCount();

	void updateMember(MemberDTO vo);

	void registerMember(MemberDTO vo);

	String idcheck(String id);
	
	List<AuthorityDTO> selectAuthorityByUsername(String username);
	
	List<MemberDTO> memberList();
	
	boolean confirmPwd(String memberEmail, String memberPwd);
	
	boolean withdrawal(MemberDTO member) throws Exception;
	
	//찜하기 버튼 눌렀을 때 DB에 삽입
	public int insertWishList(Long memberId, int movieNo); 
	
	//중복체크 하려고 넣었는데 쓰지 않아도 됨
	public List<WishListDTO> checkWishList(Long memberId, int movieNo);
	
	//마이페이지 찜목록
	public List<WishListDTO> myWishList(Long memberId);

}
