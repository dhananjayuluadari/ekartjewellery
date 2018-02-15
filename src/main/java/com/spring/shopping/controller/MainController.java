package com.spring.shopping.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.shopping.model.Customer;
import com.spring.shopping.model.Tag;
import com.spring.shopping.service.ProductConfigService;
import com.spring.shopping.util.SessionUtils;



@Controller
public class MainController {
	
	@Autowired
	private ProductConfigService productConfigService;
	List<Tag> data = new ArrayList<Tag>();
	
	
	MainController() {
		
		
	}

	/*@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView getPages() {

		ModelAndView model = new ModelAndView("example");
		return model;

	}*/

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/getTags", method = RequestMethod.GET)
	public @ResponseBody
	List<Tag> getTags(@RequestParam String tagName,HttpServletRequest request) {
		HttpSession sess=request.getSession();
		data=(List<Tag>) sess.getAttribute("data");
		
		return simulateSearchResult(tagName,data);

	}

	private List<Tag> simulateSearchResult(String tagName,List<Tag> data1) {

		List<Tag> result = new ArrayList<Tag>();

		// iterate a list and filter by tagName
		for (Tag tag : data1) {
			if (tag.getTagName().contains(tagName)) {
				result.add(tag);
			}
		}

		return result;
	}

}
