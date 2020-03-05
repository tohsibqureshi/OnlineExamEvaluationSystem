package com.arc.repository;

import org.springframework.data.repository.CrudRepository;

import com.arc.model.Feedbackinfo;

public interface FeedbackRepository extends CrudRepository<Feedbackinfo, Integer> {

}
