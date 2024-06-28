package com.assignment.dao;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.assignment.entity.*;



public interface OrdersDAO extends JpaRepository<Orders, Integer> {
    List<Orders> findByCustomerCustomerId(Integer customerId);
    
    long countByStatus(boolean status);
    long count();
    
    @Query("SELECT SUM(o.amount) FROM Orders o WHERE o.orderDate BETWEEN :startDate AND :endDate")
    Float sumAmountBetweenDates(Date startDate, Date endDate);
}
