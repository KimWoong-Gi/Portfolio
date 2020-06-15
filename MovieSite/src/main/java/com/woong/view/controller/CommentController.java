package com.woong.view.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.woong.biz.comment.CommentService;
import com.woong.biz.comment.CommentVO;
import com.woong.biz.user.UserVO;

@RestController
public class CommentController {

	@Autowired
	private CommentService cs;

	@RequestMapping(value="board_comment_list", method=RequestMethod.GET)
	public List<CommentVO> boardCommentList(CommentVO cVo) {
		
		int bseq = cVo.getBseq();
		
		List<CommentVO> commentList = cs.listBoardComment(bseq);
		
		return commentList;
	}

	@RequestMapping(value="board_comment_insert", method=RequestMethod.POST)
	@ResponseBody
	public String boardCommentInsert(CommentVO cVo, HttpSession session) {
		UserVO loginUser = (UserVO) session.getAttribute("loginUser");
		if (loginUser != null) {
			String nickname = loginUser.getNickname();
			cVo.setNickname(nickname);
			cs.insertBoardComment(cVo);
			
			return ("success");
		} else {
			return ("fail");
		}

	}
	
	@RequestMapping(value="movie_comment_list", method=RequestMethod.GET)
	public List<CommentVO> movieCommentList(CommentVO cVo) {
		
		int mseq = cVo.getMseq();
		
		List<CommentVO> commentList = cs.listMovieComment(mseq);
		
		return commentList;
	}

	@RequestMapping(value="movie_comment_insert", method=RequestMethod.POST)
	@ResponseBody
	public String movieCommentInsert(CommentVO cVo, HttpSession session) {
		UserVO loginUser = (UserVO) session.getAttribute("loginUser");
		if (loginUser != null) {
			String nickname = loginUser.getNickname();
			cVo.setNickname(nickname);
			cs.insertMovieComment(cVo);
			
			return ("success");
		} else {
			return ("fail");
		}

	}
	
	@RequestMapping(value="actor_comment_list", method=RequestMethod.GET)
	public List<CommentVO> actorCommentList(CommentVO cVo) {
		
		int aseq = cVo.getAseq();
		
		List<CommentVO> commentList = cs.listActorComment(aseq);
		
		return commentList;
	}

	@RequestMapping(value="actor_comment_insert", method=RequestMethod.POST)
	@ResponseBody
	public String actorCommentInsert(CommentVO cVo, HttpSession session) {
		UserVO loginUser = (UserVO) session.getAttribute("loginUser");
		if (loginUser != null) {
			String nickname = loginUser.getNickname();
			cVo.setNickname(nickname);
			cs.insertMovieComment(cVo);
			
			return ("success");
		} else {
			return ("fail");
		}

	}


}
