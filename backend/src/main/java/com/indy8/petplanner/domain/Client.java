package com.indy8.petplanner.domain;

public class Client {
    String id;                  //Auto generate unique identifier
    String firstName;
    char middleInitial;
    String lastName;
    long phoneNumber;
    String addressLine1;
    String addressLine2;
    String city;
    String state;               //Need UI to code the list of states as a drop down list
    int zip;

    public Client() {
        id = "C";       // Auto generate a random 8 digit/alpha string with C at the front
    }

}
