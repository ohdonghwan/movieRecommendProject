package muin.mvc.model.dao;
/*
 * insertAuthority
 * selectAuthorityByUserName
 */

import java.util.List;

import muin.mvc.model.dto.AuthorityDTO;

public interface AuthoritiesDAO {
	int insertAuthority(AuthorityDTO authority);
	List<AuthorityDTO> selectAuthorityByUserName(String username);
}
