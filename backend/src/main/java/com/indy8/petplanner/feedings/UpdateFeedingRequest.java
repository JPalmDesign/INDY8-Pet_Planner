package com.indy8.petplanner.feedings;

public class UpdateFeedingRequest {
    private Integer id;
    private String foodType;
    private String brand;
    private Integer quantity;
    private String unitOfMeasure;
    private String timeOfDay;
    private String medicines;
    private String dose;
    private String name;

    public UpdateFeedingRequest() {
    }

    public UpdateFeedingRequest(Integer id, String foodType, String brand, Integer quantity, String unitOfMeasure, String timeOfDay, String medicines, String dose, String name) {
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
}
