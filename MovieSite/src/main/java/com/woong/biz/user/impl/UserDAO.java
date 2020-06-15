package com.woong.biz.user.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.woong.biz.user.UserVO;

@Repository
public class UserDAO {

	@Autowired
	private SqlSessionTemplate mybatis;

	public UserVO getUserById(String id) {

		return mybatis.selectOne("UserDAO.getUserById", id);
	}

	public UserVO getUserByNickname(String nickname) {

		return mybatis.selectOne("UserDAO.getUserByNickname", nickname);
	}
	
	public String getIdByNameAndEmail(UserVO uVo) {
		
		return mybatis.selectOne("UserDAO.getIdByNameAndEmail", uVo);
	}
	
	public String getPwdByIdAndNameAndEmail(UserVO uVo) {
		
		return mybatis.selectOne("UserDAO.getPwdByIdAndNameAndEmail", uVo);
	}

	public void insertUser(UserVO uVo) {

		mybatis.insert("UserDAO.insertUser", uVo);
	}

	public void updateUser(UserVO uVo) {

		mybatis.update("UserDAO.updateUser", uVo);
	}

	public void deleteUser(String id) {

		mybatis.delete("UserDAO.deleteUser", id);
	}

}
