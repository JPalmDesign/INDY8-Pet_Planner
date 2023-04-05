package com.indy8.petplanner.domain;

import java.time.LocalDate; // import the LocalDate class
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

import jakarta.persistence.*;

@Entity
public class Pet {
    @Id
    @GeneratedValue(strategy= GenerationType.AUTO)
    private Integer id;                  //Auto generate unique identifier
    private String name;
    private String animalType;          //Need UI to code the list of types as a drop down list
        // Dog, Cat, Rabbit, Ferret ???
    private String breed;
    private String color;
    private String weight;
    private String playgroup;
    private LocalDate dateOfBirth;           // Need to convert to useable date.

    @OneToMany(cascade = CascadeType.ALL, orphanRemoval = true, mappedBy = "pet")
    private List<Appointment> appointments = new ArrayList<>();

    @ManyToOne
    private Client client;

    public Pet() { }
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAnimalType() {
        return animalType;
    }

    public void setAnimalType(String animalType) {
        this.animalType = animalType;
    }

    public String getBreed() {
        return breed;
    }

    public void setBreed(String breed) {
        this.breed = breed;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public String getWeight() {
        return weight;
    }

    public void setWeight(String weight) {
        this.weight = weight;
    }

    public String getPlaygroup() {
        return playgroup;
    }

    public void setPlaygroup(String playgroup) {
        this.playgroup = playgroup;
    }

    public LocalDate getDateOfBirth() {
        return dateOfBirth;
    }

    public void setDateOfBirth(LocalDate dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }

    public Client getClient() {
        return client;
    }

    public void setClient(Client client) {
        this.client = client;
    }

    public void addAppointment(Appointment appointment) {
        appointments.add(appointment);
        appointment.setPet(this);
    }

    public void removePet(Appointment appointment) {
        appointments.remove(appointment);
        appointment.setPet(null);
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        Pet pet = (Pet) o;
        return Objects.equals(id, pet.getId());
    }

    @Override
    public int hashCode() {
        return Objects.hash(id);
    }
}
