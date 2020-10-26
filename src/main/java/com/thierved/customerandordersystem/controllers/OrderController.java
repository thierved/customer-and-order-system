package com.thierved.customerandordersystem.controllers;

import com.thierved.customerandordersystem.models.Customer;
import com.thierved.customerandordersystem.models.Order;
import com.thierved.customerandordersystem.repositories.CustomerRepository;
import com.thierved.customerandordersystem.repositories.OrderRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;
import java.util.function.ObjDoubleConsumer;

@Controller
public class OrderController {

    @Autowired
    CustomerRepository customerRepository;
    OrderRepository orderRepository;
    private int id;

    @GetMapping("/orders")
    public String getOrders(@RequestParam("customerId") int customerId, Model model) {
        id = customerId;
        Customer customer = customerRepository.getOne(id);
        model.addAttribute("orders", customer.getOrders());
        model.addAttribute("customer", customer);
        return "order_list";
    }

    @GetMapping("/add-order")
    public String addOrder(@ModelAttribute("order") Order order) {
        return "add-order-form";
    }

    @PostMapping("/saveOrder")
    public String postOrder(@ModelAttribute("order") Order order) {
        Customer customer = customerRepository.getOne(id);
        order.setCustomer(customer);
        customer.addOrder(order);
        customerRepository.saveAndFlush(customer);
        return "redirect:/orders?customerId=" + id;
    }

    @GetMapping("/update-order")
    public String updateOrder(@RequestParam("orderId") int orderId,
                              @ModelAttribute("order") Order order,
                              Model model) {
        List<Order> customerOrders = customerRepository.getOne(id).getOrders();
        for (Order o: customerOrders) {
            if (o.getId() == orderId) {
                model.addAttribute("order", o);
            }
        }
        return "order-update-form";
    }

    @PostMapping("/update-order")
    public String updateOder(@ModelAttribute("order") Order order,
                             @RequestParam("id") int orderId) {
        Order orderToUpdate = orderRepository.findById(orderId);
        orderToUpdate.setProductName(order.getProductName());
        orderToUpdate.setQuantity(order.getQuantity());
        orderRepository.saveAndFlush(orderToUpdate);
        return "redirect:/orders?customerId=" + id;
    }

    @GetMapping("/delete-order")
    public String removeOrder(@RequestParam("orderId") int orderId) {
        Customer customer = customerRepository.findCustomerByOrders_id(orderId);
        for( Order order : customer.getOrders()) {
            if (order.getId() == orderId) {
                customer.removeOrder(order);
                break;
            }
        }
        customerRepository.saveAndFlush(customer);
        return "redirect:/orders?customerId=" + id;
    }




}
