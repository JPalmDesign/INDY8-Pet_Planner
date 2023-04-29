package com.indy8.petplanner.clients;

import com.indy8.petplanner.domain.Client;

public class UpdateClientResponse {
    private Integer id;
    private String firstName;
    private String lastName;
    private String email;
    private long phoneNumber;
    private String address;
    private String city;
    private String state;
    private String zipCode;

    public UpdateClientResponse() {
    }

    public UpdateClientResponse(Integer id, String firstName, String lastName, String email, String phoneNumber, String address, String city, String state, String zipCode) {
        this.id = id;
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.phoneNumber = Long.parseLong(phoneNumber);
        this.address = address;
        this.city = city;
        this.state = state;
        this.zipCode = zipCode;
    }

    public UpdateClientResponse(Client client) {
        this.id = client.getId();
        this.firstName = client.getFirstName();
        this.lastName = client.getLastName();
        this.email = client.getEmail();
        this.phoneNumber = client.getPhoneNumber();
        this.address = client.getAddress();
        this.city = client.getCity();
        this.state = client.getState();
        this.zipCode = String.valueOf(client.getZip());
    }

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

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhoneNumber() {
        return String.valueOf(phoneNumber);
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = Long.parseLong(phoneNumber);
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
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

    public String getZip() {
        return zipCode;
    }

    public void setZip(String zipCode) {
        this.zipCode = zipCode;
    }
}
