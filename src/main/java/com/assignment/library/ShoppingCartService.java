package com.assignment.library;



import org.springframework.stereotype.Service;

import jakarta.servlet.http.HttpSession;


@Service
public class ShoppingCartService {

	private static final String SESSION_CART = "cart";
	
	public Cart getCart(HttpSession session) {
		Cart cart = (Cart) session.getAttribute(SESSION_CART);
		
		if(cart == null) {
			cart = new Cart();
			setCart(session, cart);
		}
		return cart;
	}
	public void setCart(HttpSession session,Cart cart) {
		session.setAttribute(SESSION_CART, cart);
	}
	
	public void removeCart(HttpSession session,Cart cart) {
		session.removeAttribute(SESSION_CART);
	}
}
