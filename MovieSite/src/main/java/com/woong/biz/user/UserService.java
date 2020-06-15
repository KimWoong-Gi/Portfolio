package com.woong.biz.user;

public interface UserService {

	UserVO getUserById(String id);

	UserVO getUserByNickname(String nickname);
	
	String getIdByNameAndEmail(UserVO uVo);
	
	String getPwdByIdAndNameAndEmail(UserVO uVo);

	void insertUser(UserVO uVo);

	void updateUser(UserVO uVo);

	void deleteUser(String id);

}