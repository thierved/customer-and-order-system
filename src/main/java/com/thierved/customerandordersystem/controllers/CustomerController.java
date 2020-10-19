package com.thierved.customerandordersystem.controllers;

import com.thierved.customerandordersystem.models.Customer;
import com.thierved.customerandordersystem.models.Order;
import com.thierved.customerandordersystem.repositories.CustomerRepository;
import com.thierved.customerandordersystem.repositories.OrderRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
//        Customer customer = new Customer("Male", "Sadu", "Diallo");
//        Customer customer1 = new Customer("Female", "Wuan", "Sun");
//        Order order = new Order("iPhone 12", 3);
//        Order order1 = new Order("iMac", 2);
//        Order order2 = new Order("iPad", 4);
//
//        order.setCustomer(customer);
//        customer.addOrder(order);
//
//        order1.setCustomer(customer);
//        customer.addOrder(order1);
//
//        order2.setCustomer(customer1);
//        customer1.addOrder(order2);
//
//        customerRepository.saveAndFlush(customer);
//        customerRepository.saveAndFlush(customer1);
        model.addAttribute("customers", customerRepository.findAll());
        return "customer_list";
    }

    @PostMapping("/customers")
    public String postCustomers(@RequestParam("firstName") String fName,
                               @RequestParam("lastName") String lName,
                               @RequestParam("gender") String gender) {
        System.out.println(fName + " " + lName + " " + gender);

        Customer customer = new Customer(gender, fName, lName);

        customerRepository.saveAndFlush(customer);

        return "redirect:/customers";
    }

    @GetMapping("/orders")
    public String getOrders(Model model) {
        model.addAttribute("orders", customerRepository.getOne(1).getOrders());
        return "order_list";
    }
}
