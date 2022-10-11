package com.ezen.p2.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ezen.p2.dto.HeartDto;
import com.ezen.p2.dto.MemberVO;
import com.ezen.p2.dto.MyPageVO;
import com.ezen.p2.dto.PetDto;
import com.ezen.p2.service.MemberService;
import com.ezen.p2.service.PetService;
import com.ezen.p2.util.Paging;

@Controller
public class MemberController {

	@Autowired
	MemberService ms;
	
	@Autowired
	PetService ps;
	
	@RequestMapping(value="/login",method=RequestMethod.POST)
	public String login(Model model, HttpServletRequest request, MemberVO membervo) {
		String url = "main";
		MemberVO mvo = ms.getMember(membervo.getId());
		if(mvo==null)
			model.addAttribute("message","아이디가 없습니다.");
		else if(mvo.getPwd()==null)
			model.addAttribute("message","DB 오류, 관리자에게 문의하세요.");
		else if(!mvo.getPwd().equals(membervo.getPwd()))
			model.addAttribute("message","비밀번호가 맞지 않습니다.");
		else if(mvo.getPwd().equals(membervo.getPwd())) {
			HttpSession session = request.getSession();
			session.setAttribute("loginUser", mvo);
			String now = request.getHeader("referer");
			url = "redirect:" +now;
		}
		return url;
	}
	
	@RequestMapping(value="/logout",method=RequestMethod.GET)
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();
		return "redirect:/";
	}
	
	
	
	
	//마이페이지 입양현황
	@RequestMapping(value="/mypage")
	public ModelAndView mypage(HttpServletRequest request) {
		HttpSession session = request.getSession();
		MemberVO mv = (MemberVO) session.getAttribute("loginUser");
		ModelAndView mav = new ModelAndView();
		
		if(session.getAttribute("loginUser")==null) {
			mav.setViewName("adopt/petList");
			return mav;
		}
		else
		{
			String id =mv.getId();
			
			int p = 1;
			int p2= 1;
			if(request.getParameter("page") != null) {
				
				p = Integer.parseInt(request.getParameter("page"));
			}
			if(request.getParameter("page2") !=null){
				
				p2 = Integer.parseInt(request.getParameter("page2"));
			}
			
			HashMap<String, Object> adoptList = ms.getadoptList(p, id);		//입양현황
			HashMap<String, Object> heartList = ms.getheartList(p2, id);	//찜현황
			
			mav.addObject("id",id);
			mav.addObject("adoptList",  (List<MyPageVO>)adoptList.get("adoptList"));	//입양현황
			mav.addObject("heartList",  (List<MyPageVO>)heartList.get("heartList"));	//찜현황
			
			mav.addObject("paging", ( Paging )adoptList.get("paging"));
			mav.addObject("paging2", ( Paging )heartList.get("paging2"));
			mav.setViewName("member/myPage");
		}
		
			return mav;
	}
	
	
	
	//마이페이지 찜 취소
	@RequestMapping("/listcancel")
	public String removeHeart(@RequestParam("num")int num,HttpServletRequest request){
		HttpSession session = request.getSession();
		MemberVO mvo = (MemberVO) session.getAttribute("loginUser");
		
		
		MyPageVO mpvo = ms.getDetail(num);
		if(mpvo.getState().equals("c"))
			ms.updateState(mpvo.getP_num(),"a");
		
		ms.removeHeart(num);
    	
    	return "redirect:/mypage";
		
	}
	
	
	
	
	@RequestMapping(value="/joinForm")
	public String joinForm() {
		return "member/joinForm";
	}
	
	@RequestMapping(value="/idCheckForm")
	public ModelAndView idCheck(@RequestParam("id") String id) {
		ModelAndView mv = new ModelAndView();
		MemberVO mvo = ms.getMember(id);
		
		if(mvo==null) {
			mv.addObject("result",1);
		}
		else if(mvo!=null){
			mv.addObject("result",-1);
		}
		
		mv.addObject("id",id);
		mv.setViewName("member/idCheck");
		return mv;
	}
	
	@RequestMapping(value="/join",method=RequestMethod.POST)
	public ModelAndView join(@ModelAttribute("dto") @Valid MemberVO membervo,BindingResult result,
			@RequestParam(value="reid",required=false) String reid,
			@RequestParam(value="rePwd",required=false) String pwdchk, Model model) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("member/joinForm");
		mv.addObject("reid",reid);
		mv.addObject("rePwd",pwdchk);
		if(result.getFieldError("id")!=null)
			mv.addObject("msg",result.getFieldError("id").getDefaultMessage());
		else if(result.getFieldError("pwd")!=null)
			mv.addObject("msg",result.getFieldError("pwd").getDefaultMessage());
		else if(result.getFieldError("name")!=null)
			mv.addObject("msg",result.getFieldError("name").getDefaultMessage());
		else if(!membervo.getPwd().equals(pwdchk))
			mv.addObject("msg","비밀번호가 일치하지 않습니다.");			
		else if(result.getFieldError("phone")!=null)
			mv.addObject("msg",result.getFieldError("phone").getDefaultMessage());
		else if(result.getFieldError("email")!=null)
			mv.addObject("msg",result.getFieldError("email").getDefaultMessage());
		else if(result.getFieldError("post_code")!=null)
			mv.addObject("msg",result.getFieldError("post_code").getDefaultMessage());
		else if(result.getFieldError("address2")!=null)
			mv.addObject("msg",result.getFieldError("address2").getDefaultMessage());
		else if(!membervo.getId().equals(reid))
			mv.addObject("msg","아이디 중복체크를 해주세요.");
		
		else {
			ms.insertMember(membervo);
			mv.addObject("message","회원가입이 완료되었습니다, 로그인하세요!");
			mv.setViewName("redirect:/");
		}		
		return mv;
	}
	
	@RequestMapping("/withdrawal")
	public String withdrawal(HttpServletRequest request) {
		HttpSession session = request.getSession();
		if(session.getAttribute("loginUser")==null)
			return "/";
		else
			return "member/withdrawal1";			
	}
	
	@RequestMapping("/withdrawalCommit")
	public String withdrawalCommit(HttpServletRequest request,@RequestParam("id") String id,MemberVO membervo) {
		HttpSession session = request.getSession();
		if(session.getAttribute("loginUser")==null)
			return "/";
		else
			ms.deleteMember(id);
			session.invalidate();
			return "member/withdrawal2";
	}
	
	@RequestMapping(value="/memberModify")
	public String memberModify(HttpServletRequest request) {
		HttpSession session = request.getSession();
		if(session.getAttribute("loginUser")==null)
			return "/";
		else
			return "member/memberModify";
	}
	
	@RequestMapping(value="/updateMember",method=RequestMethod.POST)
	public ModelAndView updateMember(HttpServletRequest request,MemberVO membervo){
		ModelAndView mv = new ModelAndView();
		ms.updateMember(membervo);
		HttpSession session = request.getSession();
		session.setAttribute("loginUser", membervo);
		mv.setViewName("redirect:/mypage");
		return mv;
	}
	
	@RequestMapping(value="/mypageOrderView")
	public String mypageOrderView(HttpServletRequest request) {
		HttpSession session = request.getSession();
		if(session.getAttribute("loginUser")==null)
			return "/";
		else {
			return "member/mypageOrderView";
		}
	}
	
	@RequestMapping(value="/mypageQna")
	public String mypageQna(HttpServletRequest request) {
		HttpSession session = request.getSession();
		if(session.getAttribute("loginUser")==null)
			return "/";
		else {
			return "member/mypageQna";
		}
	}
	
	
}
