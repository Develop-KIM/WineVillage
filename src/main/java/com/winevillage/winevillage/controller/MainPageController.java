package com.winevillage.winevillage.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.winevillage.winevillage.product.ProductDTO;
import com.winevillage.winevillage.product.ProductService;

@Controller
public class MainPageController {

	@Autowired
	ProductService dao;
	
	@GetMapping("/main.do")
	public String mainpage(Model model, ProductDTO productDTO) {
		ArrayList<ProductDTO> lists = dao.ArrivalList(productDTO);
		model.addAttribute("lists", lists);
		
		return "main/main";
	}
}
