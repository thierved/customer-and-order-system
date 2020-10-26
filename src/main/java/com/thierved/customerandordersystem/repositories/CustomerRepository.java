package com.thierved.customerandordersystem.repositories;

import com.thierved.customerandordersystem.models.Customer;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface CustomerRepository extends JpaRepository<Customer, Integer> {
    Customer findCustomerByOrders_id(int orderId);
}
