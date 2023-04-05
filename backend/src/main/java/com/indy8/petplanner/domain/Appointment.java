package com.indy8.petplanner.domain;

import jakarta.persistence.*;

import java.math.BigDecimal;
import java.time.Duration;
import java.time.LocalDateTime;
import java.util.Objects;

@Entity
public class Appointment {
    @Id
    @GeneratedValue(strategy= GenerationType.AUTO)
    private Integer id;                  //Auto generate unique identifier
    private String appointmentType;     //enum for daycare/boarding
    private LocalDateTime startTime;
    private LocalDateTime endTime;
    private BigDecimal costPerUnit;
    @ManyToOne
    private Pet pet;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getAppointmentType() {
        return appointmentType;
    }

    public void setAppointmentType(String appointmentType) {
        this.appointmentType = appointmentType;
    }

    public LocalDateTime getStartTime() {
        return startTime;
    }

    public void setStartTime(LocalDateTime startTime) {
        this.startTime = startTime;
    }

    public LocalDateTime getEndTime() {
        return endTime;
    }

    public void setEndTime(LocalDateTime endTime) {
        this.endTime = endTime;
    }

    public BigDecimal getCostPerUnit() {
        return costPerUnit;
    }

    public void setCostPerUnit(BigDecimal costPerUnit) {
        this.costPerUnit = costPerUnit;
    }

    public BigDecimal totalCost() {
        var duration = Duration.between(this.startTime, this.endTime);
        var hours = duration.toHours();

        var roundUp = new BigDecimal(Math.ceil(hours));
        return this.costPerUnit.multiply(roundUp);
    }




    @Override
    public int hashCode() {
        return Objects.hash(id);
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }

        Appointment appointment = (Appointment) o;
        return Objects.equals(id, appointment.getId());
    }

    public Pet getPet() {
        return pet;
    }

    public void setPet(Pet pet) {
        this.pet = pet;
    }
}
