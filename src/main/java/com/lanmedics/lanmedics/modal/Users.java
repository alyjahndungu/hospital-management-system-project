package com.lanmedics.lanmedics.modal;

import com.lanmedics.lanmedics.utils.DateUtils;

public class Users {

	private int id;
	private String firstName;
	private String lastName;
	private String email;
	private long dob;
	private int type;
	private String gender;
	private String address;
	private String contactNumber;
	
	

	public Users(int id, String firstName, String lastName, String email, long dob, int type, String gender,
				 String address, String contactNumber) {
	 
		this.id = id;
		this.firstName = firstName;
		this.lastName = lastName;
		this.email = email;
		this.dob = dob;
		this.type = type;
		this.gender = gender;
		this.address = address;
		this.contactNumber = contactNumber;
	}
	
	

	public Users(String firstName, String lastName, String email, long dob, int type, String gender, String address,
				 String contactNumber) {
		
		this.firstName = firstName;
		this.lastName = lastName;
		this.email = email;
		this.dob = dob;
		this.type = type;
		this.gender = gender;
		this.address = address;
		this.contactNumber = contactNumber;
	}

    public Users(int id, String firstName, String lastName) {
		this.id = id;
		this.firstName =firstName;
		this.lastName = lastName;
    }

    public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public void setDob(long dob) {
		this.dob=dob;
	}
	
	public String getStringDob() {
		return DateUtils.getStringFromDate(dob);
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getContactNumber() {
		return contactNumber;
	}

	public void setContactNumber(String contactNumber) {
		this.contactNumber = contactNumber;
	}

	public int getId() {
		return id;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getUserType() {
		return type;
	}

	public void setUserType(int userType) {
		this.type = userType;
	}

	public String getAge(){
		return String.valueOf(DateUtils.getYearsFromLong(dob)) + " years";
	}

	 
}
