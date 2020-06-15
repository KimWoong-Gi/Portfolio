package com.woong.biz.user;

import lombok.Data;

@Data
public class UserVO {
	private String id;
	private String pwd;
	private String name;
	private String nickname;
	private String email;
	private String phone;
	private String admin;
}
