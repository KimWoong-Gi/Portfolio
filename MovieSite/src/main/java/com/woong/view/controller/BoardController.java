package com.woong.view.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.woong.biz.board.BoardService;
import com.woong.biz.board.BoardVO;
import com.woong.biz.comment.CommentService;
import com.woong.biz.movie.MovieVO;
import com.woong.biz.user.UserService;
import com.woong.biz.user.UserVO;
import com.woong.biz.utils.Criteria;
import com.woong.biz.utils.PageMaker;

@Controller
public class BoardController {

	@Autowired
	private BoardService bs;

	@Autowired
	private CommentService cs;
	
	@Autowired
	private UserService us;
	
	@RequestMapping("board_list")
	public String boardList(Model model, Criteria criteria, String category,
							@RequestParam(value = "key", defaultValue = "")String title) {
		List<BoardVO> boardList;
		
		boardList = bs.listBoardWithPaging(title, category, criteria);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(criteria);
		
		int totalCount = bs.countBoardList(title, category);
		pageMaker.setTotalCount(totalCount);
		
		if(category.equals("a")) {
			model.addAttribute("title", "공지사항");
		}else if(category.equals("b")) {
			model.addAttribute("title", "이벤트");
		}else if(category.equals("c")) {
			model.addAttribute("title", "영화게시판");
		}else {
			model.addAttribute("title", "건의사항");
		}
		
		model.addAttribute("criteria", criteria);
		model.addAttribute("category", category);
		model.addAttribute("boardList", boardList);
		model.addAttribute("pageMaker", pageMaker);
		
		return "board/board_list";
	}
	
	@RequestMapping("board_detail")
	public String boardDetail(Model model, BoardVO bVo) {

		BoardVO vo = bs.getBoard(bVo.getBseq());

		model.addAttribute("board", vo);
		model.addAttribute("title", "게시글 상세보기 [" + vo.getTitle() + "]");

		return "board/board_detail";
	}

	@RequestMapping("board_write_form")
	public String boardWriteView(HttpSession session, Model model) {
		UserVO user = (UserVO) session.getAttribute("loginUser");

		if (user != null) {
			model.addAttribute("title", "게시글 작성");
			return "board/board_write";
		} else {
			
			return "user/login";
		}
	}

	@RequestMapping(value="board_write", method=RequestMethod.POST)
	public String boardWrite(HttpSession session, BoardVO bVo, @RequestParam(value = "image1", required = false) MultipartFile file) throws IOException {
		if (!file.isEmpty()) {
			String fileName = file.getOriginalFilename();
			String root_path = session.getServletContext().getRealPath("WEB-INF/resources/images/board_images/");
			file.transferTo(new File(root_path + fileName));
			bVo.setImage(fileName);
		}else {
			bVo.setImage("default.jpg");
		}
		
		bs.insertBoard(bVo);
		
		return "redirect: board_list?category="+bVo.getCategory();
	}

	@RequestMapping("board_update_form")
	public String boardUpdateView(Model model, BoardVO bVo) {
		BoardVO vo = bs.getBoard(bVo.getBseq());
		
		model.addAttribute("board", vo);
		model.addAttribute("title", "게시글 수정");
		
		return "board/board_update";
	}

	@RequestMapping(value="board_update", method=RequestMethod.POST)
	public String boardUpdate(BoardVO bVo, @RequestParam(value = "image1", required = false) MultipartFile uploadFile, HttpSession session) throws IOException  {
		String fileName = "";
		
		if (!uploadFile.isEmpty()) { // 상품이미지가 업로드됨
			String root_path = session.getServletContext().getRealPath("WEB-INF/resources/images/board_images/");
			System.out.println("Root 경로 = " + root_path);

			// 업로드된 파일명을 얻어온다.
			fileName = uploadFile.getOriginalFilename();

			try {
				File file = new File(root_path + fileName);
				uploadFile.transferTo(file);
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			bVo.setImage(fileName);

		}
		bs.updateBoard(bVo);

		return "redirect: board_detail?bseq=" + bVo.getBseq();
	}

	@RequestMapping("board_delete")
	public String boardDelete(BoardVO bVo) {
		
		bs.deleteBoard(bVo);
		
		return "redirect: board_list?category="+bVo.getCategory();
	}

}
