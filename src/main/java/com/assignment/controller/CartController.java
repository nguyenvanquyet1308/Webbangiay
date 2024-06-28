package com.assignment.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.assignment.entity.Product;
import com.assignment.library.Cart;
import com.assignment.library.ProductService;
import com.assignment.library.SessionService;
import com.assignment.library.ShoppingCartService;

import jakarta.servlet.http.HttpSession;

@Controller
public class CartController {

	@Autowired
	ProductService productService;
	
	@Autowired
	ShoppingCartService cartService;
	

    @Autowired
    SessionService sessionService;
	
	@RequestMapping("/gioHang")
	public String Index() {
		
		
		return "/viewGioHang/cartdemo";
	}
	
	
	@RequestMapping( "/gioHang/add" )
	public String add(HttpSession session, @RequestParam("id") Integer id,
			@RequestParam("quantity") int quantity) {
		
		if(!sessionService.isLogin()) {
            return "redirect:/dangNhap";
		}
		System.out.println("id"+id);
		Product product = productService.getById(id);
		Cart cart = cartService.getCart(session);
		cart.addItem(product, quantity);
		return "redirect:/"; 
	}
	
	@RequestMapping("gioHang/add1")
	public String add1(HttpSession session, @RequestParam("id")Integer id,
			@RequestParam(value = "qty", required = false, defaultValue = "1")int qty) {
	
		if(!sessionService.isLogin()) {
            return "redirect:/dangNhap";
		}
		Product product = productService.getById(id);
	
		Cart cart = cartService.getCart(session);
		cart.addItem(product, qty);
		return "redirect:/sanpham";
	}
	@RequestMapping("/gioHang/remove")
	public String remove(HttpSession session,@RequestParam("id")Integer id) {
		Product product = productService.getById(id);
		Cart cart = cartService.getCart(session);
		cart.removeItem(product);
		
		return "redirect:/gioHang"; // hiển thị giỏ hàng
	}
	
	@RequestMapping("/gioHang/update")
	public String update(HttpSession session, @RequestParam("id")Integer id,@RequestParam("qty")int qty) {
		
		Product product = productService.getById(id);
		Cart cart = cartService.getCart(session);
		cart.updateItem(product, qty);
		return "redirect:/gioHang"; // hiển thị giỏ hàng
	}
	
}
