package com.arc.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.arc.model.Student;
import com.arc.repository.StudentRepository;

@Service
public class StudentService {
	@Autowired
	StudentRepository studentRepository;

	public void addStudentDetails(Student student) {
		studentRepository.save(student);
	}

	
}
