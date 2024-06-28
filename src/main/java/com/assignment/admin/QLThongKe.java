package com.assignment.admin;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.assignment.dao.CustomerDAO;
import com.assignment.dao.OrdersDAO;
import com.assignment.entity.Customer;

@Controller
public class QLThongKe {
	@Autowired
	CustomerDAO daoCustomer;
	@Autowired
	OrdersDAO daoOrders;

	@RequestMapping("/admin/QLThongKe")
	public String index(Model model) {

		long countCustomer = daoCustomer.count();
		model.addAttribute("countCustomer", countCustomer);

		long countOrders = daoOrders.count();
		model.addAttribute("countOrders", countOrders);

		long countDaGiao = daoOrders.countByStatus(true);
		model.addAttribute("countDaGiao", countDaGiao);

		long countChuaGiao = daoOrders.countByStatus(false);
		model.addAttribute("countChuaGiao", countChuaGiao);

		return "viewAdmin/QLThongKe";
	}

	@PostMapping("/admin/QLThongKe")
	public String submit(@RequestParam("startDate") @DateTimeFormat(pattern = "yyyy-MM-dd") Date  startDate,
			@DateTimeFormat(pattern = "yyyy-MM-dd") @RequestParam("endDate") Date endDate, Model model) {

		
		if(startDate ==null || endDate ==null) {
			return "viewAdmin/QLThongKe";
		}
		
		Float sumAmount = daoOrders.sumAmountBetweenDates(startDate, endDate);
		if (startDate == null || endDate == null) {
			index(model);
			return "viewAdmin/QLThongKe";
		}
		if (sumAmount == null) {
			model.addAttribute("sumAmount", 0);
			index(model);
			return "viewAdmin/QLThongKe";
		}

		model.addAttribute("sumAmount", sumAmount);
		System.out.println(sumAmount);
		index(model);

		return "viewAdmin/QLThongKe";
	}
}
