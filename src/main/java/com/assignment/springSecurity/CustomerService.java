package com.assignment.springSecurity;

import com.assignment.dao.CustomerDAO;
import com.assignment.entity.Customer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.PostMapping;

@Service
public class CustomerService {

    @Autowired
    private CustomerDAO customerRepository;

    @Autowired
    private PasswordEncoder passwordEncoder;


    public void saveCustomer(Customer customer) {
        customer.setPassword(passwordEncoder.encode(customer.getPassword()));
        System.out.println("chạy tới đây 1");
        customerRepository.save(customer);
    }
}
