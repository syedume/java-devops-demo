package com.example.devops.service;

import com.example.devops.model.Employee;
import com.example.devops.repository.EmployeeRepository;

import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EmployeeService {


    private final EmployeeRepository repository;


    public EmployeeService(EmployeeRepository repository) {
        this.repository = repository;
    }


    public List<Employee> getEmployees() {

        return repository.findAll();

    }


    public Employee getEmployee(int id) {

        return repository.findById(id);

    }


    public Employee addEmployee(Employee employee) {

        return repository.save(employee);

    }


    public void deleteEmployee(int id) {

        repository.delete(id);

    }

}