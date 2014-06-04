package com.sample.poc.form.controller;


import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.sample.poc.form.FormDetails;

@Controller
@SessionAttributes
public class FormController {

	@RequestMapping(value = "/saveForm", method = RequestMethod.POST)
	public ModelAndView showFormDetails(@ModelAttribute("formDetails") FormDetails formDetails, BindingResult result) {
		
		return new ModelAndView("formResultView", "formDetails", formDetails);
	}
	
	@RequestMapping("/formDetails")
	public ModelAndView showInputForm() {
		
		return new ModelAndView("form", "command", new FormDetails());
	}
	
	@RequestMapping(value = "/payLoadInputForm")
	public ModelAndView showInputPayloadForm() {
		
		return new ModelAndView("payLoadInputForm","command", new FormDetails());
	}
}
