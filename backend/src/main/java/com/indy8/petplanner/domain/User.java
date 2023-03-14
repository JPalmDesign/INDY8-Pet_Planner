package com.indy8.petplanner.domain;

public class User {
    String id;                  //Auto generate unique identifier
    String firstName;
    String lastName;
    String email;
    String username;
    String password;        //Placeholder -- DO NOT STORE PLAIN TEXT PASSWORDS

    public User() {
        id = "U";       // Auto generate a random 8 digit/alpha string with U at the front
    }
}
