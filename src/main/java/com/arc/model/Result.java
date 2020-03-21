package com.arc.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Result {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	long id;
	int studentId;
	int queId;
	String correctOpt;
	int testId;
	String selectedOpt;
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public int getStudentId() {
		return studentId;
	}
	public void setStudentId(int studentId) {
		this.studentId = studentId;
	}
	public int getQueId() {
		return queId;
	}
	public void setQueId(int queId) {
		this.queId = queId;
	}
	public String getCorrectOpt() {
		return correctOpt;
	}
	public void setCorrectOpt(String correctOpt) {
		this.correctOpt = correctOpt;
	}
	public int getTestId() {
		return testId;
	}
	public void setTestId(int testId) {
		this.testId = testId;
	}
	public String getSelectedOpt() {
		return selectedOpt;
	}
	public void setSelectedOpt(String selectedOpt) {
		this.selectedOpt = selectedOpt;
	}
	

}
