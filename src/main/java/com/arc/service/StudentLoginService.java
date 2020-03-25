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
		s.setStudentId(u.getUserId());
		s.setImageName(u.getImageName());
		s.setMobile(u.getMobile());
		s.setName(u.getName());
		s.setPassword(u.getPassword());

		loginRepository.save(s);

	}

	public void updateMarks(long sId, int marks, String result,String testname) {
		StudentLogin student1 = new StudentLogin();
		StudentLogin student = getStudentById(sId);
		student1.setMarks(marks);
		student1.setResult(result);
		student1.setTestname(testname);
		student1.setEmail(student.getEmail());
		student1.setImageName(student.getImageName());
		student1.setMobile(student.getMobile());
		student1.setName(student.getName());
        student1.setPassword(student.getPassword());
        student1.setStudentId(student.getStudentId());
        student1.setTestId(student.getTestId());
		student1.setUserName(student.getUserName());
		
		loginRepository.save(student1);

	}

	public List<StudentLogin> list() {

		List<StudentLogin> user = new ArrayList<>();
		loginRepository.findAll().forEach(user::add);
		return user;
	}

	public StudentLogin getStudentById(long sId) {
		for (StudentLogin record : list()) {
			if (record.getStudentId() == sId) {
				return record;
			}
		}
		return null;
	}

	public List<StudentLogin> getTestDetails(long  userid) {
		List<StudentLogin> test = new ArrayList<StudentLogin>();
		for (StudentLogin record : list()) {
			if (record.getStudentId()==userid) {

				test.add(record);
                
			}
		}

		return test;
	}


}
