package com.thierved.customerandordersystem.repositories;

import com.thierved.customerandordersystem.models.Order;
import org.springframework.data.jpa.repository.JpaRepository;

public interface OrderRepository extends JpaRepository<Order, Integer> {
}
