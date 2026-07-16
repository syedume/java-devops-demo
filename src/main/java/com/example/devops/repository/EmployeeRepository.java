package com.example.devops.repository;

import com.example.devops.model.Employee;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

@Repository
public class EmployeeRepository {

    private final List<Employee> employees = new ArrayList<>();

    public EmployeeRepository() {

        employees.add(
            new Employee(1, "John", "IT", 50000)
        );

        employees.add(
            new Employee(2, "David", "HR", 45000)
        );
    }


    public List<Employee> findAll() {
        return employees;
    }


    public Employee findById(int id) {

        return employees.stream()
                .filter(emp -> emp.getId() == id)
                .findFirst()
                .orElse(null);
    }


    public Employee save(Employee employee) {

        employees.add(employee);
        return employee;
    }


    public void delete(int id) {

        employees.removeIf(emp -> emp.getId() == id);

    }

}