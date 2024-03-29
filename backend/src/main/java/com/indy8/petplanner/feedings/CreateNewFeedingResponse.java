package com.indy8.petplanner.feedings;

public class CreateNewFeedingResponse {
    private int id;
    private String foodType; // Kibble, Canned
    private String brand;
    private Integer quantity;
    private String unitOfMeasure;   //Cups, Tablespoons, Teaspoons
    private String timeOfDay;   // AM, Noon, PM
    private String medicines;
    private String dose;
    private String name;               // Might be a compiled field of PetName, timeOfDay

    public int getId() {return id;}

    public void setId(int id) {this.id = id;}

    public String getFoodType() {return foodType;}

    public void setFoodType(String foodType) {this.foodType = foodType;}

    public String getBrand() {return brand;}

    public void setBrand(String brand) {this.brand = brand;}

    public Integer getQuantity() {return quantity;}

    public void setQuantity(Integer quantity) {this.quantity = quantity;}

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
}
