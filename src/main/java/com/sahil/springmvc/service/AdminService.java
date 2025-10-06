package com.sahil.springmvc.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sahil.springmvc.pojo.Admin;
import com.sahil.springmvc.repository.AdminRepo;
@Service
public class AdminService {
@Autowired
AdminRepo repo;
	public Admin registrationAdmin(String username, String password) {
	
		Admin admin=repo.registerAdmin(username,password);
		
		return admin;
	}

}
