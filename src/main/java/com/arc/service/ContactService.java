package com.arc.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.arc.model.ContactUs;
import com.arc.repository.ContactRepository;

@Service
public class ContactService {
	@Autowired
	ContactRepository contactRepository;

	public void addContact(ContactUs contact) {
		contactRepository.save(contact);
	}
	

}
