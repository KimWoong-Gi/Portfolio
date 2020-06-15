package com.woong.biz.comment.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.woong.biz.comment.CommentVO;

@Repository
public class CommentDAO {

	@Autowired
	private SqlSessionTemplate mybatis;

	public List<CommentVO> listBoardComment(int bseq) {

		return mybatis.selectList("CommentDAO.listBoardComment", bseq);
	}

	public void insertBoardComment(CommentVO cVo) {

		mybatis.insert("CommentDAO.insertBoardComment", cVo);
	}

	public List<CommentVO> listMovieComment(int mseq) {

		return mybatis.selectList("CommentDAO.listMovieComment", mseq);
	}

	public void insertMovieComment(CommentVO cVo) {

		mybatis.insert("CommentDAO.insertMovieComment", cVo);
	}

	public List<CommentVO> listActorComment(int aseq) {

		return mybatis.selectList("CommentDAO.listActorComment", aseq);
	}

	public void insertActorComment(CommentVO cVo) {

		mybatis.insert("CommentDAO.insertActorComment", cVo);
	}

}
