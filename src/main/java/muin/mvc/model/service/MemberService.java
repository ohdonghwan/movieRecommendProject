package muin.mvc.model.service;

import java.util.List;


import muin.mvc.model.dto.AuthorityDTO;
import muin.mvc.model.dto.MemberDTO;

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
	
	MemberDTO mypage(Long memberId);
}
