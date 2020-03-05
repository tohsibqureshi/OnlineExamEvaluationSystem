package com.arc.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.arc.model.Feedbackinfo;
import com.arc.repository.FeedbackRepository;
@Service
public class FeedbackService {
	@Autowired
	FeedbackRepository feedbackRepository;
	public void addRecord(Feedbackinfo feedbackinfo) {
		
		feedbackRepository.save(feedbackinfo);
		
	}

}
