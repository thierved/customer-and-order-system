package com.thierved.customerandordersystem.controllers;

import com.thierved.customerandordersystem.models.Customer;
import com.thierved.customerandordersystem.models.Order;
import com.thierved.customerandordersystem.repositories.CustomerRepository;
import com.thierved.customerandordersystem.repositories.OrderRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class CustomerController {

    @Autowired
    CustomerRepository customerRepository;
    OrderRepository orderRepository;

    @GetMapping("/add_customer")
    public String addCustomer(@ModelAttribute("customer") Customer customer) {

        return "add-customer-form";
    }

    @GetMapping("/customers")
    public String getCustomers(Model model) {
        model.addAttribute("customers", customerRepository.findAll());
        return "customer_list";
    }

    @PostMapping("/customers")
    public String postCustomers(@RequestParam("firstName") String fName,
                               @RequestParam("lastName") String lName,
                               @RequestParam("gender") String gender) {

        Customer customer = new Customer(gender, fName, lName);

        customerRepository.saveAndFlush(customer);

        return "redirect:/customers";
    }



}
