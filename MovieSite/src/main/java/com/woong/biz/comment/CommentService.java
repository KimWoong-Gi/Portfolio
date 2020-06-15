package com.woong.biz.comment;

import java.util.List;

public interface CommentService {
	
	List<CommentVO> listBoardComment(int bseq);

	void insertBoardComment(CommentVO cVo);

	List<CommentVO> listMovieComment(int mseq);

	void insertMovieComment(CommentVO cVo);

	List<CommentVO> listActorComment(int aseq);

	void insertActorComment(CommentVO cVo);


}