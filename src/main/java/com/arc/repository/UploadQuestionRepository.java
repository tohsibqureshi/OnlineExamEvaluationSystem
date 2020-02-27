package com.arc.repository;

import org.springframework.data.repository.CrudRepository;

import com.arc.model.UploadQuestions;

public interface UploadQuestionRepository extends CrudRepository<UploadQuestions, Integer> {

}
