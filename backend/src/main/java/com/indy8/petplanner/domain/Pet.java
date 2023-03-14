package com.indy8.petplanner.domain;

import java.time.LocalDate; // import the LocalDate class
import java.time.format.DateTimeFormatter; // Import the DateTimeFormatter class

public class Pet {
    String id;                  //Auto generate unique identifier
    String clientId;            //Connects pet owner to pet
    String name;
    String animalType;          //Need UI to code the list of types as a drop down list
        // Dog, Cat, Rabbit, Ferret ???
    String breed;
    String color;
    String weight;
    String playgroup;
    LocalDate dateOfBirth;           // Need to convert to useable date.

    public Pet() {
        id = "P";       // Auto generate a random 8 digit/alpha string with P at the front
    }
}
