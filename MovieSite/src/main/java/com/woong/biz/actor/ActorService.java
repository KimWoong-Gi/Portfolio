package com.woong.biz.actor;

import java.util.List;

public interface ActorService {

	List<ActorVO> listActor(String key);

	List<ActorVO> listActorByMovie(int mseq);
	
	List<ActorVO> listActorByName(String key);

	ActorVO getActor(ActorVO aVo);

	void insertActor(ActorVO aVo);

	void updateActor(ActorVO aVo);

	void deleteActor(ActorVO aVo);

	int getMyActor(MyActorVO aVo);
	
	void addMyActor(MyActorVO aVo);

	List<ActorVO> listMyActor(String id);
}