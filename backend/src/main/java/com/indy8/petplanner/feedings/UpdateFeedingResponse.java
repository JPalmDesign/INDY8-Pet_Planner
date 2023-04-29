package com.indy8.petplanner.feedings;

public class UpdateFeedingResponse {
    private Integer id;
    private String foodType;
    private String brand;
    private Integer quantity;
    private String unitOfMeasure;
    private String timeOfDay;
    private String medicines;
    private String dose;
    private String name;

    public UpdateFeedingResponse() {
    }

    public UpdateFeedingResponse(Integer id, String foodType, String brand, Integer quantity, String unitOfMeasure, String timeOfDay, String medicines, String dose, String name) {
        this.id = id;
        this.foodType = foodType;
        this.brand = brand;
        this.quantity = quantity;
        this.unitOfMeasure = unitOfMeasure;
        this.timeOfDay = timeOfDay;
        this.medicines = medicines;
        this.dose = dose;
        this.name = name;
    }

    public Integer getId() {
        return id;
    }

    public String getFoodType() {
        return foodType;
    }

    public String getBrand() {
        return brand;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public String getUnitOfMeasure() {
        return unitOfMeasure;
    }

    public String getTimeOfDay() {
        return timeOfDay;
    }

    public String getMedicines() {
        return medicines;
    }

    public String getDose() {
        return dose;
    }

    public String getName() {
        return name;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public void setFoodType(String foodType) {this.foodType = foodType;}

    public void setBrand(String brand) {this.brand = brand;}

    public void setQuantity(Integer quantity) {this.quantity = quantity;}

    public void setUnitOfMeasure(String unitOfMeasure) {this.unitOfMeasure = unitOfMeasure;}

    public void setTimeOfDay(String timeOfDay) {this.timeOfDay = timeOfDay;}

    public void setMedicines(String medicines) {this.medicines = medicines;}

    public void setDose(String dose) {this.dose = dose;}

    public void setName(String name) {this.name = name;}
}
