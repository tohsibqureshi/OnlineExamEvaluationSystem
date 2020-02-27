package com.arc.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.arc.model.Testinfo;
import com.arc.model.User;
import com.arc.repository.TestRepository;

@Service
public class TestService {
	@Autowired
	TestRepository testRepository;

	public void addTest(Testinfo info) {

		testRepository.save(info);
	}

	public List<Testinfo> getList(Long fid) {
		List<Testinfo> test = new ArrayList<Testinfo>();
		for (Testinfo record : list()) {
			if (record.getF_id() == fid) {
				
				test.add(record);
				
			}
		}

		return test;

	}

	public List<Testinfo> list() {

		List<Testinfo> test = new ArrayList<Testinfo>();
		testRepository.findAll().forEach(test::add);
		return test;

	}

}
