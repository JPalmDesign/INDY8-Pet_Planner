package com.indy8.petplanner.domain;

import jakarta.persistence.*;

import java.util.ArrayList;
import java.util.List;

@Entity
public class Client {
    // TODO: Update with Email, Preferred Contact type and Country. (are you sure we want to country?)
    @Id
    @GeneratedValue(strategy= GenerationType.AUTO)
    private Integer id;                     //Auto generate unique identifier
    private String firstName;
    private char middleInitial;
    private String lastName;
    private long phoneNumber;
    private String addressLine1;
    private String addressLine2;
    private String city;
    private String state;               //Need UI to code the list of states as a drop down list
    private int zip;

    @OneToMany(cascade = CascadeType.ALL, orphanRemoval = true, mappedBy = "client")
    private List<Pet> pets = new ArrayList<>();// Auto generate a random 8 digit/alpha string with C at the front

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public char getMiddleInitial() {
        return middleInitial;
    }

    public void setMiddleInitial(char middleInitial) {
        this.middleInitial = middleInitial;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public long getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(long phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getAddressLine1() {
        return addressLine1;
    }

    public void setAddressLine1(String addressLine1) {
        this.addressLine1 = addressLine1;
    }

    public String getAddressLine2() {
        return addressLine2;
    }

    public void setAddressLine2(String addressLine2) {
        this.addressLine2 = addressLine2;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public int getZip() {
        return zip;
    }

    public void setZip(int zip) {
        this.zip = zip;
    }

    public List<Pet> getPets() {
        return pets;
    }

    public void setPets(List<Pet> pets) {
        this.pets = pets;
    }

    public void addPet(Pet pet) {
        pets.add(pet);
        pet.setClient(this);
    }

    public void removePet(Pet pet) {
        pets.remove(pet);
        pet.setClient(null);
    }
}
