package com.indy8.petplanner.pets;

import java.time.LocalDate;
import java.util.Date;

public class UpdatePetRequest {
    private String name;
    private String animalType;
    private String breed;
    private String color;
    private String weight;
    private LocalDate dateOfBirth;

    public UpdatePetRequest() {
    }

    public UpdatePetRequest(String name, String species, String breed, LocalDate dateOfBirth, String color, String weight) {
        this.name = name;
        this.animalType = species;
        this.breed = breed;
        this.dateOfBirth = dateOfBirth;
        this.color = color;
        this.weight = weight;
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

    public LocalDate getDateOfBirth() {
        return dateOfBirth;
    }

    public void setDateOfBirth(LocalDate dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }
}
