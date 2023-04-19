package com.indy8.petplanner.domain;

import jakarta.persistence.*;

import java.math.BigDecimal;
import java.time.Duration;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

@Entity
public class Appointment {
    @Id
    @GeneratedValue(strategy= GenerationType.AUTO)
    private Integer id;                  //Auto generate unique identifier
    private String appointmentType;     //enum for daycare/boarding
    private LocalDateTime startDateTime;
    private LocalDateTime endDateTime;
    private BigDecimal costPerUnit;
    private String name;                // Might be a compiled field of PetName, AppointmentType, StartDateTime

    @OneToMany(cascade = CascadeType.ALL, orphanRemoval = true, mappedBy = "appointment")
    private List<Document> documents = new ArrayList<>();
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

    public LocalDateTime getStartDateTime() {
        return startDateTime;
    }

    public void setStartDateTime(LocalDateTime startDateTime) {
        this.startDateTime = startDateTime;
    }

    public LocalDateTime getEndDateTime() {
        return endDateTime;
    }

    public void setEndDateTime(LocalDateTime endDateTime) {
        this.endDateTime = endDateTime;
    }

    public BigDecimal getCostPerUnit() {
        return costPerUnit;
    }

    public void setCostPerUnit(BigDecimal costPerUnit) {
        this.costPerUnit = costPerUnit;
    }

    public BigDecimal totalCost() {
        var duration = Duration.between(this.startDateTime, this.endDateTime);
        var hours = duration.toHours();

        var roundUp = new BigDecimal(Math.ceil(hours));
        return this.costPerUnit.multiply(roundUp);
    }

    public String getName() {return name;}

    public void setName(String name) {this.name = name;}

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

    public List<Document> getDocuments() {
        return documents;
    }

    public void setDocuments(List<Document> documents) {
        this.documents = documents;
    }

    public void addDocument(Document document) {
        documents.add(document);
        document.setAppointment(this);
    }

    public void removeDocument(Document document) {
        documents.remove(document);
        document.setAppointment(null);
    }
}
