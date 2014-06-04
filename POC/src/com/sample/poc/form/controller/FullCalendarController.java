package com.sample.poc.form.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class FullCalendarController {

	private Integer currentYear;
	private Integer currentMonth;
	
	@RequestMapping("/showEvents")
	public ModelAndView showEvents() {

		return new ModelAndView("showEvents", "message", "");
	}
	@RequestMapping(value="/getEvents", method=RequestMethod.GET)
	public @ResponseBody List<Map<String,Object>> getEvents(HttpServletRequest request,HttpServletResponse response){
		currentYear=Integer.parseInt(request.getParameter("currentYear"));
		currentMonth=Integer.parseInt(request.getParameter("currentMonth"));
		
		List<Map<String,Object>> events=new ArrayList<Map<String,Object>>();
		
		events.add(getEventsDetails(1, 1 , null , "www.yahoo.com","YAHOO"));
		events.add(getEventsDetails(2, 5 , 6 , "www.facebook.com","FACEBOOK"));
		
		events.add(getEventsDetails(3, 15 , null , "www.google.com","GOOGLE"));
		events.add(getEventsDetails(4, 16 , null , "www.amazon.com","AMAZON"));
		
		events.add(getEventsDetails(5, 20 , null , "www.rediff.com","REDIFF"));
		events.add(getEventsDetails(6, 24 , 26 , "www.gmail.com","GMAIL"));
		
		return events;
	}
	
	private Map<String,Object> getEventsDetails(Integer id,Integer start,Integer end,String url,String display){
		Map<String,Object> event=new HashMap<String, Object>();
		String stDate,stMonth,endDate;
		event.put("id", 111+id);
		event.put("title", "EVENT: "+display);
		
		if(start<10){
			stDate="0"+start;
		}else{
			stDate=start.toString();
		}
		if(currentMonth<10){
			stMonth="0"+currentMonth;
		}else{
			stMonth=currentMonth.toString();
		}
		
		event.put("start", currentYear+"-"+stMonth+"-"+stDate);
		if(end!=null && !end.equals(0)){
			if(end<10){
				endDate="0"+end;
			}else{
				endDate=end.toString();
			}
			event.put("end", currentYear+"-"+stMonth+"-"+endDate);
		}
		event.put("url", "http://"+url+"/");
		return event;
	}
}
