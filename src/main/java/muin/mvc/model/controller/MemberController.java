package muin.mvc.model.controller;

import java.util.List;


import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import muin.mvc.model.dto.MemberDTO;
import muin.mvc.model.service.MemberService;

@Controller
public class MemberController {

	@Autowired
	private MemberService memberService;
	
	//회원정보수정시 비밀번호 암호화처리를 위한 객체를 주입받는다
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
		
	//회원가입 폼
	@RequestMapping("/registerForm")
	public String registerForm() {
		return "member/registerForm";
	}
	
	
	//회원 가입하기 :: redirect 방식
	@RequestMapping("/registerMember")
	public String insertMaember(MemberDTO vo) {
		System.out.println("vo:"+vo);
		memberService.registerMember(vo);
		return "redirect:/";
	
	}
	
	//로그인 폼
	@RequestMapping("/loginForm")
	public String loginForm() {
		return "member/loginForm";
	}
	
	//회원 검색 폼
	@RequestMapping("/findMemberByIdForm")
	public String findIdMember() {
		return "member/findForm";
	}
	
//	//특정 회원 검색하기
//	@RequestMapping("member/findMember")
//	public ModelAndView findMember(HttpServletRequest request) {
//		String id = request.getParameter("memberEmail");
//		MemberDTO vo=memberService.findMemberById(id);
//		return new ModelAndView("member/findMember_result","vo",vo);
//	}
//	
//	//관리자 권한으로 들어가서 회원 명수 파악하기
//	@RequestMapping("admin/enterCafe")
//	public  ModelAndView adminWelcome() {
//		return new ModelAndView("admin/main","count",memberService.getMemberCount());
//	}
	
	//아이디 중복확인
	@RequestMapping("idcheckAjax")
	@ResponseBody
	public String idCheckAjax(HttpServletRequest request) {
		return memberService.idcheck(request.getParameter("memberEmail"));
	}
	
//	//주소 종류별 검색 :: select form
//	@RequestMapping("member/addressList")
//	public ModelAndView addressList() {
//		System.out.println("addressList");
//		return new ModelAndView("member/addressList", "list", memberService.getAddressList());
//	}
	
	
//	@RequestMapping("findMemberListByAddress")
//	@ResponseBody
//	public List<MemberDTO> findMemberListByAddress(HttpServletRequest request) { //?address
//		List<MemberDTO> list=memberService.findMemberListByAddress(request.getParameter("address"));
//		System.out.println("list="+list);
//		return list;
//	}
	
	@RequestMapping("member/updateForm") 
	public String updateForm() {
		return "member/updateForm";
	}
	
	
	@RequestMapping("updateMemberAction")
	public ModelAndView updateMemberAction(HttpServletRequest request, MemberDTO vo) {
		System.out.println("1. MemberVO  :: "+vo);
		//회원정보 수정위해 Spring Security 세션 회원정보를 반환받는다
		MemberDTO pvo=(MemberDTO)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		System.out.println("2. Spring Security 세션 수정 전 회원정보:" + pvo);
		
		//변경할 비밀번호를 암호화한다 
		String encodePassword=passwordEncoder.encode(vo.getMemberPwd());
		vo.setMemberPwd(encodePassword);
		memberService.updateMember(vo);
		
		System.out.println("**********************************************");
		// 수정한 회원정보로 Spring Security 세션 회원정보를 업데이트한다
		pvo.setMemberPwd(encodePassword);
		pvo.setMemberName(vo.getMemberName());
		System.out.println("3. Spring Security 세션 수정 후 회원정보:" + pvo);
				
		
		return new ModelAndView("member/update_result");
	}
	
}












