package com.mermaid.spring.owner.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.mermaid.spring.common.encryptor.AESEncrypt;
import com.mermaid.spring.owner.model.service.OwnerService;
import com.mermaid.spring.owner.model.vo.Owner;

@Controller
@SessionAttributes(value= {"loginOwner"})
public class OwnerController {

	@Autowired
	private Logger logger;
	
	@Autowired 
	private OwnerService service;
	
	@Autowired
	private BCryptPasswordEncoder pwEncoder;
	
	@Autowired
	private AESEncrypt aesEncrypt;
	 
	
	@RequestMapping("/owner")
	public String owner() {
		return "owner/ownerIndex";
	}
	
	@RequestMapping("/owner/ownerEnrollEnd.do")
	public String ownerEnrollEnd(Owner owner, Model m) {
		
		logger.debug(""+owner);
		
		//비밀번호 암호화에 BCryptPasswordEncoder 객체를 이용
		logger.debug("암호화 전 : "+owner.getPassword()); //암호화 전
		owner.setPassword(pwEncoder.encode(owner.getPassword())); //암호화
		logger.debug("암호화 후 : "+owner.getPassword()); //암호화 후
		
		/* AESEncrypt객체를 이용한 양방향 암호화 */
		//owner.setPassword(aesEncrypt.encrypt(owner.getPassword()));
		//logger.debug("AES 암호화 후 : "+owner.getPassword()); //AES객체로 암호화 후
		
		int result=service.insertOwner(owner);
		logger.debug(result>0?"입력성공":"입력실패");
		
		//복호화 시켜보기
		try {
			logger.debug(aesEncrypt.decrypt(owner.getPassword()));			
		}catch(UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		//화면전환 -> 메인화면으로 redirect
		String msg=result>0?"점주 가입에 성공했습니다":"점주 가입에 실패했습니다";
		String loc=result>0?"/owner/":"/owner/";
		m.addAttribute("msg", msg);
		m.addAttribute("loc", loc);
		return "common/msg";
	}
	
	//Httpsession 만들지 않고 세션유지하기
	@RequestMapping("/owner/ownerLogin.do")
	public String ownerLogin(Owner owner, Model model/* , HttpSession session */ /*HttpServletRequest request*/ ) {
		logger.debug(""+owner);
		Owner loginOwner=service.selectOwner(owner);
		logger.debug("로그인 시도 비밀번호(param) : "+owner.getPassword());
		if(loginOwner!=null) {
			logger.debug("DB 비밀번호 : "+loginOwner.getPassword());
		}
		
		String msg="";
		String loc="/owner/";
		
		//로그인로직처리하기
		if(loginOwner!=null) {
			//if(loginMember.getPassword().equals(member.getPassword())) {
			//bcrypt.match(salt값에 따라 서로 달라지는 메서드도 비교할 수 있도록 해준다)
			if(pwEncoder.matches(owner.getPassword(), loginOwner.getPassword())) {
				//단방향 암호화된 값 비교하기
				
				//로그인성공
				msg="로그인에 성공했습니다";
				//로그인 값 유지 -> session객체에 데이터 보관
				//HttpSession session=request.getSession();//서블릿방식!
				//session.setAttribute("loginMember", loginMember);
				
				//model에 담겨있는 데이터를  session범위로 옮겨보자
				//@SessionAttributes(value="value={"key값", (...)}") -> class선언부 위에
				model.addAttribute("loginOwner", loginOwner);
				logger.debug(""+model.containsAttribute("loginOwner"));
				//session.setAttribute("login1", loginOwner);
				
			} else {
				//패스워드 일치하지 않음
				msg="로그인 실패! - 패스워드를 확인하세요";
			}
		} else {
			//아이디가 일치하지 않음
			msg="로그인 실패! - 아이디를 확인하세요";
		}
		model.addAttribute("msg", msg);
		model.addAttribute("loc", loc);
		return "common/msg";
	}
	
	@RequestMapping("/owner/ownerLogout.do")
	//public String logout(HttpSession session) {
	public String logout(SessionStatus status) {
		//로그아웃처리하기
		logger.debug("여기 오니??");
		//status.isComplete() : 세션이 완료됬니?
		//true : 세션이 만료되었다
		//false : 세션이 살아있다
		//session.invalidate();
		if(!status.isComplete()) { //세션이 살아있다면..
			status.setComplete(); //세션을 닫아라!
		};
		return "redirect:/owner/";
	}
	
	@RequestMapping("/owner/ownerUpdateEnd.do")
	public String ownerUpdate(Owner owner, SessionStatus status, Model m) {
		logger.debug(""+owner);

		
		//비밀번호 암호화에 BCryptPasswordEncoder 객체를 이용
		logger.debug("암호화 전 : "+owner.getPassword()); //암호화 전
		owner.setPassword(pwEncoder.encode(owner.getPassword())); //암호화
		logger.debug("암호화 후 : "+owner.getPassword()); //암호화 후
		
		
		//복호화 시켜보기
		try {
			logger.debug(aesEncrypt.decrypt(owner.getPassword()));			
		}catch(UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		int result=service.updateOwner(owner);
		logger.debug(result>0?"입력성공":"입력실패");
		
		//화면전환 -> 메인화면으로 redirect
		String msg=result>0?"정보 수정에 성공했습니다":"정보 수정에 실패했습니다";
		String loc=result>0?"/owner/":"/owner/";
		if(result>0) {
			status.setComplete();
		}
		
		m.addAttribute("msg", msg);
		m.addAttribute("loc", loc);
		return "common/msg";
	}
	
	@RequestMapping("/owner/ownerDeleteEnd.do")
	public String ownerRemove(Owner owner, SessionStatus status, Model m) {
		Owner loginOwner=service.selectOwner(owner);

		String msg="";
		String loc="/owner/";
		if(loginOwner!=null) {
			//if(loginMember.getPassword().equals(member.getPassword())) {
			//bcrypt.match(salt값에 따라 서로 달라지는 메서드도 비교할 수 있도록 해준다)
			if(pwEncoder.matches(owner.getPassword(), loginOwner.getPassword())) {
				//단방향 암호화된 값 비교하기
				int result=service.deleteOwner(owner);
				msg=result>0?"탈퇴했습니다. 이용해주셔서 감사합니다":"올바른 암호를 입력하세요";
				if(result>0) {
					status.setComplete();
				}
			} else {
				msg="올바른 암호를 입력하세요";
			}
		} else {
			//아이디가 일치하지 않음
			msg="잘못된 아이디입니다";
		}
			
		m.addAttribute("msg", msg);
		m.addAttribute("loc", loc);
		return "common/msg";
	}
	
	@RequestMapping("/owner/idDuplicateCheck")
	public ModelAndView idDuplicateCheck(Owner owner, ModelAndView mav) {
		Owner check=service.selectOwner(owner);
		logger.debug(""+check);
		
		mav.addObject("o",check);
		mav.addObject("flag",check!=null?false:true);
		mav.setViewName("jsonView");
		logger.debug(""+mav.getModel());
				
		return mav;
	}
	 
}
