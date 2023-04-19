package com.indy8.petplanner.domain;

import jakarta.persistence.*;

import java.math.BigDecimal;
import java.time.Duration;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;


@Entity
public class Feeding {
    @Id
    @GeneratedValue(strategy= GenerationType.AUTO)
    private Integer id;                  //Auto generate unique identifier
    private String foodType; // Kibble, Canned
    private String brand;
    private String quantity;
    private String unitOfMeasure;   //Cups, Tablespoons, Teaspoons
    private String timeOfDay;   // AM, Noon, PM
    private String medicines;
    private String dose;
    private String name;               // Might be a compiled field of PetName, timeOfDay

    @ManyToOne
    private Pet pet;

    public int getId() {return id;}

    public void setId(int id) {this.id = id;}

    public String getFoodType() {return foodType;}

    public void setFoodType(String foodType) {this.foodType = foodType;}

    public String getBrand() {return brand;}

    public void setBrand(String brand) {this.brand = brand;}

    public String getQuantity() {return quantity;}

    public void setQuantity(String quantity) {this.quantity = quantity;}

    public String getUnitOfMeasure() {return unitOfMeasure;}

    public void setUnitOfMeasure(String unitOfMeasure) {this.unitOfMeasure = unitOfMeasure;}

    public String getTimeOfDay() {return timeOfDay;}

    public void setTimeOfDay(String timeOfDay) {this.timeOfDay = timeOfDay;}

    public String getMedicines() {return medicines;}

    public void setMedicines(String medicines) {this.medicines = medicines;}

    public String getDose() {return dose;}

    public void setDose(String dose) {this.dose = dose;}

    public String getName() {return name;}

    public void setName(String name) {this.name = name;}

    public Pet getPet() {
        return pet;
    }

    public void setPet(Pet pet) {
        this.pet = pet;
    }
}
