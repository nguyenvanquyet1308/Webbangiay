package com.assignment.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.assignment.dao.CategoryDAO;
import com.assignment.entity.Category;

import jakarta.validation.Valid;

@Controller

public class QLCategory {
	@Autowired
	CategoryDAO daoCategory;

	@RequestMapping("/admin/category/index")
	public String index(Model model) {
       
		

		Category category = new Category();
		model.addAttribute("itemCategory", category);
		List<Category> items = daoCategory.findAll();
		model.addAttribute("itemCategorys", items);

		return "/viewAdmin/QLCategory";

	}

	@RequestMapping("/admin/category/edit/{id}")
	public String edit(Model model, @PathVariable("id") Integer id) {
		Category item = daoCategory.findById(id).get();
		model.addAttribute("itemCategory", item);
		List<Category> items = daoCategory.findAll();
		model.addAttribute("itemCategorys", items);
		return "/viewAdmin/QLCategory";
	}

	@RequestMapping("/admin/category/create")
	public String create(@Valid @ModelAttribute("itemCategory") Category item , BindingResult result ,Model model) {
        if(result.hasErrors()) {
        	List<Category> items = daoCategory.findAll();
    		model.addAttribute("itemCategorys", items);
        	return "/viewAdmin/QLCategory";
        }	
     
		daoCategory.save(item);
		return "redirect:/admin/category/index";
	}

	@RequestMapping("/admin/category/update")
	public String update(@Valid @ModelAttribute("itemCategory") Category item , BindingResult result , Model model) {
		if(result.hasErrors()) {
        	List<Category> items = daoCategory.findAll();
    		model.addAttribute("itemCategorys", items);
        	return "/viewAdmin/QLCategory";
        }		
		
		daoCategory.save(item);
		return "redirect:/admin/category/edit/" + item.getCategoryId();
	}

	@RequestMapping("/admin/category/delete/{categoryId}")
	public String create(@PathVariable("categoryId") Integer categoryId) {
		daoCategory.deleteById(categoryId);
		return "redirect:/admin/category/index";
	}
	 
}
