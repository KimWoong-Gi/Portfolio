package com.woong.biz.comment.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.woong.biz.comment.CommentService;
import com.woong.biz.comment.CommentVO;

@Service("commentService")
public class CommentServiceImpl implements CommentService {

	@Autowired
	private CommentDAO cDao;

	@Override
	public List<CommentVO> listBoardComment(int bseq) {

		return cDao.listBoardComment(bseq);
	}

	@Override
	public void insertBoardComment(CommentVO cVo) {

		cDao.insertBoardComment(cVo);
	}

	@Override
	public List<CommentVO> listMovieComment(int mseq) {

		return cDao.listMovieComment(mseq);
	}

	@Override
	public void insertMovieComment(CommentVO cVo) {

		cDao.insertMovieComment(cVo);
	}

	@Override
	public List<CommentVO> listActorComment(int aseq) {

		return cDao.listActorComment(aseq);
	}

	@Override
	public void insertActorComment(CommentVO cVo) {

		cDao.insertActorComment(cVo);
	}

}
