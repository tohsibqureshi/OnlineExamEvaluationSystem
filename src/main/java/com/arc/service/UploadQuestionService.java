package com.arc.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.arc.model.Testinfo;
import com.arc.model.UploadQuestions;
import com.arc.repository.UploadQuestionRepository;
import com.google.gson.Gson;

@Service
public class UploadQuestionService {
	@Autowired

	UploadQuestionRepository uploadQuestionRepository;

	public void addQuestion(String jsonobj, int testId) throws ParseException {
		Gson g = new Gson();
//		JSONArray jsonArray = new JSONArray(jsonobj);
		JSONParser parser = new JSONParser();
		JSONArray array = (JSONArray) parser.parse(jsonobj);
		// System.out.println("hello"+array);
		for (int i = 0; i < array.size(); i++) {
			JSONObject objects = (JSONObject) array.get(i);
			String str = g.toJson(objects);
			UploadQuestions que = g.fromJson(str, UploadQuestions.class);
			// System.out.println("obj" + que.getAnswer());
			que.setTestId(testId);
			uploadQuestionRepository.save(que);

		}

	}

	public void updateQue(UploadQuestions que) {

		uploadQuestionRepository.save(que);

	}

	public List<UploadQuestions> getList(int testId) {

		List<UploadQuestions> test = new ArrayList<>();
		for (UploadQuestions record : list()) {
			if (record.getTestId() == testId) {

				test.add(record);

			}
		}

		return test;
	}

	public List<UploadQuestions> list() {

		List<UploadQuestions> que = new ArrayList<>();
		uploadQuestionRepository.findAll().forEach(que::add);
		return que;

	}

	public UploadQuestions getQuestion(int id) {
		for (UploadQuestions record : list()) {
			if (record.getQueId() == id) {

				return record;

			}
		}
		return null;
	}

}
