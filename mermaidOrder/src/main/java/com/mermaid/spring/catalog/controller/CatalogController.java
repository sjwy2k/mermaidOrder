package com.mermaid.spring.catalog.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.mermaid.spring.catalog.model.service.CatalogService;
import com.mermaid.spring.category.model.service.CategoryService;
import com.mermaid.spring.owner.model.service.OwnerService;
import com.mermaid.spring.owner.model.vo.Owner;
import com.mermaid.spring.store.model.service.StoreService;
import com.mermaid.spring.store.model.vo.Store;

@Controller
public class CatalogController {

	@Autowired
	private Logger logger;
	
	@Autowired
	private OwnerService oService;

	@Autowired
	private StoreService sService;
	
	@Autowired
	private CatalogService service;
	
	@Autowired
	private CategoryService cService;
		
	@RequestMapping(value="/catalog/catalogSelect.do", produces="application/json; charset=utf8")
	@ResponseBody
	public ModelAndView selectCatalogList(
			HttpSession session, ModelAndView mav) throws JsonProcessingException {
		
		Owner oData=(Owner)session.getAttribute("loginOwner");
		int totalCount=sService.selectStoreCount(new Store(0,oData.getOwnerNo(),null,null));
		List<Map<String, String>> sList=sService.selectListAllStore(oData);
		
		logger.debug(""+oData+totalCount);
		logger.debug(""+sList.size());
		for(Map<String,String> m:sList) {
			logger.debug(""+m);
		}
		
		ObjectMapper mapper=new ObjectMapper();
		String jsonStr=mapper.writeValueAsString(sList);
		
		mav.addObject("flag",sList.size()>0?true:false);
		mav.addObject("sList",jsonStr);
		mav.addObject("tCount",""+totalCount);
		mav.setViewName("jsonView");
		logger.debug(""+mav.getModel());
		
		return mav;
	}
	
	
}
