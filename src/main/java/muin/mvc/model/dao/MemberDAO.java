package muin.mvc.model.dao;

import java.util.List;

import org.springframework.web.servlet.ModelAndView;

import muin.mvc.model.dto.MemberDTO;
import muin.mvc.model.dto.WishListDTO;

public interface MemberDAO {

	MemberDTO findMemberById(String id);

	List<String> getAddressList();

	List<MemberDTO> findMemberListByAddress(String address);

	MemberDTO login(MemberDTO memberVO);

	int getMemberCount();

	void updateMember(MemberDTO vo);

	void registerMember(MemberDTO vo);

	int idcheck(String id);
	
	List<MemberDTO> memberList();
	
	boolean confirmPwd(String memberEmail ,String memberPwd);
	
	int withdrawal(MemberDTO member) throws Exception;
	
	public int insertWishList(Long memberId, Long movieNo);
	
	public WishListDTO checkWishList(Long memberId, Long movieNo);
	
	public List<WishListDTO> myWishList(Long memberId);

}