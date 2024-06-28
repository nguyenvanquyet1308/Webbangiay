package com.assignment.library;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Service
public class SessionService {
    @Autowired 
    HttpSession session;

    public SessionService(HttpSession session) {
        this.session = session;
    }

    public void set(String key, String value) {
        session.setAttribute(key, value);
    }

    public Object get(String name) {
        return session.getAttribute(name);
    }

    public void invalidate() {
        session.removeAttribute("user");
        session.invalidate();
    }

    public boolean isLogin() {
        return get("user") != null;
    }

    public String getLoginedUsername() {
        Object username = get("user");
        return username == null ? null : username.toString();
    }

    // public static boolean isAdmin() {
    //     return isAdmin() && Customer.getAdmin() == true;
    // }
}
