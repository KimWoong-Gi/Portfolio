package com.woong.view.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.woong.biz.actor.ActorService;
import com.woong.biz.actor.ActorVO;
import com.woong.biz.input.InputService;
import com.woong.biz.input.InputVO;
import com.woong.biz.movie.MovieService;
import com.woong.biz.movie.MovieVO;
import com.woong.biz.movie.VodVO;
import com.woong.biz.user.UserService;
import com.woong.biz.user.UserVO;

@Controller
public class AdminController {

	@Autowired
	private MovieService ms;

	@Autowired
	private ActorService as;

	@Autowired
	private InputService is;

	@Autowired
	private UserService us;

	@RequestMapping("admin_main")
	public String adminPageView(Model model) {
		model.addAttribute("title", "관리자 페이지");
		List<UserVO> userList = us.listUser();

		model.addAttribute("userList", userList);
		return "admin/main";
	}

	@RequestMapping("movie_insert_form")
	public String insertMovieView(Model model) {
		model.addAttribute("title", "영화 등록");
		String[] list = { "액션", "SF", "드라마", "멜로/로맨스", "코미디", "가족", "애니", "공포", "스릴러", "모험" };
		model.addAttribute("genreList", list);
		return "admin/movie_insert";
	}

	@RequestMapping(value = "movie_insert", method = RequestMethod.POST)
	public String insertMovie(@RequestParam(value = "image1", required = false) MultipartFile file, HttpSession session,
			MovieVO mVo) throws IOException {
		if (!file.isEmpty()) {
			String fileName = file.getOriginalFilename();
			String root_path = session.getServletContext().getRealPath("WEB-INF/resources/images/movie_images/");
			file.transferTo(new File(root_path + fileName));
			mVo.setImage(fileName);
		}
		String[] list = { "", "액션", "SF", "드라마", "멜로/로맨스", "코미디", "가족", "애니", "공포", "스릴러", "모험" };
		mVo.setGenre(list[Integer.parseInt(mVo.getGenre())]);

		String price = mVo.getPrice().replace(",", "");
		mVo.setPrice(price);

		String release = mVo.getRelease().replace("-", "");
		mVo.setRelease(release);

		ms.insertMovie(mVo);

		return "redirect: admin_main";
	}

	@RequestMapping("movie_update_form")
	public String updateMovieView(Model model, MovieVO mVo) {
		MovieVO movie = ms.getMovie(mVo);

		String year = movie.getRelease().substring(0, 4);
		String month = movie.getRelease().substring(4, 6);
		String day = movie.getRelease().substring(6, 8);
		movie.setRelease(year + "-" + month + "-" + day);
		model.addAttribute("movie", movie);
		model.addAttribute("title", "영화 수정");
		String[] list = { "액션", "SF", "드라마", "멜로/로맨스", "코미디", "가족", "애니", "공포", "스릴러", "모험" };
		model.addAttribute("genreList", list);
		return "admin/movie_update";
	}

	@RequestMapping(value = "movie_update", method = RequestMethod.POST)
	public String updateMovie(@RequestParam(value = "image1", required = false) MultipartFile uploadFile,
			HttpSession session, MovieVO mVo) throws IOException {
		String fileName = "";
		if (!uploadFile.isEmpty()) {
			String root_path = session.getServletContext().getRealPath("WEB-INF/resources/images/movie_images/");
			fileName = uploadFile.getOriginalFilename();
			try {
				uploadFile.transferTo(new File(root_path + fileName));
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}

			mVo.setImage(fileName);
		}
		String[] list = { "", "액션", "SF", "드라마", "멜로/로맨스", "코미디", "가족", "애니", "공포", "스릴러", "모험" };
		mVo.setGenre(list[Integer.parseInt(mVo.getGenre())]);

		String price = mVo.getPrice().replace(",", "");
		mVo.setPrice(price);

		String release = mVo.getRelease().replace("-", "");
		mVo.setRelease(release);

		ms.updateMovie(mVo);

		return "redirect: admin_main";
	}

	@RequestMapping("actor_insert_form")
	public String insertActorView(Model model) {
		model.addAttribute("title", "배우 등록");
		return "admin/actor_insert";
	}

