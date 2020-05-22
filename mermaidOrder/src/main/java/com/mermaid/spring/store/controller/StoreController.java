package com.mermaid.spring.store.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.mermaid.spring.common.PageFactory;
import com.mermaid.spring.owner.model.service.OwnerService;
import com.mermaid.spring.owner.model.vo.Owner;
import com.mermaid.spring.store.model.service.StoreService;
import com.mermaid.spring.store.model.vo.Store;

@Controller
public class StoreController {

	@Autowired 
	private Logger logger;
	
	@Autowired
	private StoreService service;
	
	@Autowired
	private OwnerService oService;
	
	@RequestMapping(value="/store/storeFormEnd.do")
	@ResponseBody
	public ModelAndView storeEnrollEnd(HttpSession session, @RequestBody String s, ModelAndView mav) {
		Owner data=(Owner)session.getAttribute("loginOwner");
		Owner check=oService.selectOwner(data); //세션과 일치하는 점주아이디가 있는지 
		int result=0;
		
		ObjectMapper mapper = new ObjectMapper();
		
		logger.debug(""+s);
//		ArrayList<Store> list=new ArrayList<Store>();
//		JSONPObject json = new JSONPObject("JSON.parse", list); 
//		String jsonStr = mapper.writeValueAsString(json);
		Store store=null;
		try {
			store = mapper.readValue(s,Store.class);
		} catch (JsonParseException e) {
			e.printStackTrace();
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		store.setOwnerNo(data.getOwnerNo());
		logger.debug(""+store);
		
		if(check!=null) {
			result=service.insertStore(store);
		}
		logger.debug(result>0?"점포 입력성공":"점포 입력실패");
		
		mav.addObject("flag",result>0?true:false);
		mav.setViewName("jsonView");
		logger.debug(""+mav.getModel());
		
		return mav;
	}
	@RequestMapping(value="/store/storeUpdateFormEnd.do")
	@ResponseBody
	public ModelAndView storeUpdateEnd(HttpSession session, @RequestBody String s, ModelAndView mav) {
		Owner data=(Owner)session.getAttribute("loginOwner");
		Owner check=oService.selectOwner(data); //세션과 일치하는 점주아이디가 있는지 
		int result=0;
		
		logger.debug(""+s);
		ObjectMapper mapper = new ObjectMapper();
		Store store=null;
		try {
			store = mapper.readValue(s,Store.class);
		} catch (JsonParseException e) {
			e.printStackTrace();
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		store.setOwnerNo(data.getOwnerNo());
		logger.debug(""+store);
		
		if(check!=null) {
			result=service.updateStore(store);
		}
		logger.debug(result>0?"점포 수정성공":"점포 수정실패");
		
		mav.addObject("flag",result>0?true:false);
		mav.setViewName("jsonView");
		logger.debug(""+mav.getModel());
		return mav;
	}
	
	@RequestMapping(value="/store/storeDeleteEnd.do")
	@ResponseBody
	public ModelAndView storeDeleteEnd(HttpSession session, @RequestBody String s, ModelAndView mav) {
		Owner data=(Owner)session.getAttribute("loginOwner");
		Owner check=oService.selectOwner(data); //세션과 일치하는 점주아이디가 있는지 
		int result=0;
		
		logger.debug(""+s);
		ObjectMapper mapper = new ObjectMapper();
		Store store=null;
		try {
			store = mapper.readValue(s,Store.class);
		} catch (JsonParseException e) {
			e.printStackTrace();
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		store.setOwnerNo(data.getOwnerNo());
		
		logger.debug(""+store);
		
		if(check!=null) {
			result=service.deleteStore(store);
		}
		logger.debug(result>0?"점포 삭제성공":"점포 삭제실패");
		
		mav.addObject("flag",result>0?true:false);
		mav.setViewName("jsonView");
		logger.debug(""+mav.getModel());
		return mav;
	}
	
	
	@RequestMapping(value="/store/storeSelect.do",produces="application/json; charset=utf8")
	public ModelAndView selectStoreList(
			HttpSession session, 
			ModelAndView mav,
			@RequestParam(required = false, defaultValue = "1") int cPage, 
			@RequestParam(required=false,defaultValue="5") int numPerPage) throws JsonProcessingException {
		
		Owner data=(Owner)session.getAttribute("loginOwner");
		Owner check=oService.selectOwner(data); //세션과 일치하는 점주아이디가 있는지 
		logger.debug(""+check);
		
		Store s=new Store(0, data.getOwnerNo(), null, null);
		
		List<Map<String,String>> sList=service.selectListStore(cPage,numPerPage,s);
		int totalCount=service.selectStoreCount(s);
		
		logger.debug("flag",sList.size()>0?true:false);
		for(Map<String,String> m:sList) {
			logger.debug(""+m);
		}
		
		ObjectMapper mapper = new ObjectMapper();
		String jsonStr=mapper.writeValueAsString(sList);
		logger.debug(""+jsonStr);
		logger.debug(""+cPage);
		logger.debug(""+numPerPage);
		
		mav.addObject("flag",sList.size()>0?true:false);
		mav.addObject("storeList", jsonStr);
		mav.addObject("pageBar",PageFactory.getAjaxPage(totalCount, cPage, numPerPage, "/20AM_mermaidOrder_final/store/storeSelect.do"));
		mav.addObject("count",totalCount);
		mav.setViewName("jsonView");
		logger.debug(""+mav.getModel());
		
		return mav;
	}
}
