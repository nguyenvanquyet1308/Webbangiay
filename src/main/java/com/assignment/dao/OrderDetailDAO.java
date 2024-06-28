package com.assignment.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.assignment.entity.*;

public interface OrderDetailDAO extends JpaRepository<OrderDetail, Integer> {

}
