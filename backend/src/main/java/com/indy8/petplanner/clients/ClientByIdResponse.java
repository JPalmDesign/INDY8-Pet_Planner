package com.indy8.petplanner.clients;

import java.util.ArrayList;
import java.util.List;

public class ClientByIdResponse {
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

    private List<ClientPet> clientPetList = new ArrayList<>();

    private List<ClientDocument> clientDocumentList = new ArrayList<>();

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

    public List<ClientPet> getClientPetList() {
        return clientPetList;
    }

    public void setClientPetList(List<ClientPet> clientPetList) {
        this.clientPetList = clientPetList;
    }

    public List<ClientDocument> getClientDocumentList() {
        return clientDocumentList;
    }

    public void setClientDocumentList(List<ClientDocument> clientDocumentList) {
        this.clientDocumentList = clientDocumentList;
    }
}
