package com.assignment.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.assignment.dao.CustomerDAO;
import com.assignment.entity.Customer;
import com.assignment.library.SessionService;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class ProfileController {

	@Autowired
	CustomerDAO daoCustomer;

	@Autowired
	SessionService sessionService;

	@RequestMapping("/hoSo")
	public String Index(HttpServletRequest request) {

		return "viewHoSo/hoSo";
	}

	@RequestMapping("/hoSo/{customerId}")
	public String EditProfile(@PathVariable("customerId") Integer customerId, Model model, HttpServletRequest request) {
		
		
		Customer customer = daoCustomer.findById(customerId).get();

		if (customer == null) {
			return "viewLogin/dangNhap";
		}
		model.addAttribute("customer", customer);

		List<Customer> item = daoCustomer.findAll();
		model.addAttribute("itemCustomer", item);

		return "viewHoSo/hoSo";

	}
}
