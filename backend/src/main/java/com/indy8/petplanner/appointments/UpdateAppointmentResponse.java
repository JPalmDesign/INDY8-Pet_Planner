package com.indy8.petplanner.appointments;

import java.math.BigDecimal;
import java.time.LocalDateTime;

public class UpdateAppointmentResponse {
    private Integer id;
    private Integer petId;
    private LocalDateTime startDateTime;
    private LocalDateTime endDateTime;
    private String appointmentType;
    private BigDecimal costPerUnit;

    public UpdateAppointmentResponse(Integer id, Integer petId, LocalDateTime startDateTime, LocalDateTime endDateTime, String appointmentType, BigDecimal costPerUnit) {
        this.id = id;
        this.petId = petId;
        this.startDateTime = startDateTime;
        this.endDateTime = endDateTime;
        this.appointmentType = appointmentType;
        this.costPerUnit = costPerUnit;
    }

    public UpdateAppointmentResponse() {
    }

    public Integer getId() {
        return id;
    }

    public Integer getPetId() {
        return petId;
    }

    public LocalDateTime getStartDateTime() {
        return startDateTime;
    }

    public LocalDateTime getEndDateTime() {
        return endDateTime;
    }

    public String getAppointmentType() {
        return appointmentType;
    }

    public BigDecimal getCostPerUnit() {
        return costPerUnit;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public void setPetId(Integer petId) {
        this.petId = petId;
    }

    public void setStartDateTime(LocalDateTime startDateTime) {
        this.startDateTime = startDateTime;
    }

    public void setEndDateTime(LocalDateTime endDateTime) {
        this.endDateTime = endDateTime;
    }

    public void setAppointmentType(String appointmentType) {
        this.appointmentType = appointmentType;
    }

    public void setCostPerUnit(BigDecimal costPerUnit) {
        this.costPerUnit = costPerUnit;
    }
}
