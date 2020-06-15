package com.woong.biz.input.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.woong.biz.input.InputVO;

@Repository
public class InputDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;

	public InputVO getInput(InputVO iVo) {
		return mybatis.selectOne("InputDAO.getInput", iVo);
	}

	public void insertInput(InputVO iVo) {
		mybatis.insert("InputDAO.insertInput", iVo);
	}
}
