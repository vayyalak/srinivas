package com.sample.poc.form.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HomeController {

	@RequestMapping("/home")
	public ModelAndView homeAction() {

		String message = "POC Samples";
		System.out.println(message);
		return new ModelAndView("home", "message", message);
	}

}