	@RequestMapping(value = "actor_insert", method = RequestMethod.POST)
	public String insertActor(@RequestParam(value = "image1", required = false) MultipartFile file, HttpSession session,
			ActorVO aVo) throws IOException {
		if (!file.isEmpty()) {
			String fileName = file.getOriginalFilename();
			String root_path = session.getServletContext().getRealPath("WEB-INF/resources/images/actor_images/");
			file.transferTo(new File(root_path + fileName));
			aVo.setImage(fileName);
		}

		as.insertActor(aVo);

		return "redirect: admin_main";
	}

	@RequestMapping("actor_update_form")
	public String updateActorView(Model model, ActorVO aVo) {
		ActorVO actor = as.getActor(aVo);

		model.addAttribute("actor", actor);
		model.addAttribute("title", "배우 수정");
		return "admin/actor_update";
	}

	@RequestMapping(value = "actor_update", method = RequestMethod.POST)
	public String updateActor(@RequestParam(value = "image1", required = false) MultipartFile uploadFile,
			HttpSession session, ActorVO aVo) throws IOException {
		String fileName = "";
		if (!uploadFile.isEmpty()) {
			String root_path = session.getServletContext().getRealPath("WEB-INF/resources/images/actor_images/");
			fileName = uploadFile.getOriginalFilename();
			try {
				uploadFile.transferTo(new File(root_path + fileName));
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}

			aVo.setImage(fileName);
		}

		as.updateActor(aVo);

		return "redirect: admin_main";
	}

	@RequestMapping("search_movie")
	public String searchMovie(@RequestParam(value = "key", defaultValue = "", required = false) String key,
			Model model) {

		List<MovieVO> movieList = ms.listMovieByTitle(key);

		model.addAttribute("movieList", movieList);
		model.addAttribute("title", "[" + key + "] 검색 결과");
		model.addAttribute("key", key);
		return "admin/search_movie";
	}

	@RequestMapping("search_actor")
	public String searchActor(@RequestParam(value = "key", defaultValue = "", required = false) String key,
			Model model) {

		List<ActorVO> actorList = as.listActorByName(key);

		model.addAttribute("actorList", actorList);
		model.addAttribute("title", "[" + key + "] 검색 결과");
		model.addAttribute("key", key);
		return "admin/search_actor";
	}

	@RequestMapping("actor_input_form")
	public String actorInputForm(@RequestParam(value = "mseq", defaultValue = "", required = false) Integer mseq,
			@RequestParam(value = "aseq", defaultValue = "", required = false) Integer aseq,
			@RequestParam(value = "key", defaultValue = "/", required = false) String key, Model model,
			HttpSession session) throws IOException {

		List<ActorVO> searchList = as.listActorByName(key);
		model.addAttribute("searchList", searchList);

		MovieVO movieVo = new MovieVO();
		movieVo.setMseq(mseq);
		MovieVO mVo = ms.getMovie(movieVo);
		model.addAttribute("movie", mVo);
		model.addAttribute("check", "n");
		ActorVO actorVo = new ActorVO();

		if (aseq != null) {
			actorVo.setAseq(aseq);
			ActorVO aVo = as.getActor(actorVo);
			if (session.getAttribute("actorList") != null) {
				List<ActorVO> actorList = (List<ActorVO>) session.getAttribute("actorList");
				actorList.add(aVo);
				session.setAttribute("actorList", actorList);
				model.addAttribute("check", "y");
			} else {
				List<ActorVO> actorList = new ArrayList<ActorVO>();
				actorList.add(aVo);
				session.setAttribute("actorList", actorList);
				model.addAttribute("check", "y");
			}
		}

		return "admin/actor_input";
	}

	@RequestMapping("movie_input_form")
	public String movieInputForm(@RequestParam(value = "mseq", defaultValue = "", required = false) Integer mseq,
			@RequestParam(value = "aseq", defaultValue = "", required = false) Integer aseq,
			@RequestParam(value = "key", defaultValue = "/", required = false) String key, Model model,
			HttpSession session) throws IOException {

		List<MovieVO> searchList = ms.listMovieByTitle(key);
		model.addAttribute("searchList", searchList);

		ActorVO actorVo = new ActorVO();
		actorVo.setAseq(aseq);
		ActorVO aVo = as.getActor(actorVo);
		model.addAttribute("actor", aVo);
		model.addAttribute("check", "n");
		MovieVO movieVo = new MovieVO();

		if (mseq != null) {
			movieVo.setMseq(mseq);
			MovieVO mVo = ms.getMovie(movieVo);
			if (session.getAttribute("movieList") != null) {
				List<MovieVO> movieList = (List<MovieVO>) session.getAttribute("movieList");
				movieList.add(mVo);
				session.setAttribute("movieList", movieList);
				model.addAttribute("check", "y");
			} else {
				List<MovieVO> movieList = new ArrayList<MovieVO>();
				movieList.add(mVo);
				session.setAttribute("movieList", movieList);
				model.addAttribute("check", "y");
			}
		}
		return "admin/movie_input";
	}

