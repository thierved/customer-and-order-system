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

    @GetMapping("/customer/delete")
    public String removeCustomer(@RequestParam("customerId") int customerId) {
        Customer customerToRemove = customerRepository.getOne(customerId);
        customerRepository.delete(customerToRemove);
        return "redirect:/customers";
    }

    @GetMapping("/update-customer")
    public String updateCustomer(@RequestParam("customerId") int customerId,
                                 @ModelAttribute("customer") Customer customer,
                                 Model model) {
        model.addAttribute("customer", customerRepository.getOne(customerId));
        return "update-customer-form";
    }

    @PostMapping("/update-customer")
    public String updateCustomer(@ModelAttribute("customer") Customer customer) {

        Customer customerToUpdate = customerRepository.getOne(customer.getId());
        customerToUpdate.setFirstName(customer.getFirstName());
        customerToUpdate.setLastName(customer.getLastName());
        customerToUpdate.setGender(customer.getGender());
        customerRepository.save(customerToUpdate);
        return "redirect:/customers";
    }

}
