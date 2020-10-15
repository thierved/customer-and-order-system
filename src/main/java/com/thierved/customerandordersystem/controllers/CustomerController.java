package com.thierved.customerandordersystem.controllers;

import com.thierved.customerandordersystem.repositories.CustomerRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CustomerController {
    @Autowired
    CustomerRepository repository;

    @GetMapping("/customers")
    public String getCustomers(Model model) {
        model.addAttribute("customers", repository.findAll());
        return "customer_list";
    }
}
