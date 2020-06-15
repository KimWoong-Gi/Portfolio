package com.woong.biz.input.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.woong.biz.input.InputService;
import com.woong.biz.input.InputVO;

@Service("inputService")
public class InputServiceImpl implements InputService {
	
	@Autowired
	private InputDAO iDao;
	
	@Override
	public InputVO getInput(InputVO iVo) {
		
		return iDao.getInput(iVo);
	}

	@Override
	public void insertInput(InputVO iVo) {
		
		iDao.insertInput(iVo);
	}

}
