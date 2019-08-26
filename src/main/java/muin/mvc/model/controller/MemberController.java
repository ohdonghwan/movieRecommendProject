package muin.mvc.model.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import muin.mvc.model.dto.MemberDTO;
import muin.mvc.model.dto.WishListDTO;
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
	
	
	//관리자 권한으로 들어가서 회원 명수 파악하기
	 
	 @RequestMapping("admin/enterCafe") public String adminSelect(Model model) {
	 List<MemberDTO> list = memberService.memberList(); int count =
	 memberService.getMemberCount(); model.addAttribute("list", list);
	 model.addAttribute("count", count); return "admin/enterCafe"; }
	 
	//아이디 중복확인
	@RequestMapping("idcheckAjax")
	@ResponseBody
	public String idCheckAjax(HttpServletRequest request) {
		return memberService.idcheck(request.getParameter("memberEmail"));
	}
	
	@RequestMapping("member/updateForm") 
	public String updateForm() {
		return "member/updateForm";
	}
	
	
	@RequestMapping("updateMemberAction")
	public ModelAndView updateMemberAction(@RequestParam String memberPwd,@RequestParam String newName,HttpServletRequest request, MemberDTO vo) {
		System.out.println("1. MemberVO  :: "+vo);
		System.out.println("비밀번호값"+memberPwd);
		//회원정보 수정위해 Spring Security 세션 회원정보를 반환받는다
		vo =(MemberDTO)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		System.out.println("2. Spring Security 세션 수정 전 회원정보:" + vo);
		
		//변경할 비밀번호를 암호화한다 
		String encodePassword=passwordEncoder.encode(memberPwd);
		vo.setMemberPwd(encodePassword);
		vo.setMemberName(newName);
		memberService.updateMember(vo);

		System.out.println("**********************************************");
		// 수정한 회원정보로 Spring Security 세션 회원정보를 업데이트한다
		System.out.println(vo.getMemberPwd());
		
		return new ModelAndView("/index");   //member/update_result
	}
	
	@RequestMapping("member/mypage") //마이페이지
	public String myPage() {
		return "member/mypage";
	}
	
	@RequestMapping("/withdrawal")  //탈퇴처리(고객정보삭제)
	public String deleteSecession(@RequestParam String pw, Model model, MemberDTO vo,HttpServletRequest request) throws Exception {
		vo = (MemberDTO)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		if(passwordEncoder.matches(pw, vo.getMemberPwd())) {
			memberService.withdrawal(vo);
			
			Authentication auth = SecurityContextHolder.getContext().getAuthentication();
			if (auth != null){
			   new SecurityContextLogoutHandler().logout(request, null, null);
			}
			
			return "redirect:/";
			
		}else {
			model.addAttribute("message","비밀번호가 불일치합니다.");
			return "member/withdrawal";
		}
	
	}
	
	@RequestMapping("member/withdrawal")
	public String withdrawal() {
		return "member/withdrawal";
	}
	
	
	@RequestMapping("member/updateInfo") 
	  public String updateInfo() { 
		  
		  return "member/updateInfo"; 
		
	  }
	 
	@RequestMapping("/confirm")
	public String confirm(@RequestParam String memberPwd, Model model,MemberDTO vo) {
	
		vo = (MemberDTO)SecurityContextHolder.getContext().getAuthentication().getPrincipal();

		
		System.out.println(vo.getMemberEmail());
		System.out.println(memberPwd);
		System.out.println(vo.getMemberPwd());
		System.out.println(passwordEncoder.matches(memberPwd, vo.getMemberPwd()));
		
		if(passwordEncoder.matches(memberPwd, vo.getMemberPwd())) { 
			return "member/updateForm";
		}else {
			model.addAttribute("message","비밀번호가 불일치합니다.");
			return "member/updateInfo";
		}
	}
	
	@RequestMapping("/member/insertWishList")
	@ResponseBody
	public int regitWishList(Long memberId, Long movieNo) {
		System.out.println("regitWishList Method start");
		if(this.checkWishList(memberId, movieNo)==1) {
			memberService.insertWishList(memberId, movieNo);
			System.out.println("regitWishList Method end");
			return 1;
		}
		else return 0;
	}
	@RequestMapping("/member/myWishList")
	@ResponseBody
	public ModelAndView myWishList(Long memberId) {
		List<WishListDTO> list = memberService.myWishList(memberId);
		return new ModelAndView("member/wishList", "list", list);
	}

	//중복체크 하기위한 메소드
	public int checkWishList(Long memberId, Long movieNo) {
		System.out.println("checkWishList Method start");
		if(memberService.checkWishList(memberId, movieNo)!=null) return 0; // select문에서 아무것도 안나왔을때 찜할 수 있음 1이나오면 중복아닌것
		else return 1;
	}
	
	@RequestMapping("/enterCafe")
	public ModelAndView list(@RequestParam String searchOption, @RequestParam String keyword ) throws Exception{
		
		List<MemberDTO> list = memberService.listAll(searchOption, keyword);
		
		ModelAndView mv = new ModelAndView();
		
		int count = memberService.countMember(searchOption,keyword);
		
		
		Map<String,Object> map = new HashMap<String, Object>();
		
		map.put("list", list);
		map.put("count", count);
		map.put("searchOption",searchOption);
		map.put("keyword",keyword);
		mv.addObject("map",map);
		mv.setViewName("admin/enterCafe");
		return mv;
	}

}