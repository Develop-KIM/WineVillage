package com.winevillage.winevillage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletResponse;

@Controller
public class CookieController {

	@GetMapping("/setCookie")
	public String setCookie(HttpServletResponse response) {
		Cookie cookie = new Cookie("WineVillageCookie", "value");
		cookie.setMaxAge( 60 * 60 * 6); 
		response.addCookie(cookie);
		return "redirect:/main.do";
	}
}