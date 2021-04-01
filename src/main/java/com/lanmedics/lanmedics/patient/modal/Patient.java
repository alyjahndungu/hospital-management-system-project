package com.lanmedics.lanmedics.patient.modal;


import com.lanmedics.lanmedics.modal.Users;

public class Patient extends Users {

	private int height;
	private int weight;
	private String bloodGroup;
	
	public Patient(int id, String firstName, String lastName, String email, long dob, int type, String gender,
			String address, String contactNumber, int weight, int height, String bloodGroup) {
		super(id, firstName, lastName, email, dob, type, gender, address, contactNumber);
		this.height = height;
		this.weight = weight;
		this.bloodGroup = bloodGroup;
	}
	
	

	public Patient(String firstName, String lastName, String email, long dob, int type, String gender,
			String address, String contactNumber, int height, int weight, String bloodGroup) {
		super(firstName, lastName, email, dob, type, gender, address, contactNumber);
		this.height = height;
		this.weight = weight;
		this.bloodGroup = bloodGroup;
	}



	public String getBloodGroup() {
		return bloodGroup;
	}

	public void setBloodGroup(String bloodGroup) {
		this.bloodGroup = bloodGroup;
	}

	public int getHeight() {
		return height;
	}

	public void setHeight(int height) {
		this.height = height;
	}

	public int getWeight() {
		return weight;
	}

	public void setWeight(int weight) {
		this.weight = weight;
	}
}
