package com.mermaid.spring.member.controller;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.social.google.connect.GoogleConnectionFactory;
import org.springframework.social.oauth2.GrantType;
import org.springframework.social.oauth2.OAuth2Operations;
import org.springframework.social.oauth2.OAuth2Parameters;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.mermaid.spring.member.model.service.MemberService;

@Controller
public class MemberController {

	@Autowired 
	private Logger logger;
	
	@Autowired 
	private MemberService service;
	
	/* GoogleLogin*/
	@Autowired
	private GoogleConnectionFactory googleConnectionFactory;
	
	@Autowired
	private OAuth2Parameters googleOAuth2Parameters;
	
	/*@RequestMapping("/member/login.do")
	public String memberLogin(Member member, Model model) {
		return "member/login";
	}*/
	
	//로그인 첫화면 요청 메서드
	@RequestMapping(value="/login", method= {RequestMethod.GET,RequestMethod.POST})
	public String login(Model model, HttpSession session) {
		
		/*구글code 발행*/
		OAuth2Operations oauthOperations=googleConnectionFactory.getOAuthOperations();
		String url=oauthOperations.buildAuthorizeUrl(GrantType.AUTHORIZATION_CODE,googleOAuth2Parameters);
		logger.debug("구글 : "+url);
		
		model.addAttribute("google_url",url);
		
		return "member/login";
	}
	
	
	//구글 Callback 호출 메서드
	@RequestMapping(value="/oauth2callback", method= {RequestMethod.GET,RequestMethod.POST})
	public String googleCallback(Model model, @RequestParam String code) throws IOException{
		logger.debug("여기는 googleCallback");
		return "member/googleSuccess";
	}
	
	
}
