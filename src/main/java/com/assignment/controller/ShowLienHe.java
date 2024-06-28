package com.assignment.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ShowLienHe {

	
	@RequestMapping("/lienHe")
	public String index() {
		
		
		return "viewLienHe/lienHe";
	}
}
