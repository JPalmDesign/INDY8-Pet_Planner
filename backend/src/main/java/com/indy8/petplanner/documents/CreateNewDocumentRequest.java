package com.indy8.petplanner.documents;

import java.time.LocalDateTime;

public class CreateNewDocumentRequest {
    private int id;
    private Integer petId;
    private Integer clientId;
    private Integer appointmentId;
    private String recordType;
    private LocalDateTime uploadDateTime;
    private String name;  //We are not able to implement the scan feature in time

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Integer getPetId() {return petId;}

    public void setPetId(Integer petId) {this.petId = petId;}

    public Integer getClientId() {return clientId;}

    public void setClientId(Integer clientId) {this.clientId = clientId;}

    public Integer getAppointmentId() {return appointmentId;}

    public void setAppointmentId(Integer appointmentId) {this.appointmentId = appointmentId;}

    public String getRecordType() {return recordType;}

    public void setRecordType(String recordType) {this.recordType = recordType;}

    public LocalDateTime getUploadDateTime() {return uploadDateTime;}

    public void setUploadDateTime(LocalDateTime uploadDateTime) {this.uploadDateTime = uploadDateTime;}

    public String getName() {return name;}

    public void setName(String name) {this.name = name;}
}
