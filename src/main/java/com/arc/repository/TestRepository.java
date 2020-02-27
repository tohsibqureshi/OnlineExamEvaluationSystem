package com.arc.repository;

import org.springframework.data.repository.CrudRepository;

import com.arc.model.Testinfo;

public interface TestRepository extends CrudRepository<Testinfo, Integer> {

}
