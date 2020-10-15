package com.thierved.customerandordersystem.repositories;

import com.thierved.customerandordersystem.models.Customer;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CustomerRepository extends JpaRepository<Customer, Integer> {
}
