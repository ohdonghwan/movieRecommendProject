package muin.mvc.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import muin.mvc.model.dto.AuthorityDTO;


@Repository
public class AuthoritiesDAOImpl implements AuthoritiesDAO{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int insertAuthority(AuthorityDTO authority) {
		return sqlSession.insert("authoritiesMapper.insertAuthority", authority);
	}

	@Override
	public List<AuthorityDTO> selectAuthorityByUserName(String username) {
		return sqlSession.selectList("authoritiesMapper.selectAuthorityByUserName", username);
	}

}
