package com.thierved.customerandordersystem.repositories;

import com.thierved.customerandordersystem.models.Customer;
import com.thierved.customerandordersystem.models.Order;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface OrderRepository extends JpaRepository<Order, Integer> {
    Order findById(int id);
}
