package com.sahil.springmvc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sahil.springmvc.pojo.Employee;
import com.sahil.springmvc.repository.EmployeeRepository;



@Service
public class EmployeeService {
@Autowired
private EmployeeRepository employeeRepository;
	
	public void addEmployee(String name, String email, long contact, String designation, double salary) {
		
		employeeRepository.addEmployee(name,email,contact,designation,salary);
	}

	public Employee search(int id) {
		Employee emp=employeeRepository.searchEmployee(id);
		return emp;
	}

	public Employee remove(int id) {
		Employee emp =employeeRepository.removeEmployee(id);
		return emp;
	}

	public List<Employee> getAllEmployees() {
		List<Employee> employees =employeeRepository.getAllEmployees();
		return employees;
	}

	public Employee update(int id, String name, String email, long contact, String designation, double salary) {
		Employee emp=employeeRepository.searchEmployee(id);
		if (emp!=null) {
			emp.setId(id);
			emp.setName(name);
			emp.setEmail(email);
			emp.setContact(contact);
			emp.setDesignation(designation);
			emp.setSalary(salary);
			
			return employeeRepository.updateEmployee(emp);
		}
		return  null;
	}

}
