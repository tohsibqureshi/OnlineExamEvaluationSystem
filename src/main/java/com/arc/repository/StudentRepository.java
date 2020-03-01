package com.arc.repository;

import org.springframework.data.repository.CrudRepository;

import com.arc.model.Student;

public interface StudentRepository extends CrudRepository<Student, Long>{

}
