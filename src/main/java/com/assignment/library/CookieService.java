package com.assignment.library;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Service;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Service
public class CookieService {

	 @Autowired HttpServletResponse response;
	 @Autowired HttpServletRequest Request;

	public void add(String name, String value, int days) {
		Cookie cookie = new Cookie(name, value);
		cookie.setMaxAge(days * 24 * 60 * 60);
		response.addCookie(cookie);
	}

	public void remove(String name) {
		Cookie cookie = new Cookie(name, null);
		cookie.setMaxAge(0);
		response.addCookie(cookie);
	}
	public String getCookies(String name) {
		Cookie[] cookies = Request.getCookies();
		if (cookies != null) {
			for (Cookie cookie : cookies) {
				if (cookie.getName().equalsIgnoreCase(name)) {
					return cookie.getValue();
				}
			}
		}
		return "";
		
	}
}
