package com.indy8.petplanner.domain;

import jakarta.persistence.*;

import java.time.LocalDateTime;

@Entity
public class Document {
    @Id
    @GeneratedValue(strategy= GenerationType.AUTO)
    private Integer id;                     //Auto generate unique identifier
    private String recordType;
    private LocalDateTime uploadDateTime;
    private String name;  //We are not able to implement the scan feature in time

    @ManyToOne
    private Client client;

    @ManyToOne
    private Pet pet;

    @ManyToOne
    private Appointment appointment;
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getRecordType() {
        return recordType;
    }

    public void setRecordType(String recordType) {
        this.recordType = recordType;
    }

    public LocalDateTime getUploadDateTime() {
        return uploadDateTime;
    }

    public void setUploadDateTime(LocalDateTime uploadDateTime) {
        this.uploadDateTime = uploadDateTime;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Pet getPet() {return pet;}

    public void setPet(Pet pet) {this.pet = pet;}

    public Client getClient() {return client;}

    public void setClient(Client client) {this.client = client;}

    public Appointment getAppointment() {return appointment;}

    public void setAppointment(Appointment appointment) {this.appointment = appointment;}
}
