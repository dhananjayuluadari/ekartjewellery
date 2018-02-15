package com.spring.shopping.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.shopping.service.CartDetailsService;

@Controller
public class UpdateEmailController {
	
	@Autowired
	private CartDetailsService cartDetailsService;

	private String updateEmailPage = "template/update-email";

	@RequestMapping(value = "/updateEmail", method = RequestMethod.GET)
	public String getUpdateEmailPage(Model model,HttpServletRequest request) {
		int cartSize=cartDetailsService.cartSize(request);
		model.addAttribute("cartSize", cartSize);
		model.addAttribute("page", updateEmailPage);
		
		return "account";
	}
}
