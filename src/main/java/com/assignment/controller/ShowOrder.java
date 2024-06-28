package com.assignment.controller;

import java.util.Date;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.assignment.dao.OrderDetailDAO;
import com.assignment.dao.OrdersDAO;
import com.assignment.dao.ProductDAO;
import com.assignment.entity.CartItem;
import com.assignment.entity.Customer;
import com.assignment.entity.OrderDetail;
import com.assignment.entity.Orders;
import com.assignment.entity.Product;
import com.assignment.library.Cart;
import com.assignment.library.ProductService;
import com.assignment.library.SessionService;
import com.assignment.library.ShoppingCartService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class ShowOrder {

	@Autowired
	SessionService sessionService;
	@Autowired
	OrdersDAO daoOrders;
	@Autowired
	OrderDetailDAO daoOrderDetail;
	@Autowired
	ShoppingCartService cartService;
	@Autowired
	ProductService productService;
	@Autowired
	ProductDAO daoProduct;

	@RequestMapping("/thanhtoan")
	public String thanhToan(Model model, HttpServletRequest request) {
		if (sessionService.isLogin()) {
			Customer customer = (Customer) request.getSession().getAttribute("user");
			model.addAttribute("customer", customer);

			List<Orders> item = daoOrders.findByCustomerCustomerId(customer.getCustomerId());
			model.addAttribute("itemOrders", item);
			return "viewThanhToan/thanhToan";
		} else {
			return "/viewLogin/dangNhap";
		}
	}

	@RequestMapping(value = "/thanhtoan", method = RequestMethod.POST)
	public String Orders(Model model, HttpServletRequest request, HttpSession session) {
		Cart cart = cartService.getCart(session);
		Customer customer = (Customer) request.getSession().getAttribute("user");

		Orders order = new Orders();
		order.setCustomer(customer);
		order.setOrderDate(new Date());
		order.setAmount(cart.getTotal());
		order.setStatus(false);
		Orders saveOrders = daoOrders.save(order);

		for (CartItem item : cart.getAllItems()) {
			OrderDetail orderDetail = new OrderDetail();
			orderDetail.setOrder(saveOrders);
			orderDetail.setProduct(item.getProduct());
			orderDetail.setQuantity(item.getQuantity());
			orderDetail.setUnitPrice(item.getProduct().getUnitPrice());
			daoOrderDetail.save(orderDetail);
		}
		cart.clear();

		List<Orders> item = daoOrders.findByCustomerCustomerId(customer.getCustomerId());
		model.addAttribute("itemOrders", item);

		return "viewThanhToan/thanhToan";
	}

	@RequestMapping("/thanhtoan/remove")
	public String remove(HttpSession session, @RequestParam("id") Integer id) {
		Product product = productService.getById(id);
		Cart cart = cartService.getCart(session);
		cart.removeItem(product);

		return "redirect:/thanhtoan"; // hiển thị giỏ hàng
	}

	@RequestMapping("/thanhtoan/update")
	public String update(HttpSession session, @RequestParam("id") Integer id, @RequestParam("qty") int qty) {

		Product product = productService.getById(id);
		Cart cart = cartService.getCart(session);
		cart.updateItem(product, qty);
		return "redirect:/thanhtoan"; // hiển thị giỏ hàng
	}

}
