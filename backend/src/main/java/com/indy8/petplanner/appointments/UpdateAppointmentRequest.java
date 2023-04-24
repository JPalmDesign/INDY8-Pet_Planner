package com.indy8.petplanner.appointments;

import java.math.BigDecimal;
import java.time.LocalDateTime;

public class UpdateAppointmentRequest {
    private Integer petId;
    private LocalDateTime startDateTime;
    private LocalDateTime endDateTime;
    private String appointmentType;
    private BigDecimal costPerUnit;

    public UpdateAppointmentRequest(Integer petId, LocalDateTime startDateTime, LocalDateTime endDateTime, String appointmentType, BigDecimal costPerUnit) {
        this.petId = petId;
        this.startDateTime = startDateTime;
        this.endDateTime = endDateTime;
        this.appointmentType = appointmentType;
        this.costPerUnit = costPerUnit;
    }

    public UpdateAppointmentRequest() {
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

    public BigDecimal getCostPerUnit() {
        return costPerUnit;
    }

    public void setCostPerUnit(BigDecimal costPerUnit) {
        this.costPerUnit = costPerUnit;
    }
}
