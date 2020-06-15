package com.woong.biz.movie.impl;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.woong.biz.movie.MovieVO;
import com.woong.biz.movie.MyMovieVO;
import com.woong.biz.movie.VodVO;

@Repository
public class MovieDAO {

	@Autowired
	private SqlSessionTemplate mybatis;

	public List<MovieVO> listMovie(String key) {

		return mybatis.selectList("MovieDAO.listMovie", key);
	}

	public List<MovieVO> listMovieByDirector(String director) {

		return mybatis.selectList("MovieDAO.listMovieByDirector", director);
	}

	public List<MovieVO> listMovieByActor(int aseq) {

		return mybatis.selectList("MovieDAO.listMovieByActor", aseq);
	}
	
	public List<MovieVO> listMovieByTitle(String key) {

		return mybatis.selectList("MovieDAO.listMovieByTitle", key);
	}
	
	public List<MovieVO> listMovieByGenre(String genre) {

		return mybatis.selectList("MovieDAO.listMovieByGenre", genre);
	}

	public MovieVO getMovie(MovieVO mVo) {

		return mybatis.selectOne("MovieDAO.getMovie", mVo);
	}

	public void insertMovie(MovieVO mVo) {

		mybatis.insert("MovieDAO.insertMovie", mVo);
	}

	public void updateMovie(MovieVO mVo) {

		mybatis.update("MovieDAO.updateMovie", mVo);
	}

	public void deleteMovie(MovieVO mVo) {

		mybatis.delete("MovieDAO.deleteMovie", mVo);
	}

	public int getMyMovie(MyMovieVO vo) {

		return mybatis.selectOne("MovieDAO.getMyMovie", vo);
	}

	public void addMyMovie(MyMovieVO vo) {

		mybatis.insert("MovieDAO.addMyMovie", vo);
	}

	public List<MovieVO> listMyMovie(String id) {

		return mybatis.selectList("MovieDAO.listMyMovie", id);

	}
	
	public List<VodVO> listVOD(String id){
		
		return mybatis.selectList("MovieDAO.listVOD", id);
	}
	
	public VodVO getVOD(VodVO vVo) {
		
		return mybatis.selectOne("MovieDAO.getVOD", vVo);
	}
	
	public void insertVOD(VodVO vVo) {
		
		mybatis.insert("MovieDAO.insertVOD", vVo);
	}
	
	public void updateVOD(VodVO vVo) {
		
		mybatis.update("MovieDAO.updateVOD", vVo);
	}
	
	public void deleteVOD(VodVO vVo) {
		
		mybatis.delete("MovieDAO.deleteVOD", vVo);
	}
}
