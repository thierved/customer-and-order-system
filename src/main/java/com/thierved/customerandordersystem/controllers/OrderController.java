package com.thierved.customerandordersystem.controllers;

import com.thierved.customerandordersystem.models.Customer;
import com.thierved.customerandordersystem.models.Order;
import com.thierved.customerandordersystem.repositories.CustomerRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@Controller
public class OrderController {

    @Autowired
    CustomerRepository customerRepository;
    private int id;

    @GetMapping("/orders")
    public String getOrders(@RequestParam("customerId") int customerId, Model model) {
        id = customerId;
        Customer customer = customerRepository.getOne(id);
        model.addAttribute("orders", customer.getOrders());
        return "order_list";
    }

    @GetMapping("/add-order")
    public String addOrder(@ModelAttribute("order") Order order) {
        return "add-order-form";
    }

    @PostMapping("/orders")
    public String postOrder(@ModelAttribute("order") Order order, Model model) {
        Customer customer = customerRepository.getOne(id);
        order.setCustomer(customer);
        customer.addOrder(order);
        customerRepository.saveAndFlush(customer);
        return "redirect:/orders?customerId=" + id;
    }
}
