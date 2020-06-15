package com.woong.biz.board;

import java.util.List;

import com.woong.biz.utils.Criteria;

public interface BoardService {

	BoardVO getBoard(int bseq);

	void insertBoard(BoardVO bVo);

	void updateBoard(BoardVO bVo);

	void deleteBoard(BoardVO bVo);
	
	List<BoardVO> listBoardWithPaging(String title, String category, Criteria criteria);

	int countBoardList(String title, String category);
}