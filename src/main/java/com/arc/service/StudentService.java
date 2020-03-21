package com.arc.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.arc.model.Student;
import com.arc.model.User;
import com.arc.repository.StudentRepository;

@Service
public class StudentService {
	@Autowired
	StudentRepository studentRepository;

	public void addStudentDetails(Student student) {
		studentRepository.save(student);
	}

	public List<Student> list() {

		List<Student> user = new ArrayList<>();
		studentRepository.findAll().forEach(user::add);
		return user;
	}

	public void updateMarks(long sId, int marks) {
		Student student = getStudentById(sId);
		student.setMarks(marks);
		addStudentDetails(student);

	}
	
	public Student getStudentById(long sId) {
		for (Student record : list()) {
			if (record.getId()==sId) {
				return record;
			}
		}
		return null;
	}

}
