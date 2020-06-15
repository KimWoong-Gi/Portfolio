package com.woong.biz.movie.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.woong.biz.movie.MovieService;
import com.woong.biz.movie.MovieVO;
import com.woong.biz.movie.MyMovieVO;
import com.woong.biz.movie.VodVO;

@Service("movieService")
public class MovieServiceImpl implements MovieService {

	@Autowired
	private MovieDAO mDao;

	@Override
	public List<MovieVO> listMovie(String key) {

		return mDao.listMovie(key);
	}

	@Override
	public List<MovieVO> listMovieByDirector(String director) {

		return mDao.listMovieByDirector(director);
	}

	@Override
	public List<MovieVO> listMovieByActor(int aseq) {

		return mDao.listMovieByActor(aseq);
	}
	
	@Override
	public List<MovieVO> listMovieByTitle(String key) {

		return mDao.listMovieByTitle(key);
	}
	
	@Override
	public List<MovieVO> listMovieByGenre(String genre) {

		return mDao.listMovieByGenre(genre);
	}

	@Override
	public MovieVO getMovie(MovieVO mVo) {

		return mDao.getMovie(mVo);
	}

	@Override
	public void insertMovie(MovieVO mVo) {

		mDao.insertMovie(mVo);
	}

	@Override
	public void updateMovie(MovieVO mVo) {

		mDao.updateMovie(mVo);
	}

	@Override
	public void deleteMovie(MovieVO mVo) {

		mDao.deleteMovie(mVo);
	}

	@Override
	public int getMyMovie(MyMovieVO vo) {

		return mDao.getMyMovie(vo);
	}

	@Override
	public void addMyMovie(MyMovieVO vo) {

		mDao.addMyMovie(vo);
	}

	@Override
	public List<MovieVO> listMyMovie(String id) {

		return mDao.listMyMovie(id);
	}

	@Override
	public List<VodVO> listVOD(String id) {
		
		return mDao.listVOD(id);
	}
	
	@Override
	public VodVO getVOD(VodVO vVo) {
		
		return mDao.getVOD(vVo);
	}

	@Override
	public void insertVOD(VodVO vVo) {
		
		mDao.insertVOD(vVo);
	}

	@Override
	public void updateVOD(VodVO vVo) {
		
		mDao.updateVOD(vVo);
	}

	@Override
	public void deleteVOD(VodVO vVo) {
		
		mDao.deleteVOD(vVo);
	}

}
