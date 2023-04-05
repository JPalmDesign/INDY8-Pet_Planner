package com.indy8.petplanner.pets;

import java.time.LocalDate;
import java.util.Objects;

public  class PetByIdResponse {
    private Integer id;
    private int clientId;
    private String name;
    private String animalType;
    private String breed;
    private String color;
    private String weight;
    private String playgroup;
    private LocalDate dateOfBirth;

    public PetByIdResponse() {
        
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public int getClientId() {
        return clientId;
    }

    public void setClientId(int clientId) {
        this.clientId = clientId;
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
}
