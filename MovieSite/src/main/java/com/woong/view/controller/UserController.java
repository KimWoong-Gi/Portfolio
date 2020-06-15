package com.woong.view.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.woong.biz.actor.ActorService;
import com.woong.biz.actor.ActorVO;
import com.woong.biz.movie.MovieService;
import com.woong.biz.movie.MovieVO;
import com.woong.biz.movie.VodVO;
import com.woong.biz.user.UserService;
import com.woong.biz.user.UserVO;


@SessionAttributes("loginUser")
@Controller
public class UserController {

	@Autowired
	private UserService us;
	
	@Autowired
	private ActorService as;
	
	@Autowired
	private MovieService ms;
	
	@RequestMapping("user_login_form")
	public String userLoginView(Model model) {
		model.addAttribute("title", "로그인");
		return "user/login";
	}

	@RequestMapping("user_login")
	public String userLoginAction(Model model, UserVO uVo) {
		UserVO vo = us.getUserById(uVo.getId());
		if (vo != null) {
			if (vo.getPwd().equals(uVo.getPwd())) {
				
				model.addAttribute("loginUser", vo);
				
				if(vo.getAdmin().equals("y")) {
					return "redirect: admin_main";
				}else {
					return "redirect: index";
				}
				
			} else {
				model.addAttribute("message", "비밀번호가 틀렸습니다.");
				model.addAttribute("title", "로그인");
				return "user/login";
			}
		} else {
			model.addAttribute("message", "아이디가 존재하지 않습니다.");
			model.addAttribute("title", "로그인");
			return "user/login";
		}
	}
	
	@RequestMapping("user_logout")
	public String userLogoutAction(SessionStatus session) {
		session.setComplete();
		
		return "redirect: user_login_form";
	}
	
	@RequestMapping("user_join_contract")
	public String joinContractView(Model model) {
		model.addAttribute("title", "회원가입 동의 여부");
		return "user/contract";
	}
	
	@RequestMapping("user_join_form")
	public String userJoinView(Model model){
		model.addAttribute("title", "회원가입");
		return "user/join";
	}
	
	@RequestMapping(value="id_check_form")
	public String idCheckView(@RequestParam(value="id", defaultValue="", required=false) String id, Model model) {
		model.addAttribute("id", id);
		
		return "user/id_check";
	}
	
	@RequestMapping(value="id_check")
	public String idCheckAction(@RequestParam(value="id", defaultValue="", required=false) String id, Model model) {	
				
		UserVO user = us.getUserById(id);
		
		if (user != null) { // 아이디 중복
			model.addAttribute("message", 1);
		} else {	// 아이디 사용 가능, 중복 x
			model.addAttribute("message", -1);
		}
		
		model.addAttribute("id", id);
		
		return "user/id_check";
	}
		
	@RequestMapping(value="nickname_check_form")
	public String nicknameCheckView(@RequestParam(value="nickname", defaultValue="", required=false) String nickname, Model model) {
		model.addAttribute("nickname", nickname);
		
		return "user/nickname_check";
	}
	
	@RequestMapping(value="nickname_check")
	public String nicknameCheckAction(@RequestParam(value="nickname", defaultValue="", required=false) String nickname, Model model) {	
				
		UserVO user = us.getUserByNickname(nickname);
		
		if (user != null) { // 아이디 중복
			model.addAttribute("message", 1);
		} else {	// 아이디 사용 가능, 중복 x
			model.addAttribute("message", -1);
		}
		
		model.addAttribute("nickname", nickname);
		
		return "user/nickname_check";
	}
	
	@RequestMapping("user_join")
	public String userJoinAction(UserVO uVo) {
		us.insertUser(uVo);
		
		return "redirect: user_login_form";
	}
	
	@RequestMapping("find_id_form")
	public String findIdView(Model model) {
		model.addAttribute("title","아이디/비밀번호 찾기");
		return "user/find_id";
	}
	
	@RequestMapping("find_id")
	public String findId(Model model, UserVO uVo) {
		UserVO user = new UserVO();
		user.setName(uVo.getName());
		user.setEmail(uVo.getEmail());
		
		String id = us.getIdByNameAndEmail(uVo);
		
		if(id==null) {
			model.addAttribute("message", "검색 결과가 없습니다.");
		}else {
			model.addAttribute("message", "\'"+uVo.getName()+"\'님의 아이디는 \'"+id+"\'입니다.");
		}
		
		model.addAttribute("title","아이디 찾기 결과");
		return "user/find_id_result";
	}
	
	@RequestMapping("find_pwd")
	public String findPwd(Model model, UserVO uVo) {
		UserVO user = new UserVO();
		user.setId(uVo.getId());
		user.setName(uVo.getName());
		user.setEmail(uVo.getEmail());
		
		String pwd = us.getPwdByIdAndNameAndEmail(uVo);
		
		if(pwd==null) {
			model.addAttribute("message", "검색 결과가 없습니다.");
		}else {
			model.addAttribute("message", "아이디 \'"+uVo.getId()+"\'의 비밀번호는 \'"+pwd+"\'입니다.");
		}
		
		model.addAttribute("title","비밀번호 찾기 결과");
		return "user/find_pwd_result";
	}
	
	@RequestMapping("user_mypage")
	public String userMypageView(HttpSession session ,Model model) {
		
		UserVO user = (UserVO)session.getAttribute("loginUser");
		
		if(user != null) {
			List<MovieVO> movieList = ms.listMyMovie(user.getId());
			List<ActorVO> actorList	= as.listMyActor(user.getId());
			List<VodVO> vodList = ms.listVOD(user.getId());
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
			model.addAttribute("movieList", movieList);
			model.addAttribute("actorList", actorList);
			model.addAttribute("vodList", vodList);
			model.addAttribute("title", "마이페이지");
			return "user/mypage";
		}else {
			
			return "user/login_fail";
		}
	}
	
	@RequestMapping("user_update_form")
	public String userUpdateView() {
		
		return "user/update";
	}
	
	@RequestMapping("user_update")
	public String userUpdateAction(UserVO uVo) {
		
		us.updateUser(uVo);
		
		return "redirect: user_mypage";
	}
}
