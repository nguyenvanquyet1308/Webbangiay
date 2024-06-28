package com.assignment.admin;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.assignment.controller.ProductTrangChu;
import com.assignment.dao.ProductDAO;
import com.assignment.entity.Customer;
import com.assignment.entity.Product;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller

public class viewAdmin {

	@Autowired
	HttpServletRequest request;
	@Autowired
	ProductDAO daoProduct;

	@RequestMapping("/admin")
	public String index(Model model) {
		Customer customer = (Customer) request.getSession().getAttribute("user");
//		if (customer != null && customer.isAdmin() == true) {
//			System.out.println("chạy tới admin adadmin");
//
//			return "/viewAdmin/trangAdmin";
//		} else {
//			System.out.println("chạy tới admin ko admin");
//
//			return "redirect:/";
//
//		}
		
		
		return "/viewAdmin/trangAdmin";


	}

//	@GetMapping()
//	public String paginate(Model model, @RequestParam("p") Optional<Integer> p, HttpSession session) {
//		Pageable pageable = PageRequest.of(p.orElse(0), 9);
//		{
//			Customer customerCheck = (Customer) request.getSession().getAttribute("user");
//			if (customerCheck != null && customerCheck.isAdmin() == true) {
//				System.out.println("chạy tới admin ko admin");
//
//				return "/viewAdmin/trangAdmin";
//			} else {
//				// Pageable pageable = PageRequest.of(2, 5);
//				Page<Product> page = daoProduct.findAll(pageable);
//				model.addAttribute("page", page);
//				Product product = new Product();
//				model.addAttribute("product", product);
//				List<Product> item = daoProduct.findAll();
//				model.addAttribute("itemProduct", item);
//
//				Customer customer = (Customer) session.getAttribute("user");
//				if (customer != null) {
//					model.addAttribute("customer", customer);
//				} else {
//					System.out.println("lỗi chưa đăng nhập");
//					return "viewTrangChu/trangKhachHang";
//				}
//
//				return "viewTrangChu/trangKhachHang";
//			}
//
//		}
//	}

}
