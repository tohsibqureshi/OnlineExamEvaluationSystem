package com.arc.repository;

import org.springframework.data.repository.CrudRepository;

import com.arc.model.StudentLogin;

public interface StudentLoginRepository extends CrudRepository<StudentLogin, Long> {

}
