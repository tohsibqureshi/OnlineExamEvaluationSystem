package com.arc.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;

import com.arc.model.Testinfo;
import com.arc.model.User;
import com.arc.repository.UserRepository;

@Service
public class UserService {
	@Autowired
UserRepository userRepository;
	//@Autowired
//	private PasswordEncoder passwordEncoder;
	
	public void addRecord(User user) {
		//User u= new User();
		//user.setPassword(passwordEncoder.encode(user.getPassword()));
		
		userRepository.save(user);
		
	}
	public String getEmail(String email) {
		User u=getUser(email);
		if(u!=null)
			return u.getEmail();
		else
			return null;
		
	}
	public User getUser(String email) {

		for (User record : list()) {
			if (record.getEmail().equals(email)) {
				return record;
			}
		}

		return null;
	}
	public List<User> list() {
		
		List<User> user = new ArrayList<User>();
		userRepository.findAll().forEach(user::add);
		return user;
	}
	public String getPassword(String email) {
		User u=getUser(email);
		if(u!=null)
			return u.getPassword();
		else
			return null;
	}
//	public void setLogin(String email) {
//		User u=getUser(email);
//		u.setLn(1);
//		userRepository.save(u);
//		
//	}
	
	public String getName(String email) {
		User u=getUser(email);
		
		if(u!=null)
			return u.getName();
		else
			return null;
	}
//	public void setLogout() {
//		for (User record : list()) {
//			record.setLn(0);
//			userRepository.save(record);
//		}
		
//	}
	public String getRole(String email) {
		User user = getUser(email);
		
		
		if(user!=null)
			return user.getRoles();
		else
			return null;
	}
	

	

	
}
