package com.sahil.springmvc.repository;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;

import org.springframework.stereotype.Repository;
import com.sahil.springmvc.controller.EmployeeController;
import com.sahil.springmvc.pojo.Employee;

@Repository
public class EmployeeRepository {

	private static EntityManagerFactory factory;
	private static EntityManager manager;
	private static EntityTransaction transaction;

	public static void openConnection() {

		factory = Persistence.createEntityManagerFactory("springmvc");
		manager = factory.createEntityManager();
		transaction = manager.getTransaction();
	}

	public static void closeConnection() {
		if (factory != null) {
			factory.close();
		}
		if (manager != null) {
			manager.close();
		}
		if (transaction.isActive()) {
			transaction.rollback();
		}
	}

	public void addEmployee(String name, String email, long contact, String designation, double salary) {
		openConnection();
		transaction.begin();
		Employee emp = new Employee();
		emp.setName(name);
		emp.setEmail(email);
		emp.setContact(contact);
		emp.setDesignation(designation);
		emp.setSalary(salary);
		manager.persist(emp);
		System.out.println("Data added Succesfully");

		transaction.commit();
		closeConnection();

	}

	public Employee searchEmployee(int id) {
		openConnection();
		transaction.begin();
		Employee emp = manager.find(Employee.class, id);
		System.out.println(emp);
		transaction.commit();
		closeConnection();
		return emp;
	}

	public Employee removeEmployee(int id) {
		openConnection();
		transaction.begin();
		Employee emp = manager.find(Employee.class, id);
		if (emp != null) {
			manager.remove(emp);
			transaction.commit();
		} else {
			transaction.rollback();
		}
		closeConnection();
		return emp;
	}

	public List<Employee> getAllEmployees() {
		List<Employee> employees = null;

		try {
			openConnection(); // open Hibernate session
			transaction.begin(); // begin transaction

			// HQL query to get all Employee records
			employees = manager.createQuery("from Employee", Employee.class).getResultList();

			transaction.commit();
		} catch (Exception e) {
			e.printStackTrace();
			if (transaction != null) {
				transaction.rollback();
			}
		} finally {
			closeConnection();
		}

		return employees;
	}

	public Employee updateEmployee(Employee emp) {
		openConnection();

		transaction.begin();
		Employee updated = manager.merge(emp);
		transaction.commit();
		closeConnection();
		return updated;

	}

}
