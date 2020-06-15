package com.woong.biz.board.impl;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.woong.biz.board.BoardVO;
import com.woong.biz.utils.Criteria;

@Repository
public class BoardDAO {

	@Autowired
	private SqlSessionTemplate mybatis;

	public List<BoardVO> listBoardWithPaging(String title, String category, Criteria criteria) {
		HashMap<String, Object> map = new HashMap<String, Object>();

		map.put("title", title);
		map.put("category", category);
		map.put("criteria", criteria);

		return mybatis.selectList("BoardDAO.listBoardWithPaging", map);
	}

	public int countBoardList(String title, String category) {
		HashMap<String, String> map = new HashMap<String, String>();

		map.put("title", title);
		map.put("category", category);

		return mybatis.selectOne("BoardDAO.countBoardList", map);
	}

	public BoardVO getBoard(int bseq) {

		return mybatis.selectOne("BoardDAO.getBoard", bseq);
	}

	public void insertBoard(BoardVO bVo) {

		mybatis.insert("BoardDAO.insertBoard", bVo);
	}

	public void updateBoard(BoardVO bVo) {

		mybatis.update("BoardDAO.updateBoard", bVo);
	}

	public void deleteBoard(BoardVO bVo) {

		mybatis.delete("BoardDAO.deleteBoard", bVo);
	}
}
