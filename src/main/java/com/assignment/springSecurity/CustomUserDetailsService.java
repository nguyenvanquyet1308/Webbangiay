package com.assignment.springSecurity;

import com.assignment.dao.CustomerDAO;
import com.assignment.entity.Customer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

@Service
public class CustomUserDetailsService implements UserDetailsService {

	@Autowired
	private CustomerDAO customerRepository;

	@Override
	public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
		System.out.println("chạy tới đây ");
		Customer customer = customerRepository.findByEmail(email);
		if (customer == null) {

			throw new UsernameNotFoundException("User not found");
		}

		return User.builder().username(customer.getEmail()).password(customer.getPassword())
				.roles(customer.isAdmin() ? "ADMIN" : "USER").build();
	}
}