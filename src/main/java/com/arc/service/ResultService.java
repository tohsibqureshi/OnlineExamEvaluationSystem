package com.arc.service;

import java.util.ArrayList;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.arc.model.Result;
import com.arc.model.Testinfo;
import com.arc.repository.ResultRepository;
import com.google.gson.Gson;

@Service
public class ResultService {
	@Autowired
	ResultRepository resultRepository;
	public void addresultDetails(String jsonobj,int sId) throws ParseException {
		Gson g = new Gson();
//		JSONArray jsonArray = new JSONArray(jsonobj);
		JSONParser parser = new JSONParser();
		JSONArray array = (JSONArray) parser.parse(jsonobj);
		// System.out.println("hello"+array);
		for (int i = 0; i < array.size(); i++) {
			JSONObject objects = (JSONObject) array.get(i);
			String str = g.toJson(objects);
			//UploadQuestions que = g.fromJson(str, UploadQuestions.class);
			Result res = g.fromJson(str, Result.class);
			// System.out.println("obj" + que.getAnswer());
			res.setStudentId(sId);
			resultRepository.save(res);

		}
	   }
		
	
	public List<Result> getResult(int testId) {
		List<Result> result = new ArrayList<Result>();
		for (Result record : list()) {
			if (record.getTestId() == testId) {

				result.add(record);

			}
		}
		return result;
	
    }
	public List<Result> list() {

		List<Result> result = new ArrayList<Result>();
		resultRepository.findAll().forEach(result::add);
		return result;

	}
}
