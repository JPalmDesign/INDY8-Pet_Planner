package com.indy8.petplanner.pets;

import com.indy8.petplanner.domain.Pet;

import java.time.LocalDate;

public class UpdatePetResponse {
    private Integer id;
    private String name;
    private String animalType;
    private String breed;
    private String color;
    private String weight;
    private LocalDate dateOfBirth;

    public UpdatePetResponse() {
    }

    public UpdatePetResponse(Integer id, String name, String animalType, String breed, String color, String weight, LocalDate dateOfBirth) {
        this.id = id;
        this.name = name;
        this.animalType = animalType;
        this.breed = breed;
        this.color = color;
        this.weight = weight;
        this.dateOfBirth = dateOfBirth;
    }

    public UpdatePetResponse(Pet pet) {
        this.id = pet.getId();
        this.name = pet.getName();
        this.animalType = pet.getAnimalType();
        this.breed = pet.getBreed();
        this.color = pet.getColor();
        this.weight = pet.getWeight();
        this.dateOfBirth = pet.getDateOfBirth();
    }

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

    public LocalDate getDateOfBirth() {
        return dateOfBirth;
    }

    public void setDateOfBirth(LocalDate dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }
}
