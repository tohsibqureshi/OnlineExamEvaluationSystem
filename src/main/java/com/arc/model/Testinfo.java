package com.arc.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Testinfo {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	int testId;
	String testName;
	int duration;
	String cutoff;
	String expiry;
	String nQuestions;
	String correct;
	String incorrect;
	String expiryTime;
	int F_id;

	public String getExpiryTime() {
		return expiryTime;
	}

	public void setExpiryTime(String expiryTime) {
		this.expiryTime = expiryTime;
	}

	public int getTestId() {
		return testId;
	}

	public void setTestId(int testId) {
		this.testId = testId;
	}

	public String getTestName() {
		return testName;
	}

	public void setTestName(String testName) {
		this.testName = testName;
	}

	public int getDuration() {
		return duration;
	}

	public void setDuration(int duration) {
		this.duration = duration;
	}

	public String getCutoff() {
		return cutoff;
	}

	public void setCutoff(String cutoff) {
		this.cutoff = cutoff;
	}

	public String getExpiry() {
		return expiry;
	}

	public void setExpiry(String expiry) {

		this.expiry = expiry;
	}

	public String getnQuestions() {
		return nQuestions;
	}

	public void setnQuestions(String nQuestions) {
		this.nQuestions = nQuestions;
	}

	public String getCorrect() {
		return correct;
	}

	public void setCorrect(String correct) {
		this.correct = correct;
	}

	public String getIncorrect() {
		return incorrect;
	}

	public void setIncorrect(String incorrect) {
		this.incorrect = incorrect;
	}

	public int getF_id() {
		return F_id;
	}

	public void setF_id(int F_id) {
		this.F_id = F_id;
	}

}
