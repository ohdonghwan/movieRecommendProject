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
	public int insertWishList(Long memberId, Long movieNo); 
	
	public WishListDTO checkWishList(Long memberId, Long movieNo);
	
	//마이페이지 찜목록
	public List<WishListDTO> myWishList(Long memberId);
	
	//멤버 목록
	public List<MemberDTO> listAll(String searchOption, String keyword) throws Exception;
	
	//멤버 수 카운트
	public int countMember(String serchOption, String keyword) throws Exception;
	

}
