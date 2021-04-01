package com.lanmedics.lanmedics.modal;

import com.lanmedics.lanmedics.patient.modal.Patient;
import com.lanmedics.lanmedics.staff.modal.Doctor;
import com.lanmedics.lanmedics.utils.DateUtils;

import java.util.ArrayList;

public class Appointment {
	private int id;
	private Doctor doctor;
	private Patient patient;
	private int isClosed;
	private long preferredDate;
	private long allocatedDate;
	private long dateCreated;
	private ArrayList<AppointmentItems> items;
	private String symptoms;
	private String disease;
	private String title;
	
	public Appointment(int id, Doctor doctor, Patient patient, int isClosed, long preferredDate, long allocatedDate,
			long dateCreated, ArrayList<AppointmentItems> items, String symptoms, String disease, String title) {
		this.id = id;
		this.doctor = doctor;
		this.patient = patient;
		this.isClosed = isClosed;
		this.preferredDate = preferredDate;
		this.allocatedDate = allocatedDate;
		this.dateCreated = dateCreated;
		this.items = items;
		this.symptoms = symptoms;
		this.disease = disease;
		this.title = title;
	}
	
	

	public Appointment(Doctor doctor, Patient patient, int isClosed, long preferredDate, long allocatedDate,
			long dateCreated, ArrayList<AppointmentItems> items, String symptoms, String disease, String title) {
		this.doctor = doctor;
		this.patient = patient;
		this.isClosed = isClosed;
		this.preferredDate = preferredDate;
		this.allocatedDate = allocatedDate;
		this.dateCreated = dateCreated;
		this.items = items;
		this.symptoms = symptoms;
		this.disease = disease;
		this.title = title;
	}



	public Appointment(int id, Doctor doctor, int isClosed, long dateCreated, ArrayList<AppointmentItems> items) {
		this.id = id;
		this.doctor= doctor;
		this.isClosed = isClosed;
		this.dateCreated = dateCreated;
		this.items = items;
	}

	public Appointment(Patient patient, String symptoms, String disease, long preferredDate, String title) {
		this.setPatient(patient);
		this.setIsClosed(0);
		this.setDateCreated(System.currentTimeMillis());
		this.setSymptoms(symptoms);
		this.setDisease(disease);
		this.preferredDate = preferredDate;
		this.title = title;
	}

	public Appointment(int id, Doctor doctor, String title, long dateCreated, Patient patient, String disease) {
		this.id=id;
		this.doctor= doctor;
		this.title=title;
		this.dateCreated = dateCreated;
		this.patient=patient;
		this.disease = disease;
	}

	public Appointment(int id, Doctor doctor, String title, long dateCreated, String symptoms,
			String disease, Patient patient, long allocatedDate, long preferredDate, int isClosed) {
		this.id=id;
		this.doctor= doctor;
		this.title=title;
		this.dateCreated = dateCreated;
		this.symptoms=symptoms;
		this.disease =disease;
		this.patient = patient;
		this.allocatedDate =allocatedDate;
		this.preferredDate = preferredDate;
		this.isClosed=isClosed;
	}

	public int getId() {
		return id;
	}

	public Patient getPatient() {
		return patient;
	}

	public void setPatient(Patient patient) {
		this.patient = patient;
	}

	public String getSymptoms() {
		return symptoms;
	}

	public void setSymptoms(String symptoms) {
		this.symptoms = symptoms;
	}

	public String getDisease() {
		return disease;
	}

	public void setDisease(String disease) {
		this.disease = disease;
	}

	public String getStringPreferredDate() {
		return DateUtils.getStringFromDate(preferredDate);
	}
	
	public long getPreferredDate() {
		return preferredDate;
	}

	public void setPreferredDate(long preferredDate) {
		this.preferredDate = preferredDate;
	}

	public String getStringAllocatedDate() {
		return DateUtils.getDateTtimeSringFromDate(allocatedDate);
	}
	
	public long getAllocatedDate() {
		return allocatedDate;
	}

	public void setAllocatedDate(long allocatedDate) {
		this.allocatedDate = allocatedDate;
	}

	public ArrayList<AppointmentItems> getItems() {
		return items;
	}

	public void setItems(ArrayList<AppointmentItems> items) {
		this.items = items;
	}

	
	public String getStringDateCreated() {
		return DateUtils.getDateTtimeSringFromDate(dateCreated);
	}

	public void setDateCreated(long dateCreated) {
		this.dateCreated = dateCreated;
	}

	public int getIsClosed() {
		return isClosed;
	}

	public void setIsClosed(int isClosed) {
		this.isClosed = isClosed;
	}

	public Doctor getDoctor() {
		return doctor;
	}

	public void setDoctor(Doctor doctor) {
		this.doctor = doctor;
	}

	 
	public String getTitle() {
		return title;
	}

 
	public void setTitle(String title) {
		this.title = title;
	}
}
