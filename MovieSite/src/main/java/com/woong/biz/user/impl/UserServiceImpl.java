package com.woong.biz.user.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.woong.biz.user.UserVO;
import com.woong.biz.user.UserService;

@Service("userService")
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDAO uDao;

	@Override
	public UserVO getUserById(String id) {

		return uDao.getUserById(id);
	}

	@Override
	public UserVO getUserByNickname(String nickname) {

		return uDao.getUserByNickname(nickname);
	}

	@Override
	public void insertUser(UserVO uVo) {

		uDao.insertUser(uVo);
	}

	@Override
	public void updateUser(UserVO uVo) {

		uDao.updateUser(uVo);
	}

	@Override
	public void deleteUser(String id) {

		uDao.deleteUser(id);
	}

	@Override
	public String getIdByNameAndEmail(UserVO uVo) {
		
		return uDao.getIdByNameAndEmail(uVo);
	}

	@Override
	public String getPwdByIdAndNameAndEmail(UserVO uVo) {
		
		return uDao.getPwdByIdAndNameAndEmail(uVo);
	}

	@Override
	public List<UserVO> listUser() {
		
		return uDao.listUser();
	}

}
