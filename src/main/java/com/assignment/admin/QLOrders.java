package com.assignment.admin;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.assignment.dao.OrderDetailDAO;
import com.assignment.dao.OrdersDAO;
import com.assignment.entity.OrderDetail;
import com.assignment.entity.Orders;

import jakarta.websocket.server.PathParam;

@Controller
public class QLOrders {

	@Autowired
	OrdersDAO daoOrders;
	@Autowired
	OrderDetailDAO daoOrderDetail;

	@RequestMapping("/admin/QLOrders")
	public String index(Model model) {

		List<Orders> item = daoOrders.findAll();
		model.addAttribute("itemOrders", item);

		return "viewAdmin/QLOrders";
	}

	@RequestMapping("/admin/xacnhan/{orderId}")
	public String xacNhan(@PathVariable("orderId") Integer orderId, Model model) {

		Optional<Orders> optionalOrder = daoOrders.findById(orderId);

		Orders order = optionalOrder.get();
		// Cập nhật trạng thái của đơn hàng
		order.setStatus(true);
		daoOrders.save(order);

		List<Orders> item = daoOrders.findAll();
		model.addAttribute("itemOrders", item);
		return "redirect:/admin/QLOrders";
	}

	@RequestMapping("/admin/xoa/{orderId}")
	public String xoaDonHang(@PathVariable("orderId") Integer orderId, Model model) {
		Optional<Orders> optionalOrder = daoOrders.findById(orderId);

		if (optionalOrder.isPresent()) {
			Orders order = optionalOrder.get();
			List<OrderDetail> orderDetails = order.getOrderDetails();

			// Xóa từng chi tiết đơn hàng
			for (OrderDetail detail : orderDetails) {
				daoOrderDetail.delete(detail);
			}

			// Xóa đơn hàng
			daoOrders.delete(order);
		} else {
			// Xử lý lỗi nếu đơn hàng không tồn tại
			return "redirect:/error";
		}

		List<Orders> items = daoOrders.findAll();
		model.addAttribute("itemOrders", items);

		return "redirect:/admin/QLOrders";
	}

}
