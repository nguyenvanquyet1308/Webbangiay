package com.assignment.admin;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.filter.CharacterEncodingFilter;

import com.assignment.dao.CategoryDAO;
import com.assignment.dao.ProductDAO;
import com.assignment.entity.Category;
import com.assignment.entity.Customer;
import com.assignment.entity.Product;

import jakarta.validation.Valid;

@Controller
public class QLProduct {

	@Autowired
	ProductDAO daoProduct;
	@Autowired
	CategoryDAO daoCategory;

	@RequestMapping("/admin/QLProduct")
	public String index(Model model) {

		Product product = new Product();
		model.addAttribute("product", product);
		List<Product> item = daoProduct.findAll();
		model.addAttribute("itemProduct", item);

		List<Category> itemCategory = daoCategory.findAll();
		model.addAttribute("showCbxCategory", itemCategory);

		return "/viewAdmin/QLProduct";
	}

	@PostMapping("/admin/QLProduct")
	public String LocTheoLoai(@ModelAttribute("product") Product product, Model model) {

		List<Product> products;
		if (product.getCategory() != null && product.getCategory().getCategoryId() != null) {
			products = daoProduct.findByCategoryCategoryId(product.getCategory().getCategoryId());
		} else {
			products = daoProduct.findAll();
		}
		List<Category> categories = daoCategory.findAll();
		model.addAttribute("itemProduct", products);
		model.addAttribute("showCbxCategory", categories);
		return "/viewAdmin/QLProduct";
	}

	@RequestMapping("/admin/QLProduct/delete/{productId}")
	public String Delete(@PathVariable("productId") Integer productId) {
		daoProduct.deleteById(productId);

		return "redirect:/admin/QLProduct";
	}

	@RequestMapping("/admin/QLProduct/cr")
	public String Cr(Model model) {
		Product product = new Product();
		model.addAttribute("product", product);
		ShowCombobox(model);
		return "viewAdmin/createProduct";
	}

	@RequestMapping("/admin/QLProduct/create")
	public String create(@Valid @ModelAttribute("product") Product item, BindingResult result, Model model) {
		if (result.hasErrors()) {
			List<Product> items = daoProduct.findAll();
			model.addAttribute("itemProduct", items);
			return "viewAdmin/createProduct";
		}
		item.setCreateDate(new Date());
		item.setStatus(true);
		daoProduct.save(item);
		return "redirect:/admin/QLProduct";
	}

	@RequestMapping("/admin/QLProduct/edit/{productId}")
	public String EditProduct(Model model, @PathVariable("productId") Integer id) {
		Product product = daoProduct.findById(id).get();
		model.addAttribute("product", product);
		List<Product> item = daoProduct.findAll();
		ShowCombobox(model);
		model.addAttribute("itemProduct", item);

		return "viewAdmin/editProduct";
	}

	@RequestMapping("/admin/QLProduct/update")
	public String UpdateProduct(@Valid @ModelAttribute("product") Product item, BindingResult result, Model model) {

		if (result.hasErrors()) {
			List<Product> items = daoProduct.findAll();
			model.addAttribute("itemProduct", items);
			return "viewAdmin/editProduct";
		}
		daoProduct.save(item);

		return "redirect:/admin/QLProduct";
	}

	public void ShowCombobox(Model model) {
		List<Category> item = daoCategory.findAll();
		model.addAttribute("showCbxCategory", item);
	}

//	@ModelAttribute("showCbxCategory")
//	public List<Category> getCategories() {
//
//		return daoCategory.findAll();
//	}

}