	// 영화에 배우 목록 연결
	@RequestMapping("actor_input")
	public String actorInput(@RequestParam("result") int[] aseqList, @RequestParam("mseq") int mseq) {

		if (aseqList.length <= 1) {
			InputVO iVo = new InputVO();
			iVo.setAseq(aseqList[0]);
			iVo.setMseq(mseq);
			if (is.getInput(iVo) == null) {
				is.insertInput(iVo);
			}
		} else {
			for (int aseq : aseqList) {
				InputVO iVo = new InputVO();
				iVo.setMseq(mseq);
				iVo.setAseq(aseq);
				if (is.getInput(iVo) == null) {
					is.insertInput(iVo);
				}
			}
		}
		return "admin/success_input";
	}

	// 배우에 영화 목록 연결
	@RequestMapping("movie_input")
	public String movieInput(@RequestParam("result") int[] mseqList, @RequestParam("aseq") int aseq) {
		System.out.println(mseqList);
		if (mseqList.length <= 1) {
			InputVO iVo = new InputVO();
			iVo.setMseq(mseqList[0]);
			iVo.setAseq(aseq);
			if (is.getInput(iVo) == null) {
				is.insertInput(iVo);
			}
		} else {
			for (int mseq : mseqList) {
				InputVO iVo = new InputVO();
				iVo.setMseq(mseq);
				iVo.setAseq(aseq);
				if (is.getInput(iVo) == null) {
					is.insertInput(iVo);
				}
			}
		}
		return "admin/success_input";
	}

	@RequestMapping("actor_input_cancel")
	public String actorInputCancel(HttpSession session, Model model) {
		session.removeAttribute("actorList");

		return "redirect:search_movie?key=''";
	}

	@RequestMapping("movie_input_cancel")
	public String movieInputCancel(HttpSession session, Model model) {
		session.removeAttribute("movieList");

		return "redirect:search_actor?key=''";
	}

	@RequestMapping("actor_delete")
	public String actorDelete(ActorVO aVo) {
		as.deleteActor(aVo);

		return "redirect:search_actor?key=''";
	}

	@RequestMapping("movie_delete")
	public String movieDelete(MovieVO mVo) {
		ms.deleteMovie(mVo);

		return "redirect:search_movie?key=''";
	}
	
	@RequestMapping("user_detail")
	public String userDetail(Model model, UserVO uVo) {
		UserVO user = us.getUserById(uVo.getId());
		
		model.addAttribute("user", user);
		model.addAttribute("title", "회원 정보 수정 : ["+uVo.getId()+"]");
		
		return "admin/user_detail";
	}
	
	@RequestMapping("admin_user_update")
	public String adminUserUpdate(UserVO uVo) {
		us.updateUser(uVo);
		
		return "redirect: admin_main";
	}

	@RequestMapping("user_delete_admin")
	public String userDeleteAdmin(UserVO uVo) {
		us.deleteUser(uVo.getId());

		return "redirect: admin_main";
	}
	
	@RequestMapping("user_vod")
	public String userVOD(UserVO uVo, Model model) {
		List<VodVO> vodList = ms.listVOD(uVo.getId());
		
		model.addAttribute("vodList",vodList);
		model.addAttribute("user", uVo.getId());
		int price = 0;
		int buy = 0;
		for(VodVO vod: vodList) {
			if(vod.getResult().equals("y")) {
				buy += Integer.parseInt(vod.getPrice());
			}else {
				price += Integer.parseInt(vod.getPrice());
			}
		}
		model.addAttribute("buy", buy);
		model.addAttribute("price", price);
		return "admin/user_vod";
	}
}
