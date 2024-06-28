package com.assignment.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.assignment.entity.*;

public interface CategoryDAO extends JpaRepository<Category, Integer> {

}
