package com.woong.biz.movie;

import java.util.List;

public interface MovieService {

	List<MovieVO> listMovie(String key);

	List<MovieVO> listMovieByDirector(String director);

	List<MovieVO> listMovieByActor(int aseq);
	
	List<MovieVO> listMovieByTitle(String key);
	
	List<MovieVO> listMovieByGenre(String genre);

	MovieVO getMovie(MovieVO mVo);

	void insertMovie(MovieVO mVo);

	void updateMovie(MovieVO mVo);

	void deleteMovie(MovieVO mVo);

	int getMyMovie(MyMovieVO vo);

	void addMyMovie(MyMovieVO vo);

	List<MovieVO> listMyMovie(String id);
	
	List<VodVO> listVOD(String id);
	
	VodVO getVOD(VodVO vVo);

	void insertVOD(VodVO vVo);

	void updateVOD(VodVO vVo);

	void deleteVOD(VodVO vVo);


}