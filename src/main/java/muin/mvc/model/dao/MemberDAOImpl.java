package muin.mvc.model.dao;

import java.util.List;


import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import muin.mvc.model.dto.MemberDTO;

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
	public MemberDTO mypage(Long memberId) {		
		return sqlSession.selectOne("memberMapper.findMemberById", memberId);
	}
	
}