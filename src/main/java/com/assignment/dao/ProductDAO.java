package com.assignment.dao;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;


import com.assignment.entity.*;

public interface ProductDAO extends JpaRepository<Product, Integer> {
	
	
	Page<Product> findByunitPriceBetween(float minPrice, float maxPrice, Pageable pageable);
	
    Page<Product> findAllByNameLike(String keywords, Pageable pageable);
    
    List<Product> findByCategoryCategoryId(int categoryId);

}
