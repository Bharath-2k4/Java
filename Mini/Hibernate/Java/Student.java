package com.rb.hibernate_major;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "Student")
public class Student {
	@Id
	private int sid;
	private String name;
	private String gender;
	private String city;
	private String course;
	private float amount;

	// Parameterized constructor
	public Student(int sid, String name, String gender, String city, String course, float amount) {
		this.sid = sid;
		this.name = name;
		this.gender = gender;
		this.city = city;
		this.course = course;
		this.amount = amount;
	}

	// Zero-parameterized constructor
	public Student() {
		super();
	}

	// Getter and Setter
	public void setStudentId(int sid) {
		this.sid = sid;
	}

	public int getStudentId() {
		return sid;
	}

	public void setStudentName(String name) {
		this.name = name;
	}

	public String getStudentName() {
		return name;
	}

	public void setStudentGender(String gender) {
		this.gender = gender;
	}

	public String getStudentGender() {
		return gender;
	}

	public void setStudentCity(String city) {
		this.city = city;
	}

	public String getStudentCity() {
		return city;
	}

	public void setStudentCourse(String course) {
		this.course = course;
	}

	public String getStudentCourse() {
		return course;
	}

	public void setStudentAmount(float amount) {
		this.amount = amount;
	}

	public float getStudentAmount() {
		return amount;
	}

}
