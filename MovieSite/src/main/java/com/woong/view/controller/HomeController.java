package com.woong.view.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.woong.biz.actor.ActorService;
import com.woong.biz.actor.ActorVO;
import com.woong.biz.movie.MovieService;
import com.woong.biz.movie.MovieVO;

@Controller
public class HomeController {

	@Autowired
	private MovieService ms;

	@Autowired
	private ActorService as;

	@RequestMapping("index")
	public String home(Model model) {
		model.addAttribute("title", "Home");
		return "main/index";
	}

	@RequestMapping("search")
	public String search(@RequestParam(value = "key", defaultValue = "") String key, Model model) {

		List<MovieVO> movieList = ms.listMovie(key);
		List<MovieVO> movieList_director = ms.listMovieByDirector(key);
		List<ActorVO> actorList = as.listActor(key);
		
		model.addAttribute("movieList", movieList);
		model.addAttribute("movieList_director", movieList_director);
		model.addAttribute("actorList", actorList);
		model.addAttribute("title","["+key+"] 검색 결과");
		model.addAttribute("key", key);
		return "main/search";
	}

}
