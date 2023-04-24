package com.indy8.petplanner.config;

import com.indy8.petplanner.domain.Pet;
import com.indy8.petplanner.pets.*;

import java.util.List;
import java.util.stream.Collectors;

public class PetMapper {
    public Pet mapCreateNewPetRequestToPet(CreateNewPetRequest request) {
        var pet = new Pet();
        pet.setName(request.getName());
        pet.setBreed(request.getBreed());
        pet.setColor(request.getColor());
        pet.setAnimalType(request.getAnimalType());
        pet.setDateOfBirth(request.getDateOfBirth());
        pet.setWeight(request.getWeight());
        return pet;
    }

    public CreateNewPetResponse mapPetToCreateNewPetResponse(Pet pet) {
        var response = new CreateNewPetResponse();
        response.setId(pet.getId());
        response.setName(pet.getName());
        response.setBreed(pet.getBreed());
        response.setColor(pet.getColor());
        response.setClientId(pet.getClient().getId());
        response.setAnimalType(pet.getAnimalType());
        response.setDateOfBirth(pet.getDateOfBirth());
        response.setWeight(pet.getWeight());

        return response;
    }

    public PetByIdResponse mapPetToPetByIdResponse(Pet pet) {
        var response = new PetByIdResponse();
        response.setId(pet.getId());
        response.setName(pet.getName());
        response.setBreed(pet.getBreed());
        response.setColor(pet.getColor());
        response.setClientId(pet.getClient().getId());
        response.setAnimalType(pet.getAnimalType());
        response.setDateOfBirth(pet.getDateOfBirth());
        response.setWeight(pet.getWeight());

        List<PetAppointment> appointments = pet.getAppointments().stream().map(appointment -> {
            var petAppointment = new PetAppointment();
            petAppointment.setId(appointment.getId());
            petAppointment.setName(appointment.getName());
            return petAppointment;
        }).collect(Collectors.toList());

        response.setPetAppointmentList(appointments);

        List<PetDocument> documents = pet.getDocuments().stream().map(document -> {
            var petDocument = new PetDocument();
            petDocument.setId(document.getId());
            petDocument.setName(document.getName());
            return petDocument;
        }).collect(Collectors.toList());

        response.setPetDocumentList(documents);

        List<PetFeeding> feedings = pet.getFeedings().stream().map(feeding -> {
            var petFeeding = new PetFeeding();
            petFeeding.setId(feeding.getId());
            petFeeding.setName(feeding.getName());
            return petFeeding;
        }).collect(Collectors.toList());

        response.setPetFeedingList(feedings);

        return response;
    }

    public UpdatePetResponse mapPetToUpdatePetResponse(Pet pet) {
        var response = new UpdatePetResponse();
        response.setId(pet.getId());
        response.setName(pet.getName());
        response.setBreed(pet.getBreed());
        response.setColor(pet.getColor());
        response.setAnimalType(pet.getAnimalType());
        response.setDateOfBirth(pet.getDateOfBirth());
        response.setWeight(pet.getWeight());

        return response;
    }
}
