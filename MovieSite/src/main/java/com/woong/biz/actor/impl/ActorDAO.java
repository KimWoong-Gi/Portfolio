package com.woong.biz.actor.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.woong.biz.actor.ActorVO;
import com.woong.biz.actor.MyActorVO;

@Repository
public class ActorDAO {

	@Autowired
	private SqlSessionTemplate mybatis;

	public List<ActorVO> listActor(String key) {

		return mybatis.selectList("ActorDAO.listActor", key);
	}

	public List<ActorVO> listActorByMovie(int mseq) {

		return mybatis.selectList("ActorDAO.listActorByMovie", mseq);
	}
	
	public List<ActorVO> listActorByName(String key) {

		return mybatis.selectList("ActorDAO.listActorByName", key);
	}

	public ActorVO getActor(ActorVO aVo) {

		return mybatis.selectOne("ActorDAO.getActor", aVo);
	}

	public void insertActor(ActorVO aVo) {

		mybatis.insert("ActorDAO.insertActor", aVo);
	}

	public void updateActor(ActorVO aVo) {

		mybatis.update("ActorDAO.updateActor", aVo);
	}

	public void deleteActor(ActorVO aVo) {

		mybatis.delete("ActorDAO.deleteActor", aVo);
	}
	
	public int getMyActor(MyActorVO aVo) {
		
		return mybatis.selectOne("ActorDAO.getMyActor", aVo);
	}

	public void addMyActor(MyActorVO vo) {

		mybatis.insert("ActorDAO.addMyActor", vo);
	}

	public List<ActorVO> listMyActor(String id) {

		return mybatis.selectList("ActorDAO.listMyActor", id);
	}
}
