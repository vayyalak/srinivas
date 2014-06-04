package com.sample.poc.form.controller;


import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.sample.poc.form.DynaFormDetails;

@Controller
@SessionAttributes
public class DynamicFormController {

	@RequestMapping(value = "/saveDynamicForm", method = RequestMethod.POST)
	public ModelAndView showFormDetails(@ModelAttribute("formDetails") DynaFormDetails formDetails, BindingResult result) {
		List<String[]> data=new ArrayList<String[]>();
		int length=formDetails.getField1().length,i=0;
		for(i=0;i<length;i++){
			String row[]=new String[6];
			if(formDetails.getField1().length>i){
				row[0]=formDetails.getField1()[i];
			}else{
				row[0]="";
			}
			if(formDetails.getField2().length>i){
				row[1]=formDetails.getField2()[i];
			}else{
				row[1]="";
			}
			if(formDetails.getField3().length>i){
				row[2]=formDetails.getField3()[i];
			}else{
				row[2]="";
			}
			if(formDetails.getField4().length>i){
				row[3]=formDetails.getField4()[i];
			}else{
				row[3]="";
			}
			if(formDetails.getField5().length>i){
				row[4]=formDetails.getField5()[i];
			}else{
				row[4]="";
			}
			if(formDetails.getField6().length>i){
				row[5]=formDetails.getField6()[i];
			}else{
				row[5]="";
			}
			data.add(row);
		}
		return new ModelAndView("dynamicDisplayForm", "formDetails", data);
	}
	
	@RequestMapping("/dynamicInputDetails")
	public ModelAndView showInputForm() {
		
		return new ModelAndView("dynamicForm", "command", new DynaFormDetails());
	}
}
