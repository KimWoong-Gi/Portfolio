package com.woong.biz.board.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.woong.biz.board.BoardService;
import com.woong.biz.board.BoardVO;
import com.woong.biz.utils.Criteria;

@Service("boardService")
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	private BoardDAO bDao;
	
	@Override
	public BoardVO getBoard(int bseq) {
		
		return bDao.getBoard(bseq);
	}

	@Override
	public void insertBoard(BoardVO bVo) {
		
		bDao.insertBoard(bVo);
	}

	@Override
	public void updateBoard(BoardVO bVo) {
		
		bDao.updateBoard(bVo);
	}

	@Override
	public void deleteBoard(BoardVO bVo) {
		
		bDao.deleteBoard(bVo);
	}

	@Override
	public List<BoardVO> listBoardWithPaging(String title, String category, Criteria criteria) {
		
		return bDao.listBoardWithPaging(title, category, criteria);
	}

	@Override
	public int countBoardList(String title, String category) {
		
		return bDao.countBoardList(title, category);
	}

}
