package com.sahil.springmvc.repository;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;

import org.springframework.stereotype.Repository;

import com.sahil.springmvc.pojo.Admin;
@Repository
public class AdminRepo {

	
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

	public Admin registerAdmin(String username, String password) {
		openConnection();
		transaction.begin();
		Admin admin = new Admin();
		admin.setUsername(username);
		admin.setPassword(password);
		manager.persist(admin);
		transaction.commit();
		closeConnection();
		
		return admin;
	}

}
