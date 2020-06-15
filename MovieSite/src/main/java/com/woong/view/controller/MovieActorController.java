package com.woong.view.controller;

import java.text.DecimalFormat;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.woong.biz.actor.ActorService;
import com.woong.biz.actor.ActorVO;
import com.woong.biz.actor.MyActorVO;
import com.woong.biz.movie.MovieService;
import com.woong.biz.movie.MovieVO;
import com.woong.biz.movie.MyMovieVO;
import com.woong.biz.movie.VodVO;
import com.woong.biz.user.UserVO;

@Controller
public class MovieActorController {

	@Autowired
	private MovieService ms;

	@Autowired
	private ActorService as;
	
	@RequestMapping("movie_list_genre")
	public String movieListByGenre(@RequestParam("genre") String genre, Model model) {

		List<MovieVO> movieList = ms.listMovieByGenre(genre);
		
		model.addAttribute("movieList", movieList);
		model.addAttribute("title","["+genre+"] 장르별 영화");
		model.addAttribute("genre", genre);
		return "movie/movie_list_genre";
	}
	
	@RequestMapping("movie_detail")
	public String movieDetailView(HttpSession session, Model model, MovieVO mVo) {
		MovieVO vo = ms.getMovie(mVo);

		UserVO user = (UserVO) session.getAttribute("loginUser");

		List<ActorVO> actorList = as.listActorByMovie(mVo.getMseq());
		String year = vo.getRelease().substring(0, 4);
		String month = vo.getRelease().substring(4, 6);
		String day = vo.getRelease().substring(6, 8);
		vo.setRelease(year+"년 "+month+"월 "+day+"일");
		
		DecimalFormat priceFormat = new DecimalFormat("###,###");
		String price = (priceFormat.format(Integer.parseInt((vo.getPrice()))));
		
		vo.setPrice(price);
		model.addAttribute("movie", vo);
		model.addAttribute("actorList", actorList);
		model.addAttribute("title", "영화 상세 정보 [" + vo.getTitle() + "]");

		return "movie/movie_detail";
	}
	

	@RequestMapping("actor_detail")
	public String actorDetailView(Model model, ActorVO aVo) {
		ActorVO vo = as.getActor(aVo);

		List<MovieVO> movieList = ms.listMovieByActor(aVo.getAseq());
		for(MovieVO movie: movieList) {
			String year = movie.getRelease().substring(0, 4);
			String month = movie.getRelease().substring(4, 6);
			String day = movie.getRelease().substring(6, 8);
			movie.setRelease(year+"년 "+month+"월 "+day+"일");
		}
		model.addAttribute("actor", vo);
		model.addAttribute("movieList", movieList);
		model.addAttribute("title", "배우 상세 정보 [" + vo.getName() + "]");

		return "actor/actor_detail";
	}

	@RequestMapping("add_myactor")
	public String addMyActor(HttpSession session, ActorVO aVo) {
		UserVO user = (UserVO) session.getAttribute("loginUser");
		int aseq = aVo.getAseq();

		if (user != null) {

			MyActorVO vo = new MyActorVO();

			vo.setId(user.getId());
			vo.setAseq(aseq);
			if (as.getMyActor(vo) != 0) {
				return "user/mylist_fail";
			} else {
				as.addMyActor(vo);
				return "user/mylist_success";
			}

		} else {
			return "user/login_fail";
		}
	}

	@RequestMapping("add_mymovie")
	public String addMyMovie(HttpSession session, MovieVO mVo) {
		UserVO user = (UserVO) session.getAttribute("loginUser");
		int mseq = mVo.getMseq();
		
		if (user != null) {

			MyMovieVO vo = new MyMovieVO();

			vo.setId(user.getId());
			vo.setMseq(mseq);
			if (ms.getMyMovie(vo) != 0) {
				return "user/mylist_fail";
			} else {
				ms.addMyMovie(vo);
				return "user/mylist_success";
			}

		} else {
			return "user/login_fail";
		}
	}
	
	@RequestMapping("buy_vod")
	public String buyVod(HttpSession session, MovieVO mVo) {
		UserVO user = (UserVO) session.getAttribute("loginUser");
			int mseq = mVo.getMseq();
			
		if (user != null) {

			VodVO vo = new VodVO();
			MovieVO movie = ms.getMovie(mVo);
			
			vo.setId(user.getId());
			vo.setMseq(mseq);
			vo.setPrice(movie.getPrice());
			vo.setTitle(movie.getTitle());
			System.out.println(vo);
			if (ms.getVOD(vo) != null) {
				return "user/buyvod_fail";
			} else {
				ms.insertVOD(vo);
				return "user/buyvod_success";
			}

		} else {
			return "user/login_fail";
		}
	}
	
	@RequestMapping("cancel_vod")
	public String cancelVod(HttpSession session, VodVO vVo) {
		UserVO user = (UserVO) session.getAttribute("loginUser");
		if (user != null) {
			ms.deleteVOD(vVo);
			
			return "user_mypage";
		} else {
			return "user/login_fail";
		}
	}
}

