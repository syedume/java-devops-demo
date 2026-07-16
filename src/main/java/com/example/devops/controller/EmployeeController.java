package com.example.devops.controller;


import com.example.devops.model.Employee;
import com.example.devops.service.EmployeeService;

import org.springframework.web.bind.annotation.*;

import java.util.List;


@RestController
@RequestMapping("/employees")
public class EmployeeController {


    private final EmployeeService service;


    public EmployeeController(EmployeeService service) {

        this.service = service;

    }


    @GetMapping
    public List<Employee> getEmployees(){

        return service.getEmployees();

    }


    @GetMapping("/{id}")
    public Employee getEmployee(@PathVariable int id){

        return service.getEmployee(id);

    }


    @PostMapping
    public Employee addEmployee(@RequestBody Employee employee){

        return service.addEmployee(employee);

    }


    @DeleteMapping("/{id}")
    public String deleteEmployee(@PathVariable int id){

        service.deleteEmployee(id);

        return "Employee deleted successfully";

    }


    @GetMapping("/health")
    public String health(){

        return "Application is running";

    }

}