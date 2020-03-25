package com.arc.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.arc.model.Student;
import com.arc.model.StudentLogin;
import com.arc.model.User;
import com.arc.repository.StudentLoginRepository;

@Service
public class StudentLoginService {
	@Autowired
	UserService service;
	@Autowired
	StudentLoginRepository loginRepository;

	public void addStudent(int testId, Long id) {
		StudentLogin s = new StudentLogin();
		User u = service.getUserById(id);
		s.setTestId(testId);
		s.setUserName(u.getUserName());
		s.setEmail(u.getEmail());
		s.setId(u.getUserId());
		s.setImageName(u.getImageName());
		s.setMobile(u.getMobile());
		s.setName(u.getName());
		s.setPassword(u.getPassword());

		loginRepository.save(s);

	}

	public void updateMarks(long sId, int marks, String result) {

		StudentLogin student = getStudentById(sId);
		student.setMarks(marks);
		student.setResult(result);
		loginRepository.save(student);

	}

	public List<StudentLogin> list() {

		List<StudentLogin> user = new ArrayList<>();
		loginRepository.findAll().forEach(user::add);
		return user;
	}

	public StudentLogin getStudentById(long sId) {
		for (StudentLogin record : list()) {
			if (record.getId() == sId) {
				return record;
			}
		}
		return null;
	}

}
