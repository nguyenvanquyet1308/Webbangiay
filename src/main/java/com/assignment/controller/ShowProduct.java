package com.assignment.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.assignment.dao.ProductDAO;
import com.assignment.entity.Product;

@Controller
public class ShowProduct {
	@Autowired
	ProductDAO daoProduct;

//	@RequestMapping("/trangchu/sanpham")
//	public String sanPham(Model model) {
//		Product product = new Product();
//		model.addAttribute("product",product);
//		List<Product> item = daoProduct.findAll();
//		model.addAttribute("itemProduct", item);
//		return "viewSanPham/sanPham";
//	}
//	@RequestMapping("/sanpham")
//	public String paginate(Model model, @RequestParam("p") Optional<Integer> p) {
//		Pageable pageable = PageRequest.of(p.orElse(0), 9);
//		{
//			// Pageable pageable = PageRequest.of(2, 5);
//			Page<Product> page = daoProduct.findAll(pageable);
//			model.addAttribute("page", page);
//			return "viewSanPham/sanPham";
//		}
//	}
//	
//	@PostMapping("/sanpham")
//	public String LocSanPham(Model model, @RequestParam("min") Optional<Float> min,
//			@RequestParam("max") Optional<Float> max) {
//		float minPrice = min.orElse(Float.MIN_VALUE);
//		float maxPrice = max.orElse(Float.MAX_VALUE);
//		List<Product> items = daoProduct.findByunitPriceBetween(minPrice, maxPrice);
//		model.addAttribute("itemSearch", items);
//      
//		return "ridirect:/sanpham";
//	}
	@RequestMapping(value = "/sanpham", method = { RequestMethod.GET, RequestMethod.POST })
	public String paginateAndFilter(Model model, @RequestParam("p") Optional<Integer> p,
			@RequestParam("min") Optional<Float> min, @RequestParam("max") Optional<Float> max,
			@RequestParam("keywords") Optional<String> keywords) {
		Pageable pageable = PageRequest.of(p.orElse(0), 9);
		Page<Product> items = Page.empty(); // tạo trang rỗng

		// kiểm tra tìm kiếm banefg từ khóa
		if (keywords.isPresent() && !keywords.get().isEmpty()) {
			String keyword = "%" + keywords.get() + "%";
			items = daoProduct.findAllByNameLike(keyword, pageable);
			model.addAttribute("keywords", keywords.get());
		}
		// kiểm tra khoảng giá
		else if (min.isPresent() || max.isPresent()) {
			float minPrice = min.orElse(Float.MIN_VALUE);
			float maxPrice = max.orElse(Float.MAX_VALUE);
			items = daoProduct.findByunitPriceBetween(minPrice, maxPrice, pageable);
		}
		// khi không có từ khóa và khoảng giá
		else {
			items = daoProduct.findAll(pageable);
			model.addAttribute("page", items);
		}
		// nếu không có sản phẩm tìm kiếm thì trả về
		if (items.isEmpty()) {
			items = daoProduct.findAll(pageable);
			model.addAttribute("page", items);

		}
		model.addAttribute("page", items);
		return "viewSanPham/sanPham";
	}

}
