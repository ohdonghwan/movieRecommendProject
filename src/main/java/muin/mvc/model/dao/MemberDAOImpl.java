package muin.mvc.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import muin.mvc.model.dto.MemberDTO;
import muin.mvc.model.dto.WishListDTO;

@Repository
public class MemberDAOImpl implements MemberDAO {
	@Resource	
	private SqlSessionTemplate sqlSession;
	
	@Override
	public MemberDTO findMemberById(String id){
		return sqlSession.selectOne("memberMapper.findMemberById",id);
	}
	@Override
	public List<String> getAddressList(){
		return sqlSession.selectList("memberMapper.getAddressList");
	}
	@Override
	public List<MemberDTO> findMemberListByAddress(String address){
		return sqlSession.selectList("memberMapper.findMemberListByAddress",address);
	}
	@Override
	public MemberDTO login(MemberDTO memberVO){
		return sqlSession.selectOne("memberMapper.login",memberVO);
	}
	@Override
	public int getMemberCount(){
		return sqlSession.selectOne("memberMapper.getMemberCount");
	}
	@Override
	public void updateMember(MemberDTO vo) {
		sqlSession.update("memberMapper.updateMember",vo);			
	}	
	@Override
	public void registerMember(MemberDTO vo) {
		sqlSession.insert("memberMapper.registerMember",vo);			
	}
	@Override
	public int idcheck(String id) {
		return sqlSession.selectOne("memberMapper.idcheck",id);				
	}
	@Override
	public List<MemberDTO> memberList() {
		return sqlSession.selectList("memberMapper.adminList");
	}
	
	@Override
	@Transactional
	public int withdrawal(MemberDTO member) throws Exception{
		return sqlSession.delete("memberMapper.memberDelete", member);
	}
	@Override
	public boolean confirmPwd(String memberEmail, String memberPwd) {
		boolean result = false;
		Map<String, String> map =  new HashMap<String,String>();
		map.put("memberEmail", memberEmail);
		map.put("memberPwd",memberPwd);
		
		int count = sqlSession.selectOne("memberMapper.confirmPwd",map);
		if(count == 1) {
			result = true;
		}
		return  result;
	}
	@Override
	public int insertWishList(Long memberId, int movieNo) {
		Map<String, Long> map = new HashMap<String, Long>();
		map.put("memberId", memberId);
		map.put("movieNo", (long) movieNo);		
		return sqlSession.insert("memberMapper.insertWishList", map);
	}
	@Override
	public List<WishListDTO> checkWishList(Long memberId, int movieNo) {
		Map<String, Long> map = new HashMap<String, Long>();
		map.put("memberId", memberId);
		map.put("movieNo", (long) movieNo);		
		return sqlSession.selectList("memberMapper.checkWishList", map);
	}
}