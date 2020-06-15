package com.woong.biz.actor.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.woong.biz.actor.ActorService;
import com.woong.biz.actor.ActorVO;
import com.woong.biz.actor.MyActorVO;

@Service("actorService")
public class ActorServiceImpl implements ActorService {

	@Autowired
	private ActorDAO aDao;

	@Override
	public List<ActorVO> listActor(String key) {

		return aDao.listActor(key);
	}

	@Override
	public List<ActorVO> listActorByMovie(int mseq) {

		return aDao.listActorByMovie(mseq);
	}
	
	@Override
	public List<ActorVO> listActorByName(String key) {

		return aDao.listActorByName(key);
	}

	@Override
	public ActorVO getActor(ActorVO aVo) {

		return aDao.getActor(aVo);
	}

	@Override
	public void insertActor(ActorVO aVo) {

		aDao.insertActor(aVo);
	}

	@Override
	public void updateActor(ActorVO aVo) {

		aDao.updateActor(aVo);
	}

	@Override
	public void deleteActor(ActorVO aVo) {

		aDao.deleteActor(aVo);
	}
	
	@Override
	public int getMyActor(MyActorVO vo) {

		return aDao.getMyActor(vo);
	}
	
	@Override
	public void addMyActor(MyActorVO vo) {

		aDao.addMyActor(vo);
	}

	@Override
	public List<ActorVO> listMyActor(String id) {

		return aDao.listMyActor(id);
	}

}
